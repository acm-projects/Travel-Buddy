import 'package:firebase_database/firebase_database.dart';

class Todo {
  String key;
  String subject;
  bool isChecked;
  String userId;

  Todo(this.subject, this.userId, this.isChecked);

  Todo.fromSnapshot(DataSnapshot snapshot) :
        key = snapshot.key,
        userId = snapshot.value["userId"],
        subject = snapshot.value["subject"],
        isChecked = snapshot.value["isChecked"];

  toJson() {
    return {
      "userId": userId,
      "subject": subject,
      "checked": isChecked,
    };
  }
}