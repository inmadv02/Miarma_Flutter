import 'package:flutter/material.dart';

import 'package:miarma_app_flutter/src/repository/auth_repository/auth_repository.dart';
import 'package:miarma_app_flutter/src/repository/auth_repository/auth_repository_impl.dart';
import 'package:miarma_app_flutter/src/repository/constants.dart';
import 'package:miarma_app_flutter/src/ui/pages/home_page.dart';
import 'package:miarma_app_flutter/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:miarma_app_flutter/utils/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '../../login/bloc/login_bloc.dart';
import '../../models/auth/loginDTO.dart';
import 'menu_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late AuthRepository authRepository;

  @override
  void initState() {
    authRepository = AuthRepositoryImpl();
    PreferenceUtils.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return LoginBloc(authRepository);
      },
      child: _body(context),
    );
  }

  _body(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: BlocConsumer<LoginBloc, LoginState>(
                listenWhen: (context, state) {
          return state is LoginSuccessState || state is LoginErrorState;
        }, listener: (context, state) {
          if (state is LoginSuccessState) {
            PreferenceUtils.setString(
                Constants.token, state.loginResponse.token);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MenuPage()),
            );
          } else if (state is LoginErrorState) {
            _errorMessage(context, state.message);
          }
        }, buildWhen: (context, state) {
          return state is LoginInitialState || state is LoginLoadingState;
        }, builder: (ctx, state) {
          if (state is LoginInitialState) {
            return _loginBody(ctx);
          } else if (state is LoginLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return _loginBody(ctx);
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

  Widget _loginBody(BuildContext context) {
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
                  child: Text('Miarmagram', style: Styles.textTitleCustom(40)),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
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
                    validator: (String? value) {
                      return (value == null || value.isEmpty)
                          ? 'Rellene este campo.'
                          : null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
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
                      return (value == null || value.isEmpty)
                          ? 'Introduzca su contraseña'
                          : null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(width, height),
                          primary: Styles.azulMenu),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final loginDto = LoginDto(
                              nickname: nicknameController.text,
                              password: passwordController.text);
                          BlocProvider.of<LoginBloc>(context)
                              .add(DoLoginEvent(loginDto));
                        }
                      },
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
