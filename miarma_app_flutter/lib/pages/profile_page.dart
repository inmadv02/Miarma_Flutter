import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miarma_app_flutter/widgets/profile_app_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 1;
    double height = MediaQuery.of(context).size.height * 0.02;

    return Scaffold(
      appBar: const ProfileAppBar(),
      body: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    width: 95.0,
                    height: 95.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/avatar.png')),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 19),
                                child: Text(
                                  "3",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(9.0),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: const Text("Publicaciones",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 15)),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "483",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 18),
                                ),
                              ),
                              const Text(
                                "Seguidores",
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    /*Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const FollowPage()));*/
                                  },
                                  child: const Text("324",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black))),
                              const Text("Siguiendo"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 12, 1, 3),
                    child: Text("Inma Domínguez",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 3, 1, 8),
                    child: Text(
                      "Developer",
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 9.0),
                    child: Text(
                      "Sevilla, España",
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      fixedSize: Size(width, height),
                    ),
                    child: Text(
                      'Editar perfil',
                      style: TextStyle(color: Colors.black),
                    )),
              )
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset('assets/icons/Vector.svg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset('assets/icons/Union.svg'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: 90,
                      height: 150,
                      child: const Image(
                        image: AssetImage("assets/images/post1.jpg"),
                        fit: BoxFit.contain,
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                      width: 100,
                      height: 150,
                      child: const Image(
                        image: AssetImage("assets/images/post1.jpg"),
                        fit: BoxFit.contain,
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                      width: 120,
                      height: 150,
                      child: const Image(
                        image: AssetImage("assets/images/post1.jpg"),
                        fit: BoxFit.contain,
                      ))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
