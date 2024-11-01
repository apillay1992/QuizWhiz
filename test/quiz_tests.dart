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
  });
}