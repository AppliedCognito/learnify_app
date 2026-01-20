import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnify_app/core/services/dummy_database.dart';
import 'package:learnify_app/core/models/user_model.dart';
import 'package:learnify_app/core/models/test_model.dart';
import 'package:learnify_app/core/models/module_model.dart';
import 'package:learnify_app/core/models/achievement_model.dart';
import 'package:learnify_app/core/models/leaderboard_entry_model.dart';

/// Provider for the dummy database instance
final dummyDatabaseProvider = Provider<DummyDatabase>((ref) {
  final db = DummyDatabase();
  db.initialize();
  return db;
});

/// Provider for current user
final currentUserProvider = Provider<UserModel>((ref) {
  final db = ref.watch(dummyDatabaseProvider);
  return db.currentUser;
});

/// Provider for featured tests
final featuredTestsProvider = Provider<List<TestModel>>((ref) {
  final db = ref.watch(dummyDatabaseProvider);
  return db.getFeaturedTests();
});

/// Provider for continue tests
final continueTestsProvider = Provider<List<TestModel>>((ref) {
  final db = ref.watch(dummyDatabaseProvider);
  return db.getContinueTests();
});

/// Provider for recommended tests
final recommendedTestsProvider = Provider<List<TestModel>>((ref) {
  final db = ref.watch(dummyDatabaseProvider);
  return db.getRecommendedTests();
});

/// Provider for modules by paper
final modulesByPaperProvider = Provider.family<List<ModuleModel>, String>((
  ref,
  paper,
) {
  final db = ref.watch(dummyDatabaseProvider);
  return db.getModulesByPaper(paper);
});

/// Provider for tests in a module
final testsForModuleProvider = Provider.family<List<TestModel>, String>((
  ref,
  moduleId,
) {
  final db = ref.watch(dummyDatabaseProvider);
  return db.getTestsForModule(moduleId);
});

/// Provider for PYQ tests by paper
final pyqByPaperProvider = Provider.family<List<TestModel>, String>((
  ref,
  paper,
) {
  final db = ref.watch(dummyDatabaseProvider);
  return db.getPYQByPaper(paper);
});

/// Provider for weekly leaderboard
final weeklyLeaderboardProvider = Provider<List<LeaderboardEntryModel>>((ref) {
  final db = ref.watch(dummyDatabaseProvider);
  return db.getWeeklyLeaderboard();
});

/// Provider for all-time leaderboard
final allTimeLeaderboardProvider = Provider<List<LeaderboardEntryModel>>((ref) {
  final db = ref.watch(dummyDatabaseProvider);
  return db.getAllTimeLeaderboard();
});

/// Provider for achievements
final achievementsProvider = Provider<List<AchievementModel>>((ref) {
  final db = ref.watch(dummyDatabaseProvider);
  return db.getAchievements();
});

/// Provider for unlocked achievements
final unlockedAchievementsProvider = Provider<List<AchievementModel>>((ref) {
  final db = ref.watch(dummyDatabaseProvider);
  return db.getUnlockedAchievements();
});

/// Provider for locked achievements
final lockedAchievementsProvider = Provider<List<AchievementModel>>((ref) {
  final db = ref.watch(dummyDatabaseProvider);
  return db.getLockedAchievements();
});

/// Provider for user statistics
final userStatsProvider = Provider<Map<String, dynamic>>((ref) {
  final db = ref.watch(dummyDatabaseProvider);
  return db.getUserStats();
});
