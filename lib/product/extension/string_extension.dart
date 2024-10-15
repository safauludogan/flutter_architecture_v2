import 'package:easy_localization/easy_localization.dart';

extension StringExtension on String {
  String get dateFormat =>
      DateFormat('dd.MM.yyyy').format(DateTime.parse(this));
}
