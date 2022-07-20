import 'package:disneymobile/dumpModels/chatMessages.dart';

import '../../dumpModels/dumpChat.dart';

class SendMessageAction {
  final ChatMessage message;
  final int id;
  const SendMessageAction({required this.message, required this.id});
}

class ChatState {
  List<Chat> chats;
  ChatState({required this.chats});
}

ChatState updateMessageReducer(ChatState state, action) {
  if (action is SendMessageAction) {
    final chat = state.chats.firstWhere((chat) => chat.id == action.id);
    chat.messages?.add(action.message);
    return ChatState(chats: state.chats);
  }
  return state;
}
