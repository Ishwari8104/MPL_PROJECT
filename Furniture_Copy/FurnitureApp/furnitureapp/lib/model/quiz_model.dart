class QuizModel {
  String question;
  List<String> options;
  int selectedOptionIndex; // -1 for not selected
  int score; // Score assigned to the selected option

  QuizModel({
    required this.question,
    required this.options,
    this.selectedOptionIndex = -1,
    this.score = 0,
  });
}
