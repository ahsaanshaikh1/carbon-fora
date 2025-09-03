class HomeModel {
  final double totalCredits;
  final double totalCo2Saved;
  final double dollarValueEarned;
  final Streak streak;
  final int trueDaysCount; // make it final

  HomeModel({
    required this.totalCredits,
    required this.totalCo2Saved,
    required this.dollarValueEarned,
    required this.streak,
    required this.trueDaysCount,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    final streak = Streak.fromJson(json['streak'] ?? {});

    return HomeModel(
      totalCredits: double.tryParse(json['totalCredits'].toString()) ?? 0,
      totalCo2Saved: double.tryParse(json['totalCo2Saved'].toString()) ?? 0,
      dollarValueEarned:
          double.tryParse(json['dollarValueEarned'].toString()) ?? 0,
      streak: streak,
      trueDaysCount: streak.currentWeekStreak
          .countTrueDays(), // ✅ auto calculate
    );
  }
}

class Streak {
  final int totalStreak;
  final CurrentWeekStreak currentWeekStreak;

  Streak({required this.totalStreak, required this.currentWeekStreak});

  factory Streak.fromJson(Map<String, dynamic> json) {
    return Streak(
      totalStreak: json['totalStreak'] ?? 0,
      currentWeekStreak: CurrentWeekStreak.fromJson(
        json['currentWeekStreak'] ?? {},
      ),
    );
  }
}

class CurrentWeekStreak {
  final bool sunday;
  final bool monday;
  final bool tuesday;
  final bool wednesday;
  final bool thursday;
  final bool friday;
  final bool saturday;

  CurrentWeekStreak({
    required this.sunday,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
  });

  factory CurrentWeekStreak.fromJson(Map<String, dynamic> json) {
    return CurrentWeekStreak(
      sunday: json['sunday'] ?? false,
      monday: json['monday'] ?? false,
      tuesday: json['tuesday'] ?? false,
      wednesday: json['wednesday'] ?? false,
      thursday: json['thursday'] ?? false,
      friday: json['friday'] ?? false,
      saturday: json['saturday'] ?? false,
    );
  }

  /// Helper method to count `true` days
  int countTrueDays() {
    return [
      sunday,
      monday,
      tuesday,
      wednesday,
      thursday,
      friday,
      saturday,
    ].where((day) => day).length;
  }
}
