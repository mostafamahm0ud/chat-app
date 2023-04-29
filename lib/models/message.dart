import 'package:flutter_app_6/constanse.dart';

class Message {
  final String message;
  final String id;


  Message(this.message,this.id);

  factory Message.fromJson( jsonDate) {
    return Message(jsonDate[kMassage],jsonDate[uniqId]);
  }
}
