import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/quiz.dart';
class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chooseAnswer, required this.resetQuiz});

  final List<String> chooseAnswer;
  final void Function() resetQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chooseAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chooseAnswer[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 152, 117, 211),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            QuestionsSummary(summaryData),
            SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: resetQuiz,
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.restart_alt,color: Colors.white,),
                SizedBox(width: 5),
                Text('Reset quiz',style: TextStyle(
                  color: Colors.white
                ),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
