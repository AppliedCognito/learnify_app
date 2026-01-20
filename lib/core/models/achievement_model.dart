class AchievementModel {
  final String id;
  final String title;
  final String description;
  final String iconName; // e.g., 'trophy', 'star', 'medal'
  final bool isUnlocked;
  final DateTime? unlockedAt;
  final int requiredPoints;

  AchievementModel({
    required this.id,
    required this.title,
    required this.description,
    required this.iconName,
    this.isUnlocked = false,
    this.unlockedAt,
    required this.requiredPoints,
  });

  factory AchievementModel.fromJson(Map<String, dynamic> json) {
    return AchievementModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      iconName: json['iconName'] as String,
      isUnlocked: json['isUnlocked'] as bool? ?? false,
      unlockedAt:
          json['unlockedAt'] != null
              ? DateTime.parse(json['unlockedAt'] as String)
              : null,
      requiredPoints: json['requiredPoints'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'iconName': iconName,
      'isUnlocked': isUnlocked,
      'unlockedAt': unlockedAt?.toIso8601String(),
      'requiredPoints': requiredPoints,
    };
  }
}
