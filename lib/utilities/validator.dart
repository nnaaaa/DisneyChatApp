import 'package:form_validator/form_validator.dart' show ValidationBuilder;
//   static final nameRegex = RegExp(r"^([a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+ )+[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+$");
//   static final emailRegex = RegExp(r"^[A-Za-z0-9]+@[a-zA-Z]+\.[a-zA-Z]+");

class Validator {
  static String? Function(String?) getPasswordValidator() {
    return ValidationBuilder(requiredMessage: 'Please type your password')
        .required()
        .minLength(8, 'Must be at least 8 characters')
        .maxLength(16, 'Max characters is 16')
        .build();
  }

  static String? Function(String?) getEmailValidator() {
    return ValidationBuilder(requiredMessage: 'Please type your email')
        .required()
        .email('Invalid email')
        .build();
  }

  static String? Function(String?) getTextValidator() {
    return ValidationBuilder(requiredMessage: 'This field can\'t be empty')
        .required()
        .build();
  }
}
