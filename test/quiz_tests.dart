import 'package:flutter_test/flutter_test.dart';
import 'package:login_page/models/quiz_models.dart';

void main() {
  group('Question Model Tests', ()
  {
    test('creates Question instance correctly', () {
      final question = Question(
        questionText: 'What is 2+2?',
        options: ['3', '4', '5', '6'],
        correctAnswerIndex: 1,
      );

      expect(question.questionText, 'What is 2+2?');
      expect(question.options, ['3', '4', '5', '6']);
      expect(question.correctAnswerIndex, 1);
    });

    test('converts Question to map correctly', () {
      final question = Question(
        questionText: 'What is 2+2?',
        options: ['3', '4', '5', '6'],
        correctAnswerIndex: 1,
      );

      final map = question.toMap();

      expect(map['questionText'], 'What is 2+2?');
      expect(map['options'], ['3', '4', '5', '6']);
      expect(map['correctAnswerIndex'], 1);
    });


    test('creates Question from map correctly', () {
      final map = {
        'questionText': 'What is 2+2?',
        'options': ['3', '4', '5', '6'],
        'correctAnswerIndex': 1,
      };

      final question = Question.fromMap(map);

      expect(question.questionText, 'What is 2+2?');
      expect(question.options, ['3', '4', '5', '6']);
      expect(question.correctAnswerIndex, 1);
    });


  });
}