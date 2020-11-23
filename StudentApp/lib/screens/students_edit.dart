import 'package:bos/studs.dart';
import 'package:bos/validation/Student_validator.dart';
import 'package:flutter/material.dart';

class StudentEdit extends StatefulWidget {
  Student selectedStudent;
  StudentEdit(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentEditState(selectedStudent);
  }
}

class _StudentEditState extends State with StudentValidationMixin {
  var formKey = GlobalKey<FormState>();
  Student selectedStudent;
  _StudentEditState(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
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
      initialValue: selectedStudent.fn,
      decoration: InputDecoration(labelText: "Student Name", hintText: "ali"),
      validator: validateFN,
      onSaved: (String value) {
        selectedStudent.fn = value;
      },
    );
  }

  Widget buildLNfield() {
    return TextFormField(
      initialValue: selectedStudent.ln,
      decoration:
          InputDecoration(labelText: "Student Surname", hintText: "ali"),
      validator: validateLN,
      onSaved: (String value) {
        selectedStudent.ln = value;
      },
    );
  }

  Widget buildGradefield() {
    return TextFormField(
      initialValue: selectedStudent.grade.toString(),
      decoration:
          InputDecoration(labelText: "Student Grade", hintText: "22121"),
      validator: validateGrade,
      onSaved: (String value) {
        selectedStudent.grade = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Save"),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print(selectedStudent.fn +
              " " +
              selectedStudent.ln +
              " " +
              selectedStudent.grade.toString());

          Navigator.pop(context);
        }
      },
    );
  }
}
