import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:to_do/models/categories.dart';
import 'package:to_do/components/lists/categorie_list.dart';
import 'package:to_do/components/lists/task_list.dart';
import 'package:to_do/screens/tasks/new_task.dart';
import 'package:to_do/components/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: const HiddenDrawer(),
      //drawer: drawer(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, anim1, anim2) => const NewTaskPage(),
              transitionsBuilder: (context, anim, anim2, child) {
                return SizeTransition(
                  sizeFactor: anim,
                  axisAlignment: 0.0,
                  child: child,
                );
                /*FadeTransition(opacity: anim, child: child);*/
              },
              transitionDuration: const Duration(seconds: 4),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            homePageTitle(),
            
            titleBar(context, "Categories"),
            Container(
              padding: const EdgeInsets.only(left: 6),
              height: 70,
              child: ListView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return categoriesList(index);
                }
              ),
            ),
            titleBar(context, "Tasks"),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                ListView.builder(
                  itemCount: 4,
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return taskList(context, index);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget titleBar(BuildContext context, String title) {
    final String buttonTitle = "See all ${title.toLowerCase()}";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextButton(
            onPressed: () {
              /*Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => redirectScreen(),
                )
              );*/
            },
            child: Text(
              buttonTitle,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget homePageTitle() {
  return Column(
    children: <Widget>[
      AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            "What's up, \$name!",
            textStyle: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            speed: const Duration(milliseconds: 200),
          ),
        ],
        displayFullTextOnTap: true,
        isRepeatingAnimation: false,
      ),
      Text(
        "\$numberOfTasksPending tasks pending",
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey[600]
        ),
      ),
    ],
  );
}
