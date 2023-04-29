import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_6/models/message.dart';
import 'package:meta/meta.dart';

import '../../constanse.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference massage =
      FirebaseFirestore.instance.collection(kMassagesCollections);
  void sendMessage({required String message, required String email}) {
    try {
      massage.add(
        {
          kMassage: message,
          kCreatedAt: DateTime.now(),
          uniqId: email,
        },
      );
    } on Exception catch (e) {}
  }

  void getMessages() {
    massage.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      List<Message> messagesList = [];
      for (var doc in event.docs) {
        messagesList.add(Message.fromJson(doc));
      }
      emit(ChatSuccess(messages: messagesList));
    });
  }
}
