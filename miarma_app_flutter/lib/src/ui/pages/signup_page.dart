import 'dart:io';

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:miarma_app_flutter/src/models/register/registerDTO.dart';
import 'package:miarma_app_flutter/src/repository/register_repository/register_repository.dart';
import 'package:miarma_app_flutter/src/repository/register_repository/register_repository_impl.dart';
import 'package:miarma_app_flutter/src/ui/pages/login_page.dart';
import 'package:miarma_app_flutter/styles.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '../../blocs/image/bloc/image_bloc.dart';
import '../../blocs/register/bloc/register_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  late DateTime birthDate;
  TextEditingController photoController = TextEditingController();
  TextEditingController visibilityController = TextEditingController();
  late RegisterRepository registerRepository;
  List<String> visibilidad = ['PUBLIC', 'PRIVATE'];
  String dropdownvalue = 'PUBLIC';
  String filePath = ' ';

  @override
  void initState() {
    registerRepository = RegisterRepositoryImpl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => RegisterBloc(registerRepository)),
      BlocProvider(create: (context) => ImageBloc())
    ], child: Scaffold(body: _body(context)));
  }

  _body(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: BlocConsumer<RegisterBloc, RegisterState>(
                listenWhen: (context, state) {
          return state is RegisterSuccessState || state is RegisterErrorState;
        }, listener: (context, state) {
          if (state is RegisterSuccessState) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          } else if (state is RegisterErrorState) {
            _errorMessage(context, state.message);
          }
        }, buildWhen: (context, state) {
          return state is RegisterInitial || state is RegisterLoadingState;
        }, builder: (ctx, state) {
          if (state is RegisterInitial) {
            return _registerBody(ctx);
          } else if (state is RegisterLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return _registerBody(ctx);
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

  Widget _registerBody(BuildContext context) {
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Regístrate para ver fotos y vídeos de tus amigos.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(1, 30, 1, 30),
                    child: SocialLoginButton(
                      width: MediaQuery.of(context).size.width * 0.9,
                      backgroundColor: Styles.azulMenu,
                      text: 'Inicia sesión con Facebook',
                      buttonType: SocialLoginButtonType.facebook,
                      onPressed: () {},
                    ),
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
                        return Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(15, 30, 15, 15),
                              child: Text(
                                'Foto de perfil',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  child: Image.file(
                                    File(state.pickedFile.path),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          ],
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
                      controller: emailController,
                      decoration: InputDecoration(
                          labelText: 'Número de teléfono o email',
                          filled: true,
                          fillColor: Colors.grey[200],
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
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                          labelText: 'Nombre completo',
                          filled: true,
                          fillColor: Colors.grey[200],
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
                    child: TextFormField(
                      controller: nicknameController,
                      decoration: InputDecoration(
                          labelText: 'Nombre usuario',
                          filled: true,
                          fillColor: Colors.grey[200],
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
                    child: TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                          labelText: 'Contraseña',
                          filled: true,
                          fillColor: Colors.grey[200],
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
                    child: TextFormField(
                      obscureText: true,
                      controller: password2Controller,
                      decoration: InputDecoration(
                          labelText: 'Confirmar contraseña',
                          filled: true,
                          fillColor: Colors.grey[200],
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
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0xfff1f1f5),
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: DateTimeFormField(
                        initialDate: DateTime(2001, 3, 2),
                        firstDate: DateTime.utc(1922),
                        lastDate: DateTime.now(),
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.black45),
                          errorStyle: TextStyle(color: Colors.redAccent),
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.event_note),
                          labelText: 'Fecha Nacimiento',
                        ),
                        mode: DateTimeFieldPickerMode.date,
                        autovalidateMode: AutovalidateMode.always,
                        validator: (e) => (e?.day ?? 0) == 1
                            ? 'Please not the first day'
                            : null,
                        onDateSelected: (DateTime value) {
                          birthDate = value;
                        },
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
                            final registerDTO = RegisterDTO(
                                nickname: nicknameController.text,
                                fullname: nameController.text,
                                avatar: filePath,
                                email: emailController.text,
                                visibilidad: dropdownvalue,
                                fechaNacimiento: birthDate,
                                password: passwordController.text,
                                password2: password2Controller.text);
                            BlocProvider.of<RegisterBloc>(context)
                                .add(DoRegisterEvent(registerDTO, filePath));
                          }
                        },
                        child: const Text('Registrarse',
                            style: TextStyle(fontSize: 17))),
                  ),
                ],
              ),
            )));
  }
}
