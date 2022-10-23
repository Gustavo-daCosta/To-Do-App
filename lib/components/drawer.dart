import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:to_do/screens/home_page.dart';
import 'package:to_do/screens/intro_screen.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

final ZoomDrawerController drawerController = ZoomDrawerController();
final Size size = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;

class HiddenDrawer extends GetView<MyDrawerController> {
  const HiddenDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyDrawerController>(
      builder: (_) => ZoomDrawer(
        controller: drawerController,
        menuScreen: const MenuScreen(),
        mainScreen: const HomePage(),
        //showShadow: true,
        angle: 0.0,
        mainScreenTapClose: true,
        menuScreenWidth: size.width / 2,
        drawerShadowsBackgroundColor: Colors.grey[500]!,
        mainScreenScale: 0.2,
        slideWidth: size.width * 0.52,
        menuBackgroundColor: const Color.fromARGB(255, 33, 42, 63),
      ),
    );
  }
}

class MenuScreen extends GetView<MyDrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const UserAccountsDrawerHeader(
          currentAccountPictureSize: Size.fromRadius(40),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage("https://iili.io/DnIpbp.png"),
          ),
          accountName: Text(
            "TOTODILE",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            )
          ),
          accountEmail: Text("its.me.totodile@email.com"),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 33, 42, 63),
            //color: Color.fromARGB(255, 53, 67, 101),
            //color: theme.colorScheme.secondary,
          ),
        ),
        drawerOption(Icons.home, "Home Page", () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        }),
        drawerOption(Icons.task_alt, "View all tasks", () {}),
        drawerOption(Icons.category, "View all categories", () {}),
        drawerOption(
          Icons.token_outlined, "Introduction Screen", () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const IntroScreen(),
              )
            );
          }
        ),
        drawerOption(Icons.notifications, "Notifications", () {}),
        drawerOption(Icons.star, "Rate us", () {}),
        drawerOption(Icons.info_outline, "About", () {}),
        drawerOption(Icons.settings, "Settings", () {}),
        const Expanded(child: SizedBox()),
        TextButton(
          style: const ButtonStyle(
            
          ),
          onPressed: () {},
          child: const Text("Log out"),
        ),
      ],
    );
  }

  Widget drawerOption(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        )
      ),
      onTap: onTap,
    );
  }
}

class MainScreen extends GetView<MyDrawerController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
        child: ElevatedButton(
          onPressed: controller.toggleDrawer,
          child: const Text("Toggle drawer"),
        ),
      ),
    );
  }
}

class MyDrawerController extends GetxController {
  void toggleDrawer() {
    debugPrint("Toggle drawer");
    drawerController.toggle?.call();
    update();
  }
}
