import '../models/achievement_model.dart';
import '../models/leaderboard_entry_model.dart';
import '../models/module_model.dart';
import '../models/test_model.dart';
import '../models/user_model.dart';

/// Dummy Database Service
/// This service provides mock data for the app until the backend is ready
class DummyDatabase {
  static final DummyDatabase _instance = DummyDatabase._internal();
  factory DummyDatabase() => _instance;
  DummyDatabase._internal();

  // Current logged-in user
  UserModel get currentUser => _currentUser;
  late UserModel _currentUser;

  // Data storage
  final List<UserModel> _users = [];
  final List<TestModel> _tests = [];
  final List<ModuleModel> _modules = [];
  final List<AchievementModel> _achievements = [];
  final List<LeaderboardEntryModel> _weeklyLeaderboard = [];
  final List<LeaderboardEntryModel> _allTimeLeaderboard = [];

  /// Initialize the database with dummy data
  void initialize() {
    _initializeUsers();
    _initializeTests();
    _initializeModules();
    _initializeAchievements();
    _initializeLeaderboards();
  }

  void _initializeUsers() {
    _users.clear();

    // Current user
    _currentUser = UserModel(
      id: 'user_001',
      name: 'Muhammed Rafsal N',
      email: 'rafsal@learnify.com',
      profileImage: 'assets/images/profile.png',
      trophies: 5,
      streak: 56,
      points: 1250,
      rank: 25,
    );
    _users.add(_currentUser);

    // Generate other users for leaderboard
    for (int i = 1; i <= 50; i++) {
      _users.add(
        UserModel(
          id: 'user_${i.toString().padLeft(3, '0')}',
          name: 'User $i',
          email: 'user$i@learnify.com',
          trophies: (50 - i) ~/ 10,
          streak: 50 - i,
          points: 2000 - (i * 30),
          rank: i,
        ),
      );
    }
  }

  void _initializeTests() {
    _tests.clear();

    // Start Test Section (Featured Tests)
    _tests.addAll([
      TestModel(
        id: 'test_001',
        title: 'Mathematics Fundamentals',
        description:
            'Master the basics of mathematics with comprehensive questions',
        totalQuestions: 20,
        answeredQuestions: 0,
        duration: 30,
        imageUrl: 'assets/images/start_test.png',
        category: 'featured',
        paper: 'Paper I',
      ),
      TestModel(
        id: 'test_002',
        title: 'Science Essentials',
        description: 'Test your knowledge in physics, chemistry, and biology',
        totalQuestions: 25,
        answeredQuestions: 0,
        duration: 40,
        imageUrl: 'assets/images/start_test.png',
        category: 'featured',
        paper: 'Paper I',
      ),
      TestModel(
        id: 'test_003',
        title: 'General Knowledge Quiz',
        description:
            'Challenge yourself with diverse general knowledge questions',
        totalQuestions: 15,
        answeredQuestions: 0,
        duration: 20,
        imageUrl: 'assets/images/start_test.png',
        category: 'featured',
        paper: 'Paper II',
      ),
      TestModel(
        id: 'test_004',
        title: 'Reasoning & Aptitude',
        description: 'Sharpen your logical reasoning and analytical skills',
        totalQuestions: 30,
        answeredQuestions: 0,
        duration: 45,
        imageUrl: 'assets/images/start_test.png',
        category: 'featured',
        paper: 'Paper II',
      ),
    ]);

    // Continue Section (In-progress tests)
    _tests.addAll([
      TestModel(
        id: 'test_005',
        title: 'Algebra Practice',
        description: 'Continue your algebra practice session',
        totalQuestions: 10,
        answeredQuestions: 3,
        duration: 15,
        category: 'continue',
        paper: 'Paper I',
      ),
      TestModel(
        id: 'test_006',
        title: 'English Grammar',
        description: 'Complete your grammar assessment',
        totalQuestions: 15,
        answeredQuestions: 7,
        duration: 20,
        category: 'continue',
        paper: 'Paper I',
      ),
      TestModel(
        id: 'test_007',
        title: 'History Quiz',
        description: 'Resume your history knowledge test',
        totalQuestions: 5,
        answeredQuestions: 2,
        duration: 10,
        category: 'continue',
        paper: 'Paper II',
      ),
    ]);

    // Recommended Section
    _tests.addAll([
      TestModel(
        id: 'test_008',
        title: 'Quick Math Challenge',
        description: 'Test your speed with quick calculations',
        totalQuestions: 10,
        answeredQuestions: 0,
        duration: 10,
        category: 'recommended',
        paper: 'Paper I',
      ),
      TestModel(
        id: 'test_009',
        title: 'Vocabulary Builder',
        description: 'Expand your English vocabulary',
        totalQuestions: 15,
        answeredQuestions: 0,
        duration: 15,
        category: 'recommended',
        paper: 'Paper I',
      ),
      TestModel(
        id: 'test_010',
        title: 'Current Affairs',
        description: 'Stay updated with recent events',
        totalQuestions: 5,
        answeredQuestions: 0,
        duration: 8,
        category: 'recommended',
        paper: 'Paper II',
      ),
    ]);

    // Module Tests - Paper I
    for (int module = 1; module <= 8; module++) {
      for (int test = 1; test <= 3; test++) {
        _tests.add(
          TestModel(
            id: 'module_p1_${module}_test_$test',
            title: 'Module $module - Test $test',
            description: 'Practice test for module $module',
            totalQuestions: 10 + (test * 2),
            answeredQuestions: module <= 2 ? (test * 2) : 0,
            duration: 15 + (test * 5),
            category: 'module',
            moduleId: 'module_p1_$module',
            paper: 'Paper I',
          ),
        );
      }
    }

    // Module Tests - Paper II
    for (int module = 1; module <= 8; module++) {
      for (int test = 1; test <= 3; test++) {
        _tests.add(
          TestModel(
            id: 'module_p2_${module}_test_$test',
            title: 'Module $module - Test $test',
            description: 'Practice test for module $module',
            totalQuestions: 10 + (test * 2),
            answeredQuestions: module <= 1 ? (test * 1) : 0,
            duration: 15 + (test * 5),
            category: 'module',
            moduleId: 'module_p2_$module',
            paper: 'Paper II',
          ),
        );
      }
    }

    // Previous Year Questions - Paper I
    for (int year = 2020; year <= 2024; year++) {
      for (int set = 1; set <= 3; set++) {
        _tests.add(
          TestModel(
            id: 'pyq_p1_${year}_set_$set',
            title: 'PYQ $year SET $set',
            description: 'Practice basic arithmetic\nand problem solving',
            totalQuestions: 10,
            answeredQuestions: 0,
            duration: 180,
            category: 'pyq',
            year: year.toString(),
            setNumber: set.toString(),
            paper: 'Paper I',
          ),
        );
      }
    }

    // Previous Year Questions - Paper II
    for (int year = 2020; year <= 2024; year++) {
      for (int set = 1; set <= 3; set++) {
        _tests.add(
          TestModel(
            id: 'pyq_p2_${year}_set_$set',
            title: 'PYQ $year SET $set',
            description: 'Practice reasoning and\ngeneral knowledge',
            totalQuestions: 10,
            answeredQuestions: 0,
            duration: 180,
            category: 'pyq',
            year: year.toString(),
            setNumber: set.toString(),
            paper: 'Paper II',
          ),
        );
      }
    }
  }

  void _initializeModules() {
    _modules.clear();

    // Paper I Modules
    for (int i = 1; i <= 8; i++) {
      final testIds = [
        'module_p1_${i}_test_1',
        'module_p1_${i}_test_2',
        'module_p1_${i}_test_3',
      ];

      _modules.add(
        ModuleModel(
          id: 'module_p1_$i',
          title: 'Module ${i.toString().padLeft(2, '0')}',
          description: 'Paper I - Module $i content',
          moduleNumber: i,
          paper: 'Paper I',
          testIds: testIds,
          isCompleted: i <= 2,
        ),
      );
    }

    // Paper II Modules
    for (int i = 1; i <= 8; i++) {
      final testIds = [
        'module_p2_${i}_test_1',
        'module_p2_${i}_test_2',
        'module_p2_${i}_test_3',
      ];

      _modules.add(
        ModuleModel(
          id: 'module_p2_$i',
          title: 'Module ${i.toString().padLeft(2, '0')}',
          description: 'Paper II - Module $i content',
          moduleNumber: i,
          paper: 'Paper II',
          testIds: testIds,
          isCompleted: i <= 1,
        ),
      );
    }
  }

  void _initializeAchievements() {
    _achievements.clear();

    _achievements.addAll([
      AchievementModel(
        id: 'ach_001',
        title: 'First Steps',
        description: 'Complete your first test',
        iconName: 'trophy',
        isUnlocked: true,
        unlockedAt: DateTime.now().subtract(const Duration(days: 30)),
        requiredPoints: 0,
      ),
      AchievementModel(
        id: 'ach_002',
        title: 'Quick Learner',
        description: 'Score 80% or higher in any test',
        iconName: 'star',
        isUnlocked: true,
        unlockedAt: DateTime.now().subtract(const Duration(days: 25)),
        requiredPoints: 100,
      ),
      AchievementModel(
        id: 'ach_003',
        title: 'Dedicated Student',
        description: 'Maintain a 7-day streak',
        iconName: 'flame',
        isUnlocked: true,
        unlockedAt: DateTime.now().subtract(const Duration(days: 20)),
        requiredPoints: 200,
      ),
      AchievementModel(
        id: 'ach_004',
        title: 'Module Master',
        description: 'Complete all tests in a module',
        iconName: 'medal',
        isUnlocked: true,
        unlockedAt: DateTime.now().subtract(const Duration(days: 15)),
        requiredPoints: 300,
      ),
      AchievementModel(
        id: 'ach_005',
        title: 'Top Performer',
        description: 'Reach top 10 in leaderboard',
        iconName: 'crown',
        isUnlocked: true,
        unlockedAt: DateTime.now().subtract(const Duration(days: 10)),
        requiredPoints: 500,
      ),
      AchievementModel(
        id: 'ach_006',
        title: 'Century Club',
        description: 'Score 1000 total points',
        iconName: 'target',
        isUnlocked: false,
        requiredPoints: 1000,
      ),
      AchievementModel(
        id: 'ach_007',
        title: 'Perfect Score',
        description: 'Get 100% in any test',
        iconName: 'award',
        isUnlocked: false,
        requiredPoints: 800,
      ),
      AchievementModel(
        id: 'ach_008',
        title: 'Marathon Runner',
        description: 'Maintain a 30-day streak',
        iconName: 'zap',
        isUnlocked: false,
        requiredPoints: 1500,
      ),
    ]);
  }

  void _initializeLeaderboards() {
    _weeklyLeaderboard.clear();
    _allTimeLeaderboard.clear();

    // Weekly Leaderboard
    for (int i = 0; i < 15; i++) {
      _weeklyLeaderboard.add(
        LeaderboardEntryModel(
          userId: 'user_${i.toString().padLeft(3, '0')}',
          name: i == 0 ? 'Muhammed Rafsal N' : 'User ${i + 1}',
          rank: i + 1,
          points: 500 - (i * 20),
        ),
      );
    }

    // All-Time Leaderboard
    for (int i = 0; i < 15; i++) {
      _allTimeLeaderboard.add(
        LeaderboardEntryModel(
          userId: 'user_${i.toString().padLeft(3, '0')}',
          name: i == 0 ? 'Muhammed Rafsal N' : 'User ${i + 1}',
          rank: i + 1,
          points: 2000 - (i * 50),
        ),
      );
    }
  }

  // Getters for data

  /// Get featured tests for the start test section
  List<TestModel> getFeaturedTests() {
    return _tests.where((test) => test.category == 'featured').toList();
  }

  /// Get tests in progress
  List<TestModel> getContinueTests() {
    return _tests.where((test) => test.category == 'continue').toList();
  }

  /// Get recommended tests
  List<TestModel> getRecommendedTests() {
    return _tests.where((test) => test.category == 'recommended').toList();
  }

  /// Get modules by paper
  List<ModuleModel> getModulesByPaper(String paper) {
    return _modules.where((module) => module.paper == paper).toList();
  }

  /// Get tests for a specific module
  List<TestModel> getTestsForModule(String moduleId) {
    return _tests.where((test) => test.moduleId == moduleId).toList();
  }

  /// Get PYQ tests by paper
  List<TestModel> getPYQByPaper(String paper) {
    return _tests
        .where((test) => test.category == 'pyq' && test.paper == paper)
        .toList();
  }

  /// Get weekly leaderboard
  List<LeaderboardEntryModel> getWeeklyLeaderboard() {
    return _weeklyLeaderboard;
  }

  /// Get all-time leaderboard
  List<LeaderboardEntryModel> getAllTimeLeaderboard() {
    return _allTimeLeaderboard;
  }

  /// Get user achievements
  List<AchievementModel> getAchievements() {
    return _achievements;
  }

  /// Get unlocked achievements
  List<AchievementModel> getUnlockedAchievements() {
    return _achievements.where((ach) => ach.isUnlocked).toList();
  }

  /// Get locked achievements
  List<AchievementModel> getLockedAchievements() {
    return _achievements.where((ach) => !ach.isUnlocked).toList();
  }

  /// Get test by ID
  TestModel? getTestById(String id) {
    try {
      return _tests.firstWhere((test) => test.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Update test progress
  void updateTestProgress(String testId, int answeredQuestions) {
    final testIndex = _tests.indexWhere((test) => test.id == testId);
    if (testIndex != -1) {
      // Note: Since TestModel is immutable, we'd need to replace it
      // For now, this is a placeholder - in a real app, you'd use a state management solution
      print('Test progress updated: $testId - $answeredQuestions answered');
    }
  }

  /// Get user statistics
  Map<String, dynamic> getUserStats() {
    final completedTests = _tests.where((test) => test.isCompleted).length;
    final totalTests = _tests.length;
    final completedModules =
        _modules.where((module) => module.isCompleted).length;
    final totalModules = _modules.length;

    return {
      'completedTests': completedTests,
      'totalTests': totalTests,
      'completedModules': completedModules,
      'totalModules': totalModules,
      'totalPoints': _currentUser.points,
      'rank': _currentUser.rank,
      'streak': _currentUser.streak,
      'trophies': _currentUser.trophies,
    };
  }
}
