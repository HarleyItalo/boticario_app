import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Observable extends StatelessWidget {
  final Widget Function() builder;
  const Observable(
    this.builder, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(builder);
  }
}
