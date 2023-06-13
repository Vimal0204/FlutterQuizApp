import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.screenChanger,this.colList, {super.key});
  final List<Color> colList;
  final void Function() screenChanger;
  @override
  Widget build(context) {
    
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: colList,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
                'assets/images/quiz-logo.png',
                width: 300,
                height: 300,
                color: const Color.fromARGB(150, 255, 255, 255),
              ),
            // Opacity(
            //   opacity: 0.6,
            //   child: Image.asset(
            //     'assets/images/quiz-logo.png',
            //     width: 300,
            //     height: 300,
            //   ),
            // ),
            const SizedBox(
          height: 80,
        ),
            const Text(
              'Learn Flutter the fun way!',
              style: TextStyle(
                
                color: Color.fromARGB(255, 246, 246, 246),
                fontSize: 28,
              ),
            ),
            const SizedBox(
          height: 30,
        ),
            OutlinedButton.icon(

              onPressed: screenChanger,
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 246, 246, 246),
                // backgroundColor: const Color.fromARGB(255, 48, 19, 239),
                textStyle: const TextStyle(
                fontSize: 28,
            ),
            ),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text(
              'Start quiz',
            ),
            )
          ],
        ),
      ),
    );
  }
}
