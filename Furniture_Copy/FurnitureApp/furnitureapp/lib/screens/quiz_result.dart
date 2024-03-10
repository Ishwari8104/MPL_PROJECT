import 'package:flutter/material.dart';

class QuizResultPage extends StatelessWidget {
  final List<String> answers;

  QuizResultPage({required this.answers});

  String calculateFurnitureType() {
  // Define points for each choice
  Map<String, int> choicePoints = {
    'Blue': 5,
    'Red': 3,
    'Green': 2,
    'Yellow': 1,
    'Wood':  5,
    'Metal': 1,
    'Plastic': 3,
    'Glass': 4,
    'Modern': 4,
    'Classic': 3,
    'Minimalist': 2,
    'Eclectic': 5,
    // Add points for other choices
  };

  // Calculate total points
  int totalPoints = 0;
  for (String answer in answers) {
    totalPoints += choicePoints[answer] ?? 0;
  }

  // Define ranges for different furniture types based on total points
  if (totalPoints >= 15) {
    return 'Eclectic Chair';
  } else if (totalPoints >= 10) {
    return 'Minimalist Sofa';
  } else if (totalPoints >= 5) {
    return 'Classic Table';
  } else {
    return 'Modern Shelf';
  }
}

  @override
  Widget build(BuildContext context) {
    String furnitureType = calculateFurnitureType();

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Recommended Furniture Type:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              furnitureType,
              style: TextStyle(fontSize: 24, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
