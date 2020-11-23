import 'package:bos/studs.dart';
import 'package:bos/validation/Student_validator.dart';
import 'package:flutter/material.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students;
  StudentAdd(List<Student> students) {
    this.students = students;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  var student = Student.withNoInfo();
  var formKey = GlobalKey<FormState>();
  List<Student> students;
  _StudentAddState(List<Student> students) {
    this.students = students;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Student"),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.1,
              MediaQuery.of(context).size.height * 0.01,
              MediaQuery.of(context).size.width * 0.1,
              MediaQuery.of(context).size.height * 0.01),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                buildFNfield(),
                buildLNfield(),
                buildGradefield(),
                buildSubmitButton(),
              ],
            ),
          ),
        ));
  }

  Widget buildFNfield() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Student Name", hintText: "ali"),
      validator: validateFN,
      onSaved: (String value) {
        student.fn = value;
      },
    );
  }

  Widget buildLNfield() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Student Surname", hintText: "ali"),
      validator: validateLN,
      onSaved: (String value) {
        student.ln = value;
      },
    );
  }

  Widget buildGradefield() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Student Grade", hintText: "22121"),
      validator: validateGrade,
      onSaved: (String value) {
        student.grade = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Save"),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print(student.fn + " " + student.ln + " " + student.grade.toString());
          students.add(student);
          Navigator.pop(context);
        }
      },
    );
  }
}
