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

  group('Quiz Model Tests', () {
    test('creates Quiz instance correctly', () {
      final questions = [
        Question(
          questionText: 'What is 2+2?',
          options: ['3', '4', '5', '6'],
          correctAnswerIndex: 1,
        ),
      ];

      final quiz = Quiz(
        id: '1',
        title: 'Math Quiz',
        category: 'Mathematics',
        questions: questions,
      );

      expect(quiz.id, '1');
      expect(quiz.title, 'Math Quiz');
      expect(quiz.category, 'Mathematics');
      expect(quiz.questions.length, 1);
      expect(quiz.questions.first.questionText, 'What is 2+2?');
    });

    test('converts Quiz to map correctly', () {
      final questions = [
        Question(
          questionText: 'What is 2+2?',
          options: ['3', '4', '5', '6'],
          correctAnswerIndex: 1,
        ),
      ];

      final quiz = Quiz(
        id: '1',
        title: 'Math Quiz',
        category: 'Mathematics',
        questions: questions,
      );

      final map = quiz.toMap();

      expect(map['id'], '1');
      expect(map['title'], 'Math Quiz');
      expect(map['category'], 'Mathematics');
      expect(map['questions'].length, 1);
    });

    test('creates Quiz from map correctly', () {
      final map = {
        'id': '1',
        'title': 'Math Quiz',
        'category': 'Mathematics',
        'questions': [
          {
            'questionText': 'What is 2+2?',
            'options': ['3', '4', '5', '6'],
            'correctAnswerIndex': 1,
          }
        ],
      };

      final quiz = Quiz.fromMap(map);

      expect(quiz.id, '1');
      expect(quiz.title, 'Math Quiz');
      expect(quiz.category, 'Mathematics');
      expect(quiz.questions.length, 1);
      expect(quiz.questions.first.questionText, 'What is 2+2?');
    });
  });
  group('QuizResult Model Tests', () {
    test('creates QuizResult instance correctly', () {
      final timestamp = DateTime(2024, 1, 1);
      final result = QuizResult(
        quizId: '1',
        userId: 'user1',
        score: 8,
        totalQuestions: 10,
        timestamp: timestamp,
      );

      expect(result.quizId, '1');
      expect(result.userId, 'user1');
      expect(result.score, 8);
      expect(result.totalQuestions, 10);
      expect(result.timestamp, timestamp);
    });

    test('converts QuizResult to map correctly', () {
      final timestamp = DateTime(2024, 1, 1);
      final result = QuizResult(
        quizId: '1',
        userId: 'user1',
        score: 8,
        totalQuestions: 10,
        timestamp: timestamp,
      );

      final map = result.toMap();

      expect(map['quizId'], '1');
      expect(map['userId'], 'user1');
      expect(map['score'], 8);
      expect(map['totalQuestions'], 10);
      expect(map['timestamp'], timestamp.toIso8601String());
    });


  });


}