import 'package:flutter/material.dart';
import 'package:miarma_app_flutter/styles.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
                    child: TextFormField(
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
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 30),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(width, height),
                            primary: Styles.azulMenu),
                        onPressed: () {},
                        child: const Text('Registrarse',
                            style: TextStyle(fontSize: 17))),
                  ),
                ],
              ),
            )));
  }
}
