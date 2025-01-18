import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswers = [];
  var currentState ='start-screen';

  void resetQuiz(){

    setState(() {
      currentState ='start-screen';
      selectedAnswers = [];
    });

  }
  void switchScreen(){
    setState(() {
      // selectedAnswers= [];
      currentState = 'question-screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length){
      setState(() {
        currentState ='results-screen';
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if(currentState == 'question-screen'){
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }
    if(currentState == 'results-screen'){
      screenWidget = ResultScreen(
        chooseAnswer: selectedAnswers,
        resetQuiz: resetQuiz,
      );
    }
    return  MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 35, 7, 84),
            Color.fromARGB(255, 72, 28, 147)
          ],
        ),
      ),
          child: screenWidget),
        // GradientContainer(
        // const Color.fromARGB(255, 35, 7, 84),
        // const Color.fromARGB(255, 72, 28, 147)
        // ),
      ),
    );
  }
}