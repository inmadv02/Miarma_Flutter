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
                    margin: const EdgeInsets.fromLTRB(10, 12, 8, 4),
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
                                padding: EdgeInsets.all(7.0),
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
                              const Padding(
                                padding: EdgeInsets.only(top: 19),
                                child: Text(
                                  "483",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(7.0),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: const Text("Seguidores",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 15)),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 19),
                                child: Text(
                                  "324",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(7.0),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: const Text("Siguiendo",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 15)),
                                ),
                              ),
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
                      style:
                          TextStyle(color: Color.fromARGB(255, 110, 110, 110)),
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
                    child: const Text(
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
                children: [
                  GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                    crossAxisCount: 3,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text("He'd have you all unravel at the"),
                        color: Colors.teal[100],
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text('Heed not the rabble'),
                        color: Colors.teal[200],
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text('Sound of screams but the'),
                        color: Colors.teal[300],
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text('Who scream'),
                        color: Colors.teal[400],
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text('Revolution is coming...'),
                        color: Colors.teal[500],
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text('Revolution, they...'),
                        color: Colors.teal[600],
                      ),
                    ],
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
