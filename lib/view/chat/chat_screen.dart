import 'package:chat/view/chat/message.dart';
import 'package:chat/view/chat/message_composer.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: MessageList()),
          const Divider(height: 1.0),
          MessageComposer(),
        ],
      ),
    );
  }
}