import 'package:go_router/go_router.dart';
import 'package:learnify_app/core/routes/router_constants.dart';
import 'package:learnify_app/features/auth/presentation/screens/login_screen.dart';
import 'package:learnify_app/features/auth/presentation/screens/onboarding_screen.dart';
import 'package:learnify_app/features/auth/presentation/screens/register_screen.dart';
import 'package:learnify_app/features/auth/presentation/screens/splash_screen.dart';
import 'package:learnify_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:learnify_app/features/quiz/presentation/screens/quiz_completed_screen.dart';
import 'package:learnify_app/features/quiz/presentation/screens/quiz_onboarding_screen.dart';
import 'package:learnify_app/features/settings/presentation/screens/settings_screen.dart';
import 'package:learnify_app/presentation/bottom_nav/bottom_nav_scaffold.dart';
import '../../features/quiz/presentation/screens/quiz_attempt_screen.dart';

/// Main GoRouter configuration for app navigation
final GoRouter appRouter = GoRouter(
  routes: [
    // ------------------ Splash ------------------
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),

    // ------------------ Authentication & Onboarding ------------------
    GoRoute(
      path: '/loginScreen',
      name: RouterConstants.loginRouteName,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/registerScreen',
      name: RouterConstants.registerRouteName,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/onboardingScreen',
      name: RouterConstants.onboardingRouteName,
      builder: (context, state) => const OnboardingScreen(),
    ),

    // ------------------ Home ------------------
    GoRoute(
      path: '/homeScreen',
      name: RouterConstants.homeRouteName,
      builder: (context, state) => const BottomNavScaffold(),
    ),

    // ------------------ Profile & Settings ------------------
    GoRoute(
      path: '/profileScreen',
      name: RouterConstants.profileRouteName,
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/settingsScreen',
      name: RouterConstants.settingsRouteName,
      builder: (context, state) => const SettingsScreen(),
    ),

    // ------------------ Quiz Flow ------------------
    GoRoute(
      path: '/quizOnboardingScreen',
      name: RouterConstants.quizOnboardingRouteName,
      builder: (context, state) => const QuizOnboardingScreen(),
    ),
    GoRoute(
      path: '/quizAttemptScreen',
      name: RouterConstants.quizAttemptRouteName,
      builder: (context, state) => const QuizAttemptScreen(),
    ),
    GoRoute(
      path: '/quizCompleteScreen',
      name: RouterConstants.quizCompleteRouteName,
      builder: (context, state) {
        final extras = state.extra as Map<String, dynamic>? ?? {};
        return QuizCompleteScreen(
          correctAnswers: extras['correctAnswers'] ?? 0,
          totalQuestions: extras['totalQuestions'] ?? 0,
          timeTakenInSeconds: extras['timeTakenInSeconds'] ?? 0,
        );
      },
    ),
  ],
);
