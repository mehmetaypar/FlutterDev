class Student {
  int id;
  String fn;
  String ln;
  int grade = 0;

  Student(this.fn, this.ln, this.grade);
  Student.withid(this.id, this.fn, this.ln, this.grade);
  Student.withNoInfo();

  String get getfn {
    return "OGR  -" + this.fn;
  }

  set setfn(String val) {
    this.fn = val;
  }

  String get getstatus {
    String message = "";
    if (this.grade < 50) {
      message = "less";
    } else {
      message = "more";
    }

    return message;
  }
}
