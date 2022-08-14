import 'package:disneymobile/models/Action.dart';
import 'package:disneymobile/models/Option.dart';

enum SelectStyle {
  primary,
  secondary,
}

class Select {
  final String selectId;
  final String customId;
  final bool isDisabled;
  final SelectStyle style;
  final Action action;
  List<Option>? options;

  Select(
      {required this.selectId,
      required this.customId,
      required this.isDisabled,
      required this.style,
      required this.action,
      this.options});

  factory Select.fromJson(Map<String, dynamic> data) {
    final selectId = data['selectId'] as String;
    final customId = data['customId'] as String;
    final isDisabled = data['isDisabled'];
    final style = data['style'] as SelectStyle;

    List<dynamic>? optionsJson = data['reacts'];

    List<Option> options = [];
    if (optionsJson != null) {
      options = optionsJson.map((i) => Option.fromJson(i)).toList();
    } else {
      options = [];
    }

    return Select(
        selectId: selectId,
        customId: customId,
        isDisabled: isDisabled,
        style: style,
        options: options,
        action: Action.fromJson(data['action']));
  }
}
