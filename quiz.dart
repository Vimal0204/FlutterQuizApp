import 'package:adv_basics/data/question.dart';
import 'package:adv_basics/question.dart';
import 'package:adv_basics/result_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  var currScreen = 'startScreen';
  // Widget? currScreen;
  // @override
  // void initState() {
  //   super.initState();
  //   currScreen =  StartScreen( switchScreen,const[
  //             Color.fromARGB(255, 45, 7, 98),
  //           Color.fromARGB(255, 22, 12, 88),
  //         ],);

  // }

  // void switchScreen(){
  //   setState(() {
  //     currScreen=const Question();
  //   });
  // }
  void switchScreen() {
    setState(() {
      currScreen = 'questionScreen';
    });
  }
  void onRestart(){
    setState(() {
      selectedAnswer=[];
      currScreen='questionScreen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    
    if (selectedAnswer.length == question.length) {
      setState(() {
        // var reScr = ResultScreen();
        // currScreen='startScreen';
        currScreen = 'resultScreen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget currentScreen = StartScreen(
      switchScreen,
      const [
        Color.fromARGB(255, 45, 7, 98),
        Color.fromARGB(255, 22, 12, 88),
      ],
    );
    if (currScreen == 'questionScreen') {
      currentScreen = Question(
        chooseAnswer,
      );
    } else if (currScreen == 'resultScreen') {
      currentScreen =  ResultScreen(const[
        Color.fromARGB(255, 45, 7, 98),
        Color.fromARGB(255, 22, 12, 88),
      ],selectedAnswer,onRestart);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: currentScreen,
        // body: currScreen == 'startScreen'
        //     ? StartScreen(
        //         switchScreen,
        //         const [
        //           Color.fromARGB(255, 45, 7, 98),
        //           Color.fromARGB(255, 22, 12, 88),
        //         ],
        //       )
        //     : const Question(),
      ),
    );
  }
}
