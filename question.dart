import 'package:adv_basics/data/question.dart';
import 'package:adv_basics/models/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Question extends StatefulWidget {
  const Question(this.onSelectAnswer,{super.key});
  final void Function(String answer) onSelectAnswer;
  @override
  State<Question> createState() {
    return _QuestionState();
  }
}

class _QuestionState extends State<Question> {
  final List<Color> colList1 = const [
    Color.fromARGB(255, 45, 7, 98),
    Color.fromARGB(255, 22, 12, 88),
  ];
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = question[currentQuestionIndex];
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: colList1,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  currentQuestion.text,
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(234, 226, 239, 216),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                ...currentQuestion.getShuffledAnswer().map((answer) {
                  return AnswerButton(
                    answer,
                    (){
                      answerQuestion(answer);
                    },
                  );
                })
                // AnswerButton(currentQuestion.answer[0],(){}),
                // AnswerButton(currentQuestion.answer[1],(){}),
                // AnswerButton(currentQuestion.answer[2],(){}),
                // AnswerButton(currentQuestion.answer[3],(){}),
              ]),
        ),
      ),
    );
  }
}
