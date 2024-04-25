import 'package:chat/controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: use_key_in_widget_constructors
class MessageList extends StatelessWidget {
  final ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return GetX<ChatController>(
      builder: (controller) {
        return ListView.builder(
          reverse: true,
          itemCount: controller.messages.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controller.messages[index]),
            );
          },
        );
      },
    );
  }
}