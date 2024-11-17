import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/quiz_models.dart';
import '../utils/quiz_uploader.dart';
import 'quiz_screen.dart';
import 'profile_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              firebase_auth.FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('quizzes')
            .orderBy('category')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Group quizzes by category
          Map<String, List<Quiz>> quizzesByCategory = {};
          for (var doc in snapshot.data!.docs) {
            var data = doc.data() as Map<String, dynamic>;
            var quiz = Quiz.fromMap({'id': doc.id, ...data});
            if (!quizzesByCategory.containsKey(quiz.category)) {
              quizzesByCategory[quiz.category] = [];
            }
            quizzesByCategory[quiz.category]!.add(quiz);
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: quizzesByCategory.length,
            itemBuilder: (context, index) {
              String category = quizzesByCategory.keys.elementAt(index);
              List<Quiz> quizzes = quizzesByCategory[category]!;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      category,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: quizzes.length,
                    itemBuilder: (context, quizIndex) {
                      Quiz quiz = quizzes[quizIndex];
                      return Card(
                        child: ListTile(
                          title: Text(quiz.title),
                          subtitle: Text('${quiz.questions.length} questions'),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuizScreen(quiz: quiz),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
      // Add the DevTools button for development
      floatingActionButton: const DevTools(),
    );
  }
}

// DevTools widget for uploading sample quizzes
class DevTools extends StatelessWidget {
  const DevTools({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        try {
          await QuizUploader.uploadSampleQuizzes();
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Quizzes uploaded successfully!')),
            );
          }
        } catch (e) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error uploading quizzes: $e')),
            );
          }
        }
      },
      child: const Icon(Icons.upload),
    );
  }
}