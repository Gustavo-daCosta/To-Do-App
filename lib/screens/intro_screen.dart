import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:to_do/screens/home_page.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "To Do App",
          body: "The To Do App can help you keep organized and have all your tasks at the same place. You can separate your tasks in categories, create deadlines and several other things.",
          image: Center(
            child: Image.asset("assets/images/checklist.png"),
          )
        ),
        PageViewModel(
          title: "Plan your day!",
          body: "Use the To Do App to know what you have to do along the day, you can separate your tasks in categories, like study tasks, work tasks and other things.",
          image: Image.asset("assets/images/clip-girl-studying.png"),
        ),
        PageViewModel(
          title: "Get things done!",
          body: "With the To Do App you can organize all your tasks and get things done, next to a good time management this app can help you complete your tasks in less time.",
          image: Image.asset("assets/images/phone-rocket.png"),
        ),
      ],
      showNextButton: true,
      showBackButton: true,
      showSkipButton: false,
      next: controlButton(
        text: "Next",
        icon: Icons.arrow_forward_rounded,
        color: Colors.blue,
      ),
      back: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Icon(
            Icons.arrow_back_rounded,
            color: Colors.red,
          ),
          Text(
            "Back",
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ]
      ),
      done: controlButton(
        text: "Done",
        icon: Icons.chevron_right_sharp,
        color: Colors.green,
      ),
      onDone: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          )
        );
      }
    );
  }
}

Widget controlButton({
  required String text, required IconData icon, required Color color,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text(
        text,
        style: TextStyle(
          color: color,
        ),
      ),
      Icon(
        icon,
        color: color,
      ),
    ]
  );
}