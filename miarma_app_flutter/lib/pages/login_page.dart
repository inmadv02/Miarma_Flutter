import 'package:flutter/material.dart';
import 'package:miarma_app_flutter/styles.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 40, 16, 30),
                  child: Text('Instagram', style: Styles.textTitleCustom(40)),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Nombre usuario o correo',
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
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Password',
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
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(width, height),
                          primary: Styles.azulMenu),
                      onPressed: (() =>
                          Navigator.pushNamed(context, '/home-page')),
                      child: const Text('Iniciar sesión',
                          style: TextStyle(fontSize: 17))),
                ),
                const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Text('¿Has olvidado tu contraseña?',
                      style: TextStyle(
                          color: Styles.azulLetraLogin,
                          fontWeight: FontWeight.w500)),
                ),
                const SizedBox(height: 20),
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
                  padding: const EdgeInsets.fromLTRB(8, 30, 8, 8),
                  child: SocialLoginButton(
                    width: MediaQuery.of(context).size.width * 0.9,
                    backgroundColor: Styles.azulMenu,
                    text: 'Inicia sesión con Facebook',
                    buttonType: SocialLoginButtonType.facebook,
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: InkWell(
                    onTap: (() => Navigator.pushNamed(context, '/sign-in')),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: '¿No tienes cuenta?',
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Regístrate',
                              style: TextStyle(
                                  color: Styles.azulLetraLogin,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ))));
  }
}
