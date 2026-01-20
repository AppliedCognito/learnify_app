import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/quiz_model.dart';

final currentQuestionProvider = StateProvider<int>((ref) => 0);
final answersProvider = StateProvider<Map<int, int>>((ref) => {});

// Sample Questions
final questionsProvider = Provider<List<Question>>(
  (ref) => [
    Question(
      question: 'What is Flutter?',
      options: ['SDK', 'IDE', 'OS', 'Plugin'],
      explanation:
          "Flutter is an opersort-source UI software development toolkit created by Google.",
      correctAnswerIndex: 0,
    ),
    Question(
      question: 'Which language is used by Flutter?',
      options: ['Java', 'Kotlin', 'Dart', 'Swift'],
      correctAnswerIndex: 2,
    ),
    Question(
      question: 'Who developed Flutter?',
      options: ['Microsoft', 'Google', 'Apple', 'Facebook'],
      correctAnswerIndex: 1,
    ),
    Question(
      question: 'What type of widget is Text?',
      options: ['Stateless', 'Stateful', 'Inherited', 'Stream'],
      correctAnswerIndex: 0,
    ),
    Question(
      question: 'Flutter apps are compiled to?',
      options: ['Machine code', 'Byte code', 'C++ code', 'Python'],
      correctAnswerIndex: 0,
    ),
    Question(
      question: 'What is a Widget?',
      options: ['Blueprint', 'Component', 'Module', 'Page'],
      correctAnswerIndex: 1,
    ),
    Question(
      question: 'Flutter default database?',
      options: ['Hive', 'Firebase', 'SQLite', 'Shared Prefs'],
      correctAnswerIndex: 2,
    ),
    Question(
      question: 'What command creates Flutter project?',
      options: [
        'flutter init',
        'flutter create',
        'flutter start',
        'flutter run',
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      question: 'Which widget is used for layouts?',
      options: ['Row', 'Column', 'Stack', 'All'],
      correctAnswerIndex: 3,
    ),
    Question(
      question: 'Flutter is mainly used for?',
      options: ['Web', 'Desktop', 'Mobile', 'Server'],
      correctAnswerIndex: 2,
    ),
  ],
);
