import 'package:boticario_app/common/widgets/default_button.dart';
import 'package:boticario_app/common/widgets/text_input_widget.dart';
import 'package:boticario_app/modules/posts/views/validations/validate_post.dart';
import 'package:flutter/material.dart';

class NewPostPage extends StatelessWidget {
  const NewPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "No quê você está pensando?",
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            TextInputWidget(
                autoFocus: true,
                labelText: 'Digite aqui suas ideias!',
                minLines: 5,
                maxLines: 10,
                maxLength: 280,
                validate: (value) => ValidatePost()(value),
                onChanged: (value) {}),
            DefaultButton(onPress: () {}, buttonText: "Publicar")
          ],
        ),
      )),
    );
  }
}
