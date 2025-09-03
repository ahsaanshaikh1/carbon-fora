class RankModel {
  final int rank;
  final String userName;
  final double creditsEarned;
  final double co2Saved;
  final String badge;

  const RankModel({
    required this.rank,
    required this.userName,
    required this.creditsEarned,
    required this.co2Saved,
    required this.badge,
  });

  factory RankModel.fromJson(Map<String, dynamic> json) {
    return RankModel(
      rank: json['rank'] is String
          ? int.parse(json['rank'])
          : (json['rank'] ?? 0) as int,
      userName: (json['userName'] ?? '') as String,
      creditsEarned: (json['creditsEarned'] is int)
          ? (json['creditsEarned'] as int).toDouble()
          : (json['creditsEarned'] as num?)?.toDouble() ?? 0.0,
      co2Saved: (json['co2Saved'] is int)
          ? (json['co2Saved'] as int).toDouble()
          : (json['co2Saved'] as num?)?.toDouble() ?? 0.0,
      badge: (json['badge'] ?? '') as String,
    );
  }

  // Optional: handy copyWith for updates (kept since it doesn't serialize).
  RankModel copyWith({
    int? rank,
    String? userName,
    double? creditsEarned,
    double? co2Saved,
    String? badge,
  }) {
    return RankModel(
      rank: rank ?? this.rank,
      userName: userName ?? this.userName,
      creditsEarned: creditsEarned ?? this.creditsEarned,
      co2Saved: co2Saved ?? this.co2Saved,
      badge: badge ?? this.badge,
    );
  }
}
