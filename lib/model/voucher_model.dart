class VoucherModel {
  final String id;
  final Brand brand;
  final String name;
  final String description;
  final int validity;
  final String termsAndCondition;
  final double creditCost;
  final bool status;
  final String? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String code;
  final int v;

  VoucherModel({
    required this.id,
    required this.brand,
    required this.name,
    required this.description,
    required this.validity,
    required this.termsAndCondition,
    required this.creditCost,
    required this.status,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.code,
    required this.v,
  });

  factory VoucherModel.fromJson(Map<String, dynamic> json) {
    return VoucherModel(
      id: json['_id'] ?? '',
      brand: Brand.fromJson(json['brand'] ?? {}),
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      validity: json['validity'] ?? 0,
      termsAndCondition: json['termsAndCondition'] ?? '',
      creditCost: double.parse(json['creditCost'].toString()) ?? 0,
      status: json['status'] ?? false,
      deletedAt: json['deletedAt'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      code: json['code'] ?? '',
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
    );
  }
}
