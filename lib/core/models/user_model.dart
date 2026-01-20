class UserModel {
  final String id;
  final String name;
  final String email;
  final String? profileImage;
  final int trophies;
  final int streak;
  final int points;
  final int rank;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.profileImage,
    required this.trophies,
    required this.streak,
    required this.points,
    required this.rank,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      profileImage: json['profileImage'] as String?,
      trophies: json['trophies'] as int,
      streak: json['streak'] as int,
      points: json['points'] as int,
      rank: json['rank'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profileImage': profileImage,
      'trophies': trophies,
      'streak': streak,
      'points': points,
      'rank': rank,
    };
  }
}
