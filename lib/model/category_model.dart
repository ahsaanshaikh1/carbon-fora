class Category {
  final String id;
  final String name;
  final List<Subcategory> subcategories;

  Category({required this.id, required this.name, required this.subcategories});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      subcategories: (json['subcategories'] as List<dynamic>? ?? [])
          .map((item) => Subcategory.fromJson(item))
          .toList(),
    );
  }
}

class Subcategory {
  final String id;
  final String name;

  Subcategory({required this.id, required this.name});

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(id: json['_id'] ?? '', name: json['name'] ?? '');
  }
}
