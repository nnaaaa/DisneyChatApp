import 'package:disneymobile/dumpModels/chatMessages.dart';
import 'package:disneymobile/dumpModels/dumpChat.dart';
import 'package:disneymobile/dumpModels/dumpUser.dart';
import 'package:disneymobile/dumpModels/myReact.dart';
import 'package:disneymobile/models/Emoji.dart';
import 'package:disneymobile/states/slices/slice.dart' show Slice;
import 'package:redux_toolkit/redux_toolkit.dart'
    show createReducer, PayloadAction;
import 'package:disneymobile/models/User.dart';

class ReactSend {
  final int userId;
  final Emoji emoji;
  final String messageId;

  ReactSend(this.userId, this.emoji, this.messageId);
}

class SendReactAction extends PayloadAction<ReactSend, dynamic, dynamic> {
  const SendReactAction({required super.payload});

  Object get userId => payload.userId;
  Object get messageId => payload.messageId;
}

convertToMessage(int id, String message, String messageID) {
  return MessageSend(
      id,
      ChatMessage(
          messageID: messageID,
          text: message,
          messageType: ChatMessageType.text,
          messageStatus: MessageStatus.not_view,
          isSender: true),
      messageID);
}

class MessageSend {
  final int userID;
  final ChatMessage message;
  final String chatId;

  MessageSend(this.userID, this.message, this.chatId);
}

class SendMessageAction extends PayloadAction<MessageSend, dynamic, dynamic> {
  const SendMessageAction({required super.payload});

  Object get id => payload.userID;
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
      builder.addCase<SendReactAction>((state, action) {
        print(action.messageId);
        final newState = List<Chat>.from(state);
        newState
            .firstWhere((chat) => chat.id == action.userId)
            .messages
            ?.firstWhere((message) => message.messageID == action.messageId)
            .reacts
            ?.add(React(author: cr7, emoji: action.payload.emoji));
        return newState;
      });
    });
  }
}
