class BlogModel {
  final String id;
  final String title;
  final String shortDescription;
  final String description;
  final String image;
  final bool status;
  final DateTime createdAt;

  BlogModel({
    required this.id,
    required this.title,
    required this.shortDescription,
    required this.description,
    required this.image,
    required this.status,
    required this.createdAt,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      shortDescription: json['shortDescription'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      status: json['status'] ?? false,
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
    );
  }
}
