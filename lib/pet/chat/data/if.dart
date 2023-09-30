import 'package:flutter/foundation.dart';

import '../repository/conversation.dart';
import 'llm.dart';


class ChatIF extends LLM {
  @override
  getResponse(
      List<Message> messages,
      ValueChanged<Message> onResponse,
      ValueChanged<Message> errorCallback,
      ValueChanged<Message> onSuccess) async {
    // TODO: implement getResponse
    throw UnimplementedError();
  }
}
