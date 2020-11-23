class StudentValidationMixin {
  String validateFN(String value) {
    if (value.length < 2) {
      return "name must be longer than 2 chars";
    }
  }

  String validateLN(String value) {
    if (value.length < 2) {
      return "Lastname must be longer than 2 chars";
    }
  }

  String validateGrade(String value) {
    var grade = int.parse(value);

    if (grade < 0 || grade > 100) {
      return "incomprehensive grade";
    }
  }
}
