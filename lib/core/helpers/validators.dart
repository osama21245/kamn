import 'package:kamn/core/helpers/app_regex.dart';

String? emptyValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "Oops! It looks like you missed this one. Please fill it in.";
  }
  return null;
}

String? phoneValidator(String? value) {
  // Check if the value is empty using isEmptyValidator
  String? emptyValidation = emptyValidator(value);
  if (emptyValidation != null) {
    return emptyValidation;
  }
  if (!AppRegex.isPhoneValid(value!)) {
    return "Please enter a valid Egyptian mobile number (starting with 01 followed by 9 numbers).";
  }
  return null;
}

String? numbersValidator(String? value) {
  // Check if the value is empty using isEmptyValidator
  String? emptyValidation = emptyValidator(value);
  if (emptyValidation != null) {
    return emptyValidation;
  }
  if (!AppRegex.isNumber(value!)) {
    return "Please enter a valid number greater than 0.";
  }
  return null;
}
