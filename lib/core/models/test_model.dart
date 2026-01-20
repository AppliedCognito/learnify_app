class TestModel {
  final String id;
  final String title;
  final String description;
  final int totalQuestions;
  final int answeredQuestions;
  final int duration; // in minutes
  final String? imageUrl;
  final String category; // 'module', 'pyq', 'recommended', etc.
  final String? moduleId;
  final String? year; // for PYQ
  final String? setNumber; // for PYQ
  final String paper; // 'Paper I' or 'Paper II'

  TestModel({
    required this.id,
    required this.title,
    required this.description,
    required this.totalQuestions,
    this.answeredQuestions = 0,
    required this.duration,
    this.imageUrl,
    required this.category,
    this.moduleId,
    this.year,
    this.setNumber,
    this.paper = 'Paper I',
  });

  double get progress =>
      totalQuestions > 0 ? answeredQuestions / totalQuestions : 0.0;

  bool get isCompleted => answeredQuestions >= totalQuestions;

  factory TestModel.fromJson(Map<String, dynamic> json) {
    return TestModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      totalQuestions: json['totalQuestions'] as int,
      answeredQuestions: json['answeredQuestions'] as int? ?? 0,
      duration: json['duration'] as int,
      imageUrl: json['imageUrl'] as String?,
      category: json['category'] as String,
      moduleId: json['moduleId'] as String?,
      year: json['year'] as String?,
      setNumber: json['setNumber'] as String?,
      paper: json['paper'] as String? ?? 'Paper I',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'totalQuestions': totalQuestions,
      'answeredQuestions': answeredQuestions,
      'duration': duration,
      'imageUrl': imageUrl,
      'category': category,
      'moduleId': moduleId,
      'year': year,
      'setNumber': setNumber,
      'paper': paper,
    };
  }
}
