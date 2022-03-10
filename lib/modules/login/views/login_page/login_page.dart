import 'package:boticario_app/common/enuns/controller_state.dart';
import 'package:boticario_app/common/services/alert_service.dart';
import 'package:boticario_app/common/widgets/observable.dart';
import 'package:boticario_app/modules/login/views/login_page/validations/password_validadation.dart';
import 'package:boticario_app/modules/login/views/login_page/validations/username_validation.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/default_button.dart';
import '../../../../common/widgets/text_input_widget.dart';
import '../../controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  final LoginController controller;
  const LoginPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool seePass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text(
              "Faça seu login ou cadastro",
              textAlign: TextAlign.center,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextInputWidget(
                      onChanged: widget.controller.setUser,
                      value: widget.controller.user.value,
                      labelText: 'Login:',
                      placeholder: 'Seu usuário',
                      validate: (value) => UsernameValidation()(value),
                    ),
                    TextInputWidget(
                      isObscure: seePass,
                      onChanged: widget.controller.setPassword,
                      value: widget.controller.password.value,
                      labelText: 'Senha:',
                      placeholder: '* * * *',
                      validate: (value) => PasswordValidation()(value),
                      suffix: IconButton(
                        icon:
                            Icon(!seePass ? Icons.close : Icons.remove_red_eye),
                        onPressed: () {
                          setState(() {
                            seePass = !seePass;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Observable(() {
                      if (widget.controller
                          .stateEqualsTo(ControllerState.loading)) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return DefaultButton(
                        onPress: processLogin,
                        buttonText: 'Logar agora',
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: TextButton(
                        onPressed: widget.controller.navigateToRegister,
                        child: const Text(
                          'Ainda não tem cadastro?\n Cadastre agora',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  processLogin() async {
    if (_formKey.currentState?.validate() == true) {
      var reponse = await widget.controller.makeLogin();
      if (reponse) {
        return;
      }
      AlertService.sendSnackBar(
          context: context,
          error: true,
          message: 'Usuario ou Senha incorretos tente novamente.',
          onPressed: () {});
    }
  }
}
