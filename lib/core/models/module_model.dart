class ModuleModel {
  final String id;
  final String title;
  final String description;
  final int moduleNumber;
  final String paper; // 'Paper I' or 'Paper II'
  final List<String> testIds; // List of test IDs in this module
  final bool isCompleted;

  ModuleModel({
    required this.id,
    required this.title,
    required this.description,
    required this.moduleNumber,
    required this.paper,
    required this.testIds,
    this.isCompleted = false,
  });

  factory ModuleModel.fromJson(Map<String, dynamic> json) {
    return ModuleModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      moduleNumber: json['moduleNumber'] as int,
      paper: json['paper'] as String,
      testIds: List<String>.from(json['testIds'] as List),
      isCompleted: json['isCompleted'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'moduleNumber': moduleNumber,
      'paper': paper,
      'testIds': testIds,
      'isCompleted': isCompleted,
    };
  }
}
