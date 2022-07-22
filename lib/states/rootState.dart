import 'package:disneymobile/dumpModels/dumpChat.dart';
import 'package:disneymobile/models/User.dart';
import 'package:disneymobile/states/slices/message.dart';
import 'package:disneymobile/states/slices/user.dart';

class RootState {
  User? user;
  List<Chat>? chats;

  RootState({this.user, this.chats});

  static RootState reducer(RootState state, dynamic action) {
    return RootState(
        user: UserSlice().reducer()(state.user, action),
        chats: ChatSlice().reducer()(state.chats, action));
  }

  static RootState initState() {
    return RootState(
        user: UserSlice().initState(), chats: ChatSlice().initState());
  }
}
