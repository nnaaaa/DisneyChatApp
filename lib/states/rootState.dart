

import 'package:disneymobile/models/User.dart';
import 'package:disneymobile/states/slices/user.dart';

class RootState {
User? user;
    
  RootState({this.user});

  static RootState reducer(RootState state, dynamic action) {
    return RootState(user: UserSlice().reducer()(state.user,action));
  }

  static RootState initState() {
    return RootState(user: UserSlice().initState());
    
  }
}
