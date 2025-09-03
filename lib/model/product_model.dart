class ProductModel {
  final String id;
  final Brand brand;
  final String name;
  final String description;
  final double retailPrice;
  final double creditCost;
  final String shippingLocation;
  final String contact;
  final bool status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  ProductModel({
    required this.id,
    required this.brand,
    required this.name,
    required this.description,
    required this.retailPrice,
    required this.creditCost,
    required this.shippingLocation,
    required this.contact,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'] ?? '',
      brand: Brand.fromJson(json['brand'] ?? {}),
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      retailPrice: double.parse(json['retailPrice'].toString() ?? "0"),
      creditCost: double.parse(json['creditCost'].toString() ?? "0"),
      shippingLocation: json['shippingLocation'] ?? '',
      contact: json['contact'] ?? '',
      status: json['status'] ?? false,
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
      v: json['__v'] ?? 0,
    );
  }
}

class Brand {
  final String id;
  final String name;
  final String companyLogo;

  Brand({required this.id, required this.name, required this.companyLogo});

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      companyLogo: json['companyLogo'] ?? '',
      // companyLogo: "https://xeno-hash.s3.us-east-1.amazonaws.com/uploads/brand/companyLogo/1755588456150-android-chrome-512x512.png",
    );
  }
}
