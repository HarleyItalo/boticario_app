import 'package:boticario_app/common/services/alert_service.dart';
import 'package:boticario_app/common/services/navigation_service.dart';
import 'package:boticario_app/modules/register_user/views/validations/validate_confirmation_password.dart';
import 'package:boticario_app/modules/register_user/views/validations/validate_email.dart';
import 'package:flutter/material.dart';

import '../../../common/enuns/controller_state.dart';
import '../../../common/widgets/default_button.dart';
import '../../../common/widgets/observable.dart';
import '../../../common/widgets/text_input_widget.dart';
import '../../app/routes/routes.dart';
import '../controllers/register_user_controller.dart';
import 'validations/validate_password.dart';
import 'validations/validate_user.dart';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({Key? key, required this.controller})
      : super(key: key);

  final RegisteUserController controller;

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  final _formKey = GlobalKey<FormState>();

  bool seePass = true;

  late FocusNode userFocusNode;

  @override
  void initState() {
    super.initState();
    userFocusNode = FocusNode();
  }

  @override
  void dispose() {
    widget.controller.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text(
              "Junte-se a nós",
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
                      onChanged: widget.controller.setName,
                      value: widget.controller.name.value,
                      labelText: 'Nome',
                      placeholder: 'Seu nome',
                      validate: (value) => ValidateUser()(value),
                    ),
                    TextInputWidget(
                      onChanged: widget.controller.setEmail,
                      value: widget.controller.email.value,
                      labelText: 'Email',
                      placeholder: 'Seu e-mail',
                      validate: (value) => ValidadeEmail()(value),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: Text(
                        "Agora digite seus dados de acesso",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    TextInputWidget(
                      onChanged: widget.controller.setUser,
                      value: widget.controller.user.value,
                      labelText: 'Nome de usuário',
                      placeholder: 'Seu nome usuário',
                      focusNode: userFocusNode,
                      validate: (value) => ValidateUser()(value),
                    ),
                    TextInputWidget(
                      isObscure: seePass,
                      onChanged: widget.controller.setPassword,
                      value: widget.controller.password.value,
                      labelText: 'Senha',
                      placeholder: '* * * *',
                      validate: (value) => ValidatePassword()(value),
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
                    TextInputWidget(
                      isObscure: seePass,
                      onChanged: widget.controller.setConfirmationPass,
                      value: widget.controller.confirmationPass.value,
                      labelText: 'Confirme a Senha',
                      placeholder: '* * * *',
                      validate: (value) => ValidateConfimationPassword()(
                        value,
                        widget.controller.password.value,
                      ),
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
                      height: 30,
                    ),
                    Observable(() {
                      if (widget.controller
                          .stateEqualsTo(ControllerState.loading)) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return DefaultButton(
                        onPress: processRegister,
                        buttonText: 'Cadastrar-se',
                      );
                    }),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  processRegister() async {
    if (_formKey.currentState?.validate() == false) {
      return;
    }
    var result = await widget.controller.registerUser();

    if (result.success) {
      AlertService.sendSnackBar(
          context: context, message: result.message, onPressed: () {});
      NavigationService.pushNamed(Routes.login);
      return;
    }
    AlertService.sendSnackBar(
      context: context,
      message: result.message,
      error: !result.success,
      onPressed: () {
        userFocusNode.requestFocus();
      },
    );
  }
}
