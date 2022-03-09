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
                    ),
                    TextInputWidget(
                      isObscure: seePass,
                      onChanged: widget.controller.setPassword,
                      value: widget.controller.password.value,
                      labelText: 'Senha:',
                      placeholder: '* * * *',
                      // validate: (value) => StringUtil.isNullOrEmpty(value)
                      //     ? "Digite sua senha"
                      //     : null,
                      suffix: IconButton(
                        icon:
                            Icon(!seePass ? Icons.remove_red_eye : Icons.close),
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
                    DefaultButton(
                      onPress: () async {
                        if (_formKey.currentState?.validate() == true) {}
                      },
                      buttonText: 'Logar agora',
                    ),
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
}
