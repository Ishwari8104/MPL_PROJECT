import 'package:flutter/material.dart';
import 'package:furnitureapp/screens/quiz_result.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<String> answers = [];
  int currentQuestionIndex = 0;

  List<Map<String, dynamic>> questions = [
    {
      'question': 'What is your favorite color?',
      'options': ['Blue', 'Red', 'Green', 'Yellow'],
    },
    {
      'question': 'What material do you prefer for furniture?',
      'options': ['Wood', 'Metal', 'Plastic', 'Glass'],
    },
    {
      'question': 'How would you describe your style?',
      'options': ['Modern', 'Classic', 'Minimalist', 'Eclectic'],
    },
  ];

  void answerQuestion(String answer) {
    setState(() {
      answers.add(answer);
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      }
    });
  }

  void seeResults() {
    // Navigate to QuizResultPage with answers
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizResultPage(answers: answers),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Question ${currentQuestionIndex + 1}: ${questions[currentQuestionIndex]['question']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Column(
              children: (questions[currentQuestionIndex]['options'] as List<String>).map((option) {
                return ElevatedButton(
                  onPressed: () => answerQuestion(option),
                  child: Text(option),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: seeResults,
              child: Text('See Results'),
            ),
          ],
        ),
      ),
    );
  }
}
