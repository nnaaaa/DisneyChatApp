import 'package:disneymobile/states/slices/slice.dart' show Slice;
import 'package:redux_toolkit/redux_toolkit.dart'
    show createReducer, PayloadAction;
import 'package:disneymobile/models/User.dart';

class AddUserAction extends PayloadAction<User,dynamic,dynamic> {
  const AddUserAction({required super.payload});
}

class UserSlice extends Slice<User> {
	@override
  initState() {
    return null;
  }

	@override
  reducer() {
    return createReducer<User?>(
        initState(), (builder) => builder.addCase<AddUserAction>((state, action) => action.payload));
  }
}
