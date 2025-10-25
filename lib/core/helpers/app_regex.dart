class AppRegex {
  // ✅ Email validation
  static bool isEmailValid(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.[a-zA-Z]+(\.[a-zA-Z]+)*$').hasMatch(email);
  }

  // ✅ Strong password (8+ chars, upper, lower, number, special)
  static bool isPasswordValid(String password) {
    return RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    ).hasMatch(password);
  }

  // ✅ Goal validation (matches your enum values)
  static bool isGoalValid(String goal) {
    return RegExp(r'^(Improve_Shape|Lean_Tone|Lose_Fat)$').hasMatch(goal);
  }

  static bool isWeightValid(String weight) {
    final value = double.tryParse(weight);
    if (value == null) return false;
    return value > 20 && value < 300; // sane upper bound just in case
  }

  // ✅ Height validation: must be between 90cm and 200cm, allows decimals
  static bool isHeightValid(String height) {
    final value = double.tryParse(height);
    if (value == null) return false;
    return value >= 90 && value <= 300;
  }
}
