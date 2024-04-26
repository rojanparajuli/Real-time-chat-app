import 'package:chat/controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageComposer extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();
  final ChatController chatController = Get.find();

  MessageComposer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration.collapsed(
                hintText: 'Send a message',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              if (_textController.text.isNotEmpty) {
                chatController.addMessage(_textController.text);
                _textController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}