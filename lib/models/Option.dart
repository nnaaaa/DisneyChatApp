import 'package:disneymobile/models/Select.dart';


class Option {
  final String optionId;
  final String value;
  final String description;
  final Select select;

  Option(
      {required this.optionId,
      required this.value,
      required this.description,
      required this.select,});

  factory Option.fromJson(Map<String, dynamic> data) {
    final optionId = data['optionId'] as String;
    final value = data['value'] as String;
    final description = data['description'] as String;
  
  
    return Option(
      optionId: optionId,
      value: value,
      description: description,
      select: Select.fromJson(data['select']),
    );
  }
}
