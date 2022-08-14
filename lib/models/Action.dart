import 'package:disneymobile/models/Message.dart';
import 'package:disneymobile/models/React.dart';
import 'package:disneymobile/models/Button.dart';
import 'package:disneymobile/models/Select.dart';

class Action {
  final String actionId;
  final Message message;
  List<React>? reacts;
  List<Button>? buttons;
  List<Select>? selects;

  Action(
      {required this.actionId,
      required this.message,
      this.reacts,
      this.buttons,
      this.selects});

  factory Action.fromJson(Map<String, dynamic> data) {
    final actionId = data['actionId'] as String;

    List<dynamic>? reactsJson = data['reacts'];
    List<dynamic>? buttonsJson = data['buttons'];
    List<dynamic>? selectsJson = data['selects'];

    List<React> reacts = [];
    if (reactsJson != null) {
      reacts = reactsJson.map((i) => React.fromJson(i)).toList();
    } else {
      reacts = [];
    }

    List<Button> buttons = [];
    if (buttonsJson != null) {
      buttons = buttonsJson.map((i) => Button.fromJson(i)).toList();
    } else {
      buttons = [];
    }

    List<Select> selects = [];
    if (selectsJson != null) {
      selects = selectsJson.map((i) => Select.fromJson(i)).toList();
    } else {
      selects = [];
    }
    return Action(
        actionId: actionId,
        message: Message.fromJson(data['message']),
        reacts: reacts,
        buttons: buttons,
        selects: selects,);
  }
}
