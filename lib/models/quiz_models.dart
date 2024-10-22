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

  factory Question.fromMap(Map<String, dynamic> map){
    return Question(
      questionText: map['questionText'],
      options: List<String>.from(map['options']),
      correctAnswerIndex: map['correctAnswerIndex'],
    );
  }
}

class Quiz {
  final String id;
  final String title;
  final String category;
  final List<Question> questions;

  Quiz({
    required this.id,
    required this.title,
    required this.category,
    required this.questions,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'questions': questions.map((q) => q.toMap()).toList(),
    };
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz(
      id: map['id'],
      title: map['title'],
      category: map['category'],
      questions: List<Question>.from(
        map['questions']?.map((q) => Question.fromMap(q)),
      ),
    );
  }
}