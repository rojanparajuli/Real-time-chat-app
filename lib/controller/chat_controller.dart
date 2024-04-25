import 'package:get/get.dart';

class ChatController extends GetxController {
  final messages = <String>[].obs;

  void addMessage(String message) {
    messages.insert(0, message);
  }
}