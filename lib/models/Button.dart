import 'package:disneymobile/models/Command.dart';
import 'package:disneymobile/models/Member.dart';
import 'package:disneymobile/models/Action.dart';

enum ButtonStyle {
    primary,
    secondary,
    success,
    warning,
    error,
}

class Button {
  final String botId;
  final String customId;
  final String name;
  final bool isDisabled;
  final ButtonStyle style;
  final Action action;

  Button(
      {required this.botId,
      required this.customId,
      required this.name,
      required this.isDisabled,
      required this.style,
      required this.action});

  factory Button.fromJson(Map<String, dynamic> data) {
    final botId = data['botId'] as String;
    final customId = data['customId'] as String;
    final name = data['name'] as String;
    final isDisabled = data['isDisabled'];
    final style = data['style'] as ButtonStyle;
   

    return Button(
        botId: botId,
        customId: customId,
        name: name,
        isDisabled: isDisabled,
        style: style,
        action: Action.fromJson(data['action']));
  }
}
