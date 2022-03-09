import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final Function()? onPress;
  final String buttonText;

  const DefaultButton({
    Key? key,
    required this.onPress,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(const Size(300, 50)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(color: Colors.white, width: 0),
          ),
        ),
      ),
      child: Text(buttonText, style: Theme.of(context).textTheme.headline6),
    );
  }
}
