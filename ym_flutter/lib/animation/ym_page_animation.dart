
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YmPageAnimation extends StatelessWidget {
  const YmPageAnimation({super.key});

  @override build(BuildContext context){
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(_createRoute(const YmPageAnimationPage1()));
            },
            child: const Text('Go!'),
          ),
        ],
      ),
    );
  }

  Route _createRoute(Widget nextPage) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation){
        return nextPage;
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }
}

class YmPageAnimationPage1 extends StatelessWidget {
  const YmPageAnimationPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('Page 1')),
    );
  }
}


