import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:miarma_app_flutter/src/blocs/posts/post_bloc.dart';
import 'package:miarma_app_flutter/src/models/posts/create_post_dto.dart';
import 'package:miarma_app_flutter/src/repository/posts_repository/post_repository.dart';
import 'package:miarma_app_flutter/src/repository/posts_repository/posts_repository_impl.dart';
import 'package:miarma_app_flutter/src/ui/pages/home_page.dart';
import 'package:miarma_app_flutter/src/ui/pages/menu_page.dart';
import 'package:miarma_app_flutter/utils/shared_preferences.dart';

import '../../../styles.dart';
import '../../../widgets/error_page.dart';
import '../../blocs/image/bloc/image_bloc.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController textController = TextEditingController();
  TextEditingController urlPhoto1Controller = TextEditingController();
  TextEditingController urlPhoto2Controller = TextEditingController();
  TextEditingController visibilityController = TextEditingController();
  late PostRepository postRepository;
  String filePath = ' ';
  List<String> visibilidad = ['PUBLIC', 'PRIVATE'];
  String dropdownvalue = 'PUBLIC';

  @override
  void initState() {
    postRepository = PostRepositoryImpl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => PostBloc(postRepository)),
      BlocProvider(create: (context) => ImageBloc())
    ], child: Scaffold(body: _body(context)));
  }

  Widget _body(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child:
                BlocConsumer<PostBloc, PostState>(listenWhen: (context, state) {
          return state is PostCreated || state is PostCreatedError;
        }, listener: (context, state) {
          if (state is PostCreated) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          } else if (state is PostCreatedError) {
            _errorMessage(context, state.message);
          }
        }, buildWhen: (context, state) {
          return state is PostInitial;
        }, builder: (ctx, state) {
          if (state is PostInitial) {
            return _createPost(ctx);
          } else {
            return _createPost(ctx);
          }
        })),
      ),
    );
  }

  void _errorMessage(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget _createPost(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;
    double height = MediaQuery.of(context).size.height * 0.07;

    return Scaffold(
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.width * 0.2),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child:
                        Text('Miarmagram', style: Styles.textTitleCustom(40)),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Crea una nueva publicación',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Styles.azulLetraLogin,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                  ),
                  Row(children: <Widget>[
                    const Expanded(
                        child: Divider(
                      thickness: 2,
                      color: Colors.grey,
                      indent: 20,
                      endIndent: 6,
                    )),
                    Text(" O ",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.grey[600])),
                    const Expanded(
                        child: Divider(
                      thickness: 2,
                      color: Colors.grey,
                      indent: 6,
                      endIndent: 20,
                    )),
                  ]),
                  BlocConsumer<ImageBloc, ImageState>(
                    listenWhen: (context, state) {
                      return state is ImageSelectedSuccessState;
                    },
                    listener: (context, state) {},
                    buildWhen: (context, state) {
                      return state is ImageInitial ||
                          state is ImageSelectedSuccessState;
                    },
                    builder: (context, state) {
                      if (state is ImageSelectedSuccessState) {
                        filePath = state.pickedFile.path;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Image.file(
                                File(state.pickedFile.path),
                                fit: BoxFit.fill,
                              )),
                        );
                      }
                      return Padding(
                          padding: const EdgeInsets.fromLTRB(15, 30, 15, 30),
                          child: ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<ImageBloc>(context).add(
                                    const SelectImageEvent(
                                        ImageSource.gallery));
                              },
                              child: const Text('Elegir imagen')));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      maxLines: 8,
                      controller: textController,
                      decoration: InputDecoration(
                          labelText: 'Pie de foto o descripción',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4.0)),
                            borderSide: BorderSide(color: Colors.grey[400]!),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4.0)),
                            borderSide: BorderSide(color: Colors.grey[400]!),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 11),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.grey[400]!),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4.0)),
                      ),
                      child: DropdownButton(
                        isExpanded: true,
                        value: dropdownvalue,
                        underline: Container(color: Colors.grey[200]),
                        dropdownColor: Colors.grey[200],
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                        items: visibilidad
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        style: TextStyle(color: Colors.grey[700], fontSize: 16),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 30),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(width, height),
                            primary: Styles.azulMenu),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final postDTO = CreatePostDTO(
                                titulo: PreferenceUtils.getString('nickname')
                                    .toString(),
                                texto: textController.text,
                                visibilidad: dropdownvalue,
                                urlFoto: filePath,
                                urlFoto2: filePath);
                            BlocProvider.of<PostBloc>(context)
                                .add(CreatePostsEvent(postDTO, filePath));
                          }
                        },
                        child: const Text('Publicar',
                            style: TextStyle(fontSize: 17))),
                  ),
                ],
              ),
            )));
  }
}
