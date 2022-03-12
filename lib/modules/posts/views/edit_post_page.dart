import 'package:boticario_app/common/services/alert_service.dart';
import 'package:boticario_app/common/services/navigation_service.dart';
import 'package:boticario_app/common/widgets/default_button.dart';
import 'package:boticario_app/common/widgets/text_input_widget.dart';
import 'package:boticario_app/modules/posts/domain/models/post_model.dart';
import 'package:boticario_app/modules/posts/views/validations/validate_post.dart';
import 'package:flutter/material.dart';
import '../../../common/enuns/controller_state.dart';
import '../../../common/widgets/observable.dart';
import '../controllers/all_posts_controller.dart';
import '../controllers/edit_post_controller.dart';

class EditPostPage extends StatefulWidget {
  final EditPostController controller;
  final AllPostsController allPostsController;
  const EditPostPage({
    Key? key,
    required this.controller,
    required this.allPostsController,
  }) : super(key: key);

  @override
  State<EditPostPage> createState() => _EditPostPageState();
}

class _EditPostPageState extends State<EditPostPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.controller.setPost(NavigationService.getArgs(context));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Editar o post",
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
                  labelText: 'Altere aqui sua ideia!',
                  minLines: 1,
                  maxLines: 10,
                  maxLength: 280,
                  value: widget.controller.postContent,
                  validate: (value) => ValidatePost()(value),
                  onChanged: widget.controller.setContent,
                ),
              ),
              Observable(() {
                if (widget.controller.stateEqualsTo(
                  ControllerState.loading,
                )) {
                  return const Center(child: CircularProgressIndicator());
                }
                return DefaultButton(
                  onPress: editPost,
                  buttonText: 'Atualizar publicação',
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  editPost() async {
    if (_formKey.currentState?.validate() == false) {
      return;
    }
    var post = await widget.controller.submitEdit();
    widget.allPostsController.posts
        .removeWhere((element) => element.id == post.id);
    widget.allPostsController.posts.add(post);
    AlertService.sendSnackBar(
      context: context,
      message: "Post alterado com sucesso!",
      onPressed: () {},
    );
    NavigationService.pop();
  }
}
