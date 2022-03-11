import 'package:flutter/material.dart';

import '../controllers/splash_controller.dart';

class SplashPage extends StatefulWidget {
  final SplashController controller;

  const SplashPage({Key? key, required this.controller}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    mountController();
    startAnimation();
    widget.controller.init();
    super.initState();
  }

  mountController() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  startAnimation() {
    _animation =
        Tween<double>(begin: 100, end: 180).animate(_animationController);
    _animationOpacity =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.reset();
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  late AnimationController _animationController;
  late Animation<double> _animation;
  late Animation<double> _animationOpacity;

  @override
  Widget build(BuildContext context) {
    startAnimation();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AnimatedBuilder(
              animation: _animation,
              builder: (_, __) {
                return Opacity(
                  opacity: _animationOpacity.value,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Image.asset(
                      'assets/images/splash.png',
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                  ),
                );
              }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                LinearProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                  backgroundColor: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Todos os direitos reservados! ",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  'by Harley italo',
                  style: Theme.of(context).textTheme.overline,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
