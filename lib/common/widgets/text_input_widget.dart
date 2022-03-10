import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final String labelText;
  final bool isObscure;
  final IconData? icon;
  final void Function(String text) onChanged;
  final TextInputType keyboardtype;
  final dynamic validate;
  final String mask;
  final String placeholder;
  final dynamic value;
  final String? prefix;
  final Widget? suffix;
  final bool autoFocus;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final TextAlign? inputTextAlign;
  final FocusNode? focusNode;

  const TextInputWidget({
    Key? key,
    required this.labelText,
    this.icon,
    required this.onChanged,
    this.keyboardtype = TextInputType.text,
    this.value,
    this.validate,
    this.prefix,
    this.mask = "",
    this.suffix,
    this.inputTextAlign,
    this.isObscure = false,
    this.autoFocus = false,
    this.placeholder = '',
    this.focusNode,
    this.maxLength,
    this.minLines,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var field = TextFormField(
      obscureText: isObscure,
      controller: mountController(),
      enableSuggestions: true,
      autofocus: autoFocus,
      focusNode: focusNode,
      autocorrect: false,
      validator: validate,
      maxLength: maxLength,
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        prefixText: prefix,
        suffixIcon: suffix,
        hintText: placeholder,
        icon: (icon != null)
            ? Icon(
                icon,
                color: Theme.of(context).iconTheme.color,
              )
            : null,
      ),
      keyboardType: keyboardtype,
    );
    return SizedBox(
        key: key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20,
            ),
            field,
            const SizedBox(
              height: 20,
            )
          ],
        ));
  }

  mountController() {
    TextEditingController controller;
    controller = TextEditingController(text: value);
    addListener(controller);
    return controller;
  }

  addListener(controller) {
    controller.addListener(() {
      onChanged(controller.text);
    });
  }
}
