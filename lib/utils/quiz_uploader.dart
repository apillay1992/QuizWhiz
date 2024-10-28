import 'package:cloud_firestore/cloud_firestore.dart';

class QuizUploader {
  static Future<void> uploadSampleQuizzes() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Sample quizzes data
    final List<Map<String, dynamic>> quizzes = [
      {
        "title": "Basic Math Quiz",
        "category": "Mathematics",
        "questions": [
          {
            "questionText": "What is 2 + 2?",
            "options": ["3", "4", "5", "6"],
            "correctAnswerIndex": 1
          },
          {
            "questionText": "What is 10 × 5?",
            "options": ["40", "45", "50", "55"],
            "correctAnswerIndex": 2
          },
          {
            "questionText": "What is 100 ÷ 4?",
            "options": ["20", "25", "15", "30"],
            "correctAnswerIndex": 1
          }
        ]
      },
      {
        "title": "Science Basics",
        "category": "Science",
        "questions": [
          {
            "questionText": "What is the chemical symbol for water?",
            "options": ["H2O", "CO2", "O2", "N2"],
            "correctAnswerIndex": 0
          },
          {
            "questionText": "What is the closest planet to the Sun?",
            "options": ["Venus", "Earth", "Mars", "Mercury"],
            "correctAnswerIndex": 3
          },
          {
            "questionText": "What is the largest organ in the human body?",
            "options": ["Heart", "Brain", "Skin", "Liver"],
            "correctAnswerIndex": 2
          }
        ]
      },
      {
        "title": "Geography Quiz",
        "category": "Geography",
        "questions": [
          {
            "questionText": "What is the capital of Japan?",
            "options": ["Seoul", "Beijing", "Tokyo", "Bangkok"],
            "correctAnswerIndex": 2
          },
          {
            "questionText": "Which is the largest continent?",
            "options": ["North America", "Africa", "Europe", "Asia"],
            "correctAnswerIndex": 3
          },
          {
            "questionText": "What is the longest river in the world?",
            "options": ["Amazon", "Nile", "Mississippi", "Yangtze"],
            "correctAnswerIndex": 1
          }
        ]
      }
    ];

    // Delete existing quizzes (optional)
    // Uncomment if you want to clear existing quizzes before adding new ones
    // QuerySnapshot existingQuizzes = await firestore.collection('quizzes').get();
    // for (var doc in existingQuizzes.docs) {
    //   await doc.reference.delete();
    // }

    // Upload each quiz
    for (var quiz in quizzes) {
      try {
        await firestore.collection('quizzes').add(quiz);
        print('Added quiz: ${quiz['title']}');
      } catch (e) {
        print('Error adding quiz ${quiz['title']}: $e');
      }
    }

    print('Sample quizzes upload completed!');
  }
}