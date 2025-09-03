class ActionLog {
  final String actionLogId;
  final String actionType;
  final ActionDetails details;
  // final String? gpsLocation;
  // final String? photoProof;
  final String verificationStatus;
  final String reason;
  final double carbonCreditsEarned;
  final double carbonCreditsValue;
  final DateTime timestamp;

  ActionLog({
    required this.actionLogId,
    required this.actionType,
    required this.details,
    required this.reason,
    // this.gpsLocation,
    // this.photoProof,
    required this.verificationStatus,
    required this.carbonCreditsEarned,
    required this.carbonCreditsValue,
    required this.timestamp,
  });

  factory ActionLog.fromJson(Map<String, dynamic> json) {
    return ActionLog(
      actionLogId: json['actionLogId'] ?? '',
      reason: json['reason'] ?? '',
      actionType: json['actionType'] ?? '',
      details: ActionDetails.fromJson(json['details'] ?? {}),
      // gpsLocation: json['gpsLocation'],
      // photoProof: json['photoProof'],
      verificationStatus: json['verificationStatus'] ?? '',
      carbonCreditsEarned: (json['carbonCreditsEarned'] ?? 0).toDouble(),
      carbonCreditsValue: (json['carbonCreditsValue'] ?? 0).toDouble(),
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}

class ActionDetails {
  final String unit;
  final double weight;
  final String id;

  ActionDetails({required this.unit, required this.weight, required this.id});

  factory ActionDetails.fromJson(Map<String, dynamic> json) {
    return ActionDetails(
      unit: json['unit'] ?? '',
      weight: (json['weight'] ?? 0).toDouble(),
      id: json['_id'] ?? '',
    );
  }
}
