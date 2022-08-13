import 'package:disneymobile/dumpModels/chatMessages.dart';
import 'package:disneymobile/dumpModels/dumpChat.dart';
import 'package:disneymobile/states/slices/slice.dart' show Slice;
import 'package:redux_toolkit/redux_toolkit.dart'
    show createReducer, PayloadAction;
import 'package:disneymobile/models/User.dart';

convertToMessage(String id, message) {
  return MessageSend(
      ChatMessage(
          messageID: id,
          text: message,
          messageType: ChatMessageType.text,
          messageStatus: MessageStatus.not_view,
          isSender: true),
      id);
}

class MessageSend {
  final ChatMessage message;
  final String chatId;

  MessageSend(this.message, this.chatId);
}

class SendMessageAction extends PayloadAction<MessageSend, dynamic, dynamic> {
  const SendMessageAction({required super.payload});

  Object get id => payload.chatId;
}

class ChatSlice extends Slice<List<Chat>> {
  @override
  initState() {
    return dumpChat;
  }

  @override
  reducer() {
    return createReducer<List<Chat>>(initState(), (builder) {
      builder.addCase<SendMessageAction>((state, action) {
        final newState = List<Chat>.from(state);
        newState
            .firstWhere((chat) => chat.id == action.id)
            .messages
            ?.add(action.payload.message);
        return newState;
      });
    });
  }
}
