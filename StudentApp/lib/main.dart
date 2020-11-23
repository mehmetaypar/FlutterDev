import 'package:bos/screens/student_add.dart';
import 'package:bos/screens/students_edit.dart';
import 'package:flutter/material.dart';
import 'studs.dart';

void main() {
  runApp(MaterialApp(home: MyClassroomApp()));
}

class MyClassroomApp extends StatefulWidget {
  @override
  _MyClassroomAppState createState() {
    return _MyClassroomAppState();
  }
}

class _MyClassroomAppState extends State<MyClassroomApp> {
  String mesaj = "Student Tracker";

  Student choosenStud = Student.withid(0, "", "", 0);

  List<Student> studs = [
    new Student.withid(1, "Eeee", "Dddd", 40),
    new Student.withid(2, "Kkkkk", "Vvvv", 90),
    new Student.withid(3, "Bbbb", "Bbbbb", 40)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: buildBody(context),
    );
  }

  void mesajgoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("sonuç"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: studs.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(studs[index].fn + " " + studs[index].ln),
                leading: CircleAvatar(/*backgroundImage: NetworkImage(),*/),
                subtitle: Text("Sınav sonucu: " +
                    studs[index].grade.toString() +
                    "  " +
                    studs[index].getstatus),
                onTap: () {
                  setState(() {
                    choosenStud = studs[index];
                  });
                  print(studs[index].fn + " " + studs[index].ln);
                },
                trailing: buildStatusIcon(studs[index].grade),
              );
            },
          ),
        ),
        Text("Choosen student: " + choosenStud.fn),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                //////////////////////////////////////////////////

                //////////////////////////////////////////////////

                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Text("New Stud"),
                  ],
                ),

                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudentAdd(studs),
                      ));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                child: Row(
                  children: [
                    Icon(Icons.replay),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Text("Güncelle"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudentEdit(choosenStud),
                      ));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Text("Sil"),
                  ],
                ),
                onPressed: () {
                  var mesaj = "removed Stud";
                  setState(() {
                    studs.remove(choosenStud);
                  });
                  ////////////////////////////////////////////////////////////////////
                  mesajgoster(context, mesaj);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade > 50) {
      return Icon(Icons.done);
    } else {
      return Icon(Icons.clear);
    }
  }
}
