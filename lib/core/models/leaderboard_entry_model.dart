class LeaderboardEntryModel {
  final String userId;
  final String name;
  final int rank;
  final int points;
  final String? profileImage;

  LeaderboardEntryModel({
    required this.userId,
    required this.name,
    required this.rank,
    required this.points,
    this.profileImage,
  });

  factory LeaderboardEntryModel.fromJson(Map<String, dynamic> json) {
    return LeaderboardEntryModel(
      userId: json['userId'] as String,
      name: json['name'] as String,
      rank: json['rank'] as int,
      points: json['points'] as int,
      profileImage: json['profileImage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'rank': rank,
      'points': points,
      'profileImage': profileImage,
    };
  }
}
