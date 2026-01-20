import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:learnify_app/core/extensions/context_extensions.dart';
import 'package:learnify_app/core/routes/router_constants.dart';
import 'package:learnify_app/core/services/dummy_database.dart';
import 'package:learnify_app/features/auth/presentation/widgets/onboarding_card.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  String? _selectedSubject;
  String? _selectedSchedule;

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  void _goToNextPage() {
    // Validate selections before proceeding
    if (_currentPage == 1 && _selectedSubject == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select your Paper II subject'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (_currentPage == 2 && _selectedSchedule == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select your test schedule'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (_currentPage < 2) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.linear,
      );
    } else {
      // Save preferences and navigate to home
      DummyDatabase().updateUserPreferences(
        paper2Subject: _selectedSubject,
        studySchedule: _selectedSchedule,
      );
      context.pushNamed(RouterConstants.homeRouteName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final onboardingPages = [
      OnboardingCard(
        image: 'assets/images/onboarding1.png',
        title: 'Welcome to Your JRF Companion',
        description:
            'Crack the NET JRF with confidence! Get curated quizzes, mock tests, and performance insights to help you stay ahead.',
      ),
      OnboardingCard(
        image: 'assets/images/onboarding2.png',
        title: 'Select Your Subject',
        description:
            'Choose the subject you\'re preparing for in Paper II. We’ll customize your quizzes and mock tests accordingly.',
        extraWidget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: DropdownButtonFormField<String>(
            initialValue: _selectedSubject,
            decoration: InputDecoration(
              hintText: 'Select Subject',
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xffDFDFDF)),
              ),
            ),
            items: const [
              DropdownMenuItem(
                value: 'Computer Science',
                child: Text('Computer Science'),
              ),
              DropdownMenuItem(
                value: 'Mathematics',
                child: Text('Mathematics'),
              ),
              DropdownMenuItem(value: 'Commerce', child: Text('Commerce')),
              DropdownMenuItem(value: 'Physics', child: Text('Physics')),
              DropdownMenuItem(value: 'Chemistry', child: Text('Chemistry')),
              DropdownMenuItem(value: 'Economics', child: Text('Economics')),
              DropdownMenuItem(value: 'English', child: Text('English')),
              DropdownMenuItem(value: 'Hindi', child: Text('Hindi')),
              DropdownMenuItem(value: 'History', child: Text('History')),
              DropdownMenuItem(
                value: 'Political Science',
                child: Text('Political Science'),
              ),
              DropdownMenuItem(value: 'Geography', child: Text('Geography')),
              DropdownMenuItem(value: 'Psychology', child: Text('Psychology')),
              DropdownMenuItem(value: 'Sociology', child: Text('Sociology')),
              DropdownMenuItem(value: 'Education', child: Text('Education')),
              DropdownMenuItem(value: 'Management', child: Text('Management')),
              DropdownMenuItem(
                value: 'Library Science',
                child: Text('Library Science'),
              ),
            ],
            onChanged: (value) {
              setState(() {
                _selectedSubject = value;
              });
            },
          ),
        ),
      ),
      OnboardingCard(
        image: 'assets/images/onboarding3.png',
        title: 'Set Your Test Schedule',
        description:
            'How often would you like to take mock tests? We\'ll remind you and keep you on track with your preparation.',
        extraWidget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: DropdownButtonFormField<String>(
            initialValue: _selectedSchedule,
            decoration: InputDecoration(
              hintText: 'Select Frequency',
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xffDFDFDF)),
              ),
            ),
            items: const [
              DropdownMenuItem(value: 'Daily', child: Text('Daily')),
              DropdownMenuItem(
                value: 'Every 2 days',
                child: Text('Every 2 days'),
              ),
              DropdownMenuItem(
                value: 'Twice a week',
                child: Text('Twice a week'),
              ),
              DropdownMenuItem(value: 'Weekly', child: Text('Weekly')),
              DropdownMenuItem(value: 'Monthly', child: Text('Monthly')),
            ],
            onChanged: (value) {
              setState(() {
                _selectedSchedule = value;
              });
            },
          ),
        ),
      ),
    ];

    return Scaffold(
      body: Padding(
        padding: context.paddingVertical,
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: onboardingPages,
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: onboardingPages.length,
              effect: const ExpandingDotsEffect(
                activeDotColor: Color(0xff5B4BE9),
                dotColor: Color(0xffD7D7D7),
                dotHeight: 10,
                dotWidth: 10,
              ),
              onDotClicked: (index) {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.linear,
                );
              },
            ),
            const Gap(16),
            Padding(
              padding: context.paddingHorizontal,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff5B4BE9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: context.paddingM,
                  minimumSize: const Size(double.infinity, 48),
                ),
                onPressed: _goToNextPage,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Continue'),
                    Gap(10),
                    Icon(LucideIcons.arrowRight, color: Colors.white),
                  ],
                ),
              ),
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
