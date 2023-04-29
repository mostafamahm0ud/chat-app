import 'package:flutter/material.dart';
import 'package:flutter_app_6/constanse.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_6/cubits/chat_cubit/chat_cubit.dart';
import 'package:flutter_app_6/models/message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/chat-bubel.dart';

class ChatPage extends StatelessWidget {
  static String id = 'ChatPage';

  TextEditingController controller = TextEditingController();

  final _controllar = ScrollController();
  List<Message> messagesList = [];
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPramairycolor,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              klogo,
              width: 60,
            ),
            const Text('Cars Chat'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {
                if (state is ChatSuccess) {
                  messagesList = state.messages;
                }
              },
              builder: (context, state) {
                return ListView.builder(
                  reverse: true,
                  controller: _controllar,
                  itemCount: messagesList.length,
                  itemBuilder: (context, index) {
                    return messagesList[index].id == email
                        ? ChatBubel(
                            massage: messagesList[index],
                          )
                        : ChatBubelFriend(massage: messagesList[index]);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                BlocProvider.of<ChatCubit>(context)
                    .sendMessage(message: data, email: email.toString());
                controller.clear();
                _controllar.animateTo(0,
                    duration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn);
              },
              decoration: InputDecoration(
                  hintText: 'Send Message',
                  suffixIcon: const Icon(
                    color: kPramairycolor,
                    Icons.send,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: kPramairycolor,
                      ))),
            ),
          ),
        ],
      ),
    );
  }
}
