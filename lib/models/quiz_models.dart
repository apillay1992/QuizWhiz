class Question{
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
  });

  Map<String, dynamic> toMap() {
    return {
      'QuestionText' : questionText,
      'options' : options,
      'correctAnswerIndex': correctAnswerIndex,
    };
  }
}