import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/quiz_models.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('quiz_results')
            .where('userId', isEqualTo: user.uid)
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final results = snapshot.data!.docs
              .map((doc) => QuizResult.fromMap(doc.data() as Map<String, dynamic>))
              .toList();

          if (results.isEmpty) {
            return const Center(
              child: Text('No quiz results yet. Try taking a quiz!'),
            );
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        child: Text(
                          user.email?.substring(0, 1).toUpperCase() ?? 'U',
                          style: const TextStyle(fontSize: 32),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        user.email ?? 'No email',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Quiz History',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              ...results.map((result) => Card(
                child: ListTile(
                  title: FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('quizzes')
                        .doc(result.quizId)
                        .get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final quizData =
                        snapshot.data!.data() as Map<String, dynamic>;
                        return Text(quizData['title'] ?? 'Unknown Quiz');
                      }
                      return const Text('Loading...');
                    },
                  ),
                  subtitle: Text(
                      'Score: ${result.score}/${result.totalQuestions}'),
                  trailing: Text(
                    '${result.timestamp.day}/${result.timestamp.month}/${result.timestamp.year}',
                  ),
                ),
              )),
            ],
          );
        },
      ),
    );
  }
}