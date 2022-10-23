import 'package:flutter/material.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:to_do/components/drawer.dart';
import 'package:to_do/screens/intro_screen.dart';
import 'package:to_do/theme/theme.dart';
import 'package:get/get.dart';

void main() {
  Get.put<MyDrawerController>(MyDrawerController());

  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool isFirstRun = true;

  void checkFirstRun() async {
    bool ifr = await IsFirstRun.isFirstRun();
    setState(() {
      isFirstRun = ifr;
    });
  }

  @override
  Widget build(BuildContext context) {
    checkFirstRun();
    return isFirstRun ? const IntroScreen() : const HiddenDrawer();
  }
}
