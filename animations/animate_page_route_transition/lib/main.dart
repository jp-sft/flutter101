import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Page1(),
    ),
  );
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(_createRoute());
          },
          child: const Text('Go!'),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      /**
       * 1*) *animation* est une animation de type double
       * 2*) les curves sont des fonctions cuvique qui donne le tempo
       * 3*) les offsets representent les tangentes à l'extreme de ses fonctions
       * 4*) Twen est une animation de type vecteur de double
       */

      var curve = Curves.ease;
      final curvedAnimation = CurvedAnimation(parent: animation, curve: curve);

      const begin = Offset(0.0, -1.0);
      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end);

      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Page 2'),
      ),
    );
  }
}
