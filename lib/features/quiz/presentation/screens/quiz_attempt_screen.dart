import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:learnify_app/core/extensions/context_extensions.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../provider/quiz_provider.dart';
import '../widgets/progress_bar.dart';
import '../widgets/question_progress_indicator.dart';
import '../widgets/option_tile.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routes/router_constants.dart';

class QuizAttemptScreen extends ConsumerStatefulWidget {
  const QuizAttemptScreen({super.key});

  @override
  ConsumerState<QuizAttemptScreen> createState() => _QuizAttemptScreenState();
}

class _QuizAttemptScreenState extends ConsumerState<QuizAttemptScreen> {
  late final PageController _pageController;
  Timer? _timer;
  int _totalTimeInSeconds = 0;
  int _remainingTimeInSeconds = 0;
  bool _isTimerStarted = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    // Start timer after frame callback to ensure providers are ready or just init here
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initTimer();
    });
  }

  void _initTimer() {
    final questions = ref.read(questionsProvider);
    if (questions.isEmpty) return;

    // Logic: 150 questions -> 180 minutes. 1 question = 1.2 minutes = 72 seconds.
    final totalSeconds = (questions.length * 1.2 * 60).toInt();

    setState(() {
      _totalTimeInSeconds = totalSeconds;
      _remainingTimeInSeconds = totalSeconds;
      _isTimerStarted = true;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTimeInSeconds > 0) {
        setState(() {
          _remainingTimeInSeconds--;
        });
      } else {
        _timer?.cancel();
        _submitQuiz();
      }
    });
  }

  void _submitQuiz() {
    _timer?.cancel();

    final questions = ref.read(questionsProvider);
    final answers = ref.read(answersProvider);

    int correctAnswers = 0;
    for (int i = 0; i < questions.length; i++) {
      if (answers[i] == questions[i].correctAnswerIndex) {
        correctAnswers++;
      }
    }

    final timeTaken = _totalTimeInSeconds - _remainingTimeInSeconds;

    context.pushReplacementNamed(
      RouterConstants.quizCompleteRouteName,
      extra: {
        'correctAnswers': correctAnswers,
        'totalQuestions': questions.length,
        'timeTakenInSeconds': timeTaken,
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _onOptionSelected(int questionIndex, int totalQuestions) {
    // Auto advance if not the last question
    if (questionIndex < totalQuestions - 1) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (_pageController.hasClients) {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final questions = ref.watch(questionsProvider);
    final currentQuestion = ref.watch(currentQuestionProvider);
    final answers = ref.watch(answersProvider);

    // Calculate time progress (1.0 to 0.0)
    double progressValue =
        _totalTimeInSeconds > 0
            ? _remainingTimeInSeconds / _totalTimeInSeconds
            : 1.0;

    final isAllAnswered = answers.length == questions.length;

    return Scaffold(
      backgroundColor: const Color(0xFF7758FF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top bar
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white,
                      child: Icon(LucideIcons.x, color: Colors.black, size: 18),
                    ),
                  ),
                  Text(
                    'Question ${currentQuestion + 1} of ${questions.length}',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(10),

            // Progress bar (Timer)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ProgressBar(progress: progressValue),
            ),

            // Optional: Text Timer
            if (_isTimerStarted)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  _formatTime(_remainingTimeInSeconds),
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ),

            const Gap(10),

            // Question Progress Indicator (small lines)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: QuestionProgressIndicator(
                totalQuestions: questions.length,
              ),
            ),
            const Gap(24),

            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: questions.length,
                onPageChanged: (index) {
                  ref.read(currentQuestionProvider.notifier).state = index;
                },
                itemBuilder: (context, index) {
                  final question = questions[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                      left: 16,
                      right: 16,
                      bottom: 70,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              question.question,
                              style: context.textTheme.headlineSmall,
                            ),
                            const SizedBox(height: 24),
                            ...List.generate(
                              question.options.length,
                              (optionIndex) => OptionTile(
                                optionIndex: optionIndex,
                                optionText: question.options[optionIndex],
                                onTap:
                                    () => _onOptionSelected(
                                      index,
                                      questions.length,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Bottom Action Area
            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
              child:
                  isAllAnswered
                      ? SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _submitQuiz,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF7758FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Complete Quiz',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                      : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Scroll to see more',
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: Colors.white30,
                            ),
                          ),
                          const Icon(
                            LucideIcons.chevronsDown,
                            color: Colors.white30,
                            size: 16,
                          ),
                        ],
                      ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(int totalSeconds) {
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;

    if (hours > 0) {
      return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    } else {
      return '$minutes:${seconds.toString().padLeft(2, '0')}';
    }
  }
}
