import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miarma_app_flutter/src/models/get-post-dto.dart';

import '../../../widgets/home_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GetPostDTO post = GetPostDTO(
      id: 1,
      titulo: "inma_dv",
      texto: "Post chulísimo",
      urlFoto: 'assets/images/post1.jpg',
      urlFoto2: 'assets/images/post1.jpg',
      visibilidad: "Público",
      nickname: "inma_dv",
      fotoPerfil: 'assets/images/avatar.png',
      likes: 100);

  GetPostDTO post2 = GetPostDTO(
      id: 2,
      titulo: "inma_dv",
      texto: "Post chulísimo 2",
      urlFoto: 'assets/images/post1.jpg',
      urlFoto2: 'assets/images/post1.jpg',
      visibilidad: "Público",
      nickname: "inma_dv",
      fotoPerfil: 'assets/images/avatar.png',
      likes: 100);

  GetPostDTO post3 = GetPostDTO(
      id: 3,
      titulo: "inma_dv",
      texto: "Post chulísimo",
      urlFoto: 'assets/images/post1.jpg',
      urlFoto2: 'assets/images/post1.jpg',
      visibilidad: "Público",
      nickname: "inma_dv",
      fotoPerfil: 'assets/images/avatar.png',
      likes: 100);

  late List<GetPostDTO> listaPostDTO;

  @override
  void initState() {
    listaPostDTO = [post, post2, post3];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: const HomeAppBar(), body: _postList());
  }

  Widget _postList() {
    return ListView.builder(
      itemCount: listaPostDTO.length,
      itemBuilder: (context, index) {
        return _postItem(listaPostDTO.elementAt(index));
      },
    );
  }

  Widget _postItem(GetPostDTO postDTO) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 170, 170, 170))),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.07,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.08,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          postDTO.fotoPerfil.toString())))),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(postDTO.nickname,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700)))
                      ],
                    ),
                    const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.more_vert)),
                  ],
                )),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(postDTO.urlFoto, fit: BoxFit.cover)),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: SvgPicture.asset('assets/icons/heart.svg')),
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: SvgPicture.asset('assets/icons/comment.svg'),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: SvgPicture.asset('assets/icons/share.svg')),
                    ],
                  )),
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset('assets/icons/bookmark.svg'),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(postDTO.likes.toString() + ' likes',
                  style: const TextStyle(fontWeight: FontWeight.w800)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 20),
              child: RichText(
                  text: TextSpan(
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w700),
                      text: postDTO.nickname,
                      children: <TextSpan>[
                    TextSpan(
                        text: ' ' + postDTO.texto,
                        style: const TextStyle(fontWeight: FontWeight.normal))
                  ])),
            )
          ],
        ));
  }
}
