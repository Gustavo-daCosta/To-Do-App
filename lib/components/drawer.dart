import 'package:flutter/material.dart';
import 'package:to_do/screens/home_page.dart';
import 'package:to_do/screens/intro_screen.dart';
import 'package:to_do/theme/theme.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

Widget drawer(BuildContext context) {
  return Drawer(
    child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: const Icon(Icons.person),
            accountName: const Text("User"),
            accountEmail: const Text("user.test@email.com"),
            decoration: BoxDecoration(
              color: theme.colorScheme.secondary,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.task_alt),
            title: const Text("View all tasks"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.category),
            title: const Text("View all categories"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.token_outlined),
            title: const Text("View introduction screen"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const IntroScreen(),
                )
              );
            },
          )
        ],
      ),
    ),
  );
}

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({Key? key}) : super(key: key);

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> pages = [];
  static const TextStyle baseStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle selectedStyle = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static Color lineSelectedColor = theme.colorScheme.secondary;

  @override
  void initState() {
    super.initState();

    pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "View all tasks",
          baseStyle: baseStyle,
          selectedStyle: selectedStyle,
          colorLineSelected: lineSelectedColor,
        ),
        const HomePage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "View all categories",
          baseStyle: baseStyle,
          selectedStyle: selectedStyle,
          colorLineSelected: lineSelectedColor,
        ),
        const HomePage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Introduction screen",
          baseStyle: baseStyle,
          selectedStyle: selectedStyle,
          colorLineSelected: lineSelectedColor,
        ),
        const IntroScreen(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      tittleAppBar: const Text(
        "To Do",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevationAppBar: 1,
      backgroundColorMenu: const Color.fromARGB(255, 33, 42, 63),
      screens: pages,
      initPositionSelected: 0,
      slidePercent: 60,
      contentCornerRadius: 15,
      isTitleCentered: true,
    );
  }
}
