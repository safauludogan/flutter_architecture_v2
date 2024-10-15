import 'package:flutter/services.dart';

final class FractionalInputFormatters extends TextInputFormatter {
  static final heightRegExp = RegExp(r'^\d{0,3}(\.\d?)?$');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return heightRegExp.hasMatch(newValue.text) ? newValue : oldValue;
  }
}
