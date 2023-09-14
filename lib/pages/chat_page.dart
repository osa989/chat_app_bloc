import 'package:chatt_app/constants.dart';
import 'package:chatt_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:chatt_app/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/chat_bubble.dart';

class ChatPage extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  final _controller = ScrollController();
  static String id = 'ChatPage';
  // List<Message> messageList = [];
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogo,
              height: 60,
            ),
            Text("Chat"),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                var messageList =
                    BlocProvider.of<ChatCubit>(context).messagesList;
                return ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messageList.length,
                    itemBuilder: (context, index) {
                      return messageList[index].id == email
                          ? ChatBubble(
                              messageObject: messageList[index],
                            )
                          : ChatBubbleForFriend(
                              messageObject: messageList[index],
                            );
                    });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                BlocProvider.of<ChatCubit>(context)
                    .sendMessage(message: data, email: email);
                controller.clear();
                _controller.animateTo(0,
                    duration: Duration(microseconds: 500),
                    curve: Curves.easeIn);
              },
              decoration: InputDecoration(
                filled: true,
                suffixIcon: Icon(
                  Icons.send,
                  color: kPrimaryColor,
                ),
                hintText: "Send Message",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
