import 'package:boticario_app/common/services/alert_service.dart';
import 'package:boticario_app/common/services/navigation_service.dart';
import 'package:boticario_app/common/widgets/default_button.dart';
import 'package:boticario_app/common/widgets/text_input_widget.dart';
import 'package:boticario_app/modules/posts/controllers/new_post_controller.dart';
import 'package:boticario_app/modules/posts/views/validations/validate_post.dart';
import 'package:flutter/material.dart';

import '../../../common/enuns/controller_state.dart';
import '../../../common/widgets/observable.dart';

class NewPostPage extends StatefulWidget {
  final NewPostsController controller;
  const NewPostPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<NewPostPage> createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "No que você está pensando?",
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: TextInputWidget(
                autoFocus: true,
                labelText: 'Digite aqui suas ideias!',
                minLines: 1,
                maxLines: 10,
                maxLength: 280,
                validate: (value) => ValidatePost()(value),
                onChanged: widget.controller.setContent,
              ),
            ),
            Observable(() {
              if (widget.controller.stateEqualsTo(ControllerState.loading)) {
                return const Center(child: CircularProgressIndicator());
              }
              return DefaultButton(
                onPress: sendPost,
                buttonText: 'Publicar',
              );
            }),
          ],
        ),
      )),
    );
  }

  sendPost() {
    if (_formKey.currentState?.validate() == false) {
      return;
    }
    widget.controller.sendPost();
    AlertService.sendSnackBar(
        context: context, message: "Post criado", onPressed: () {});
    NavigationService.pop();
  }
}
