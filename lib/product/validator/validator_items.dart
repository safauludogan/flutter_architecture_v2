import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_architecture_v2/product/init/language/locale_keys.g.dart';
import 'package:kartal/kartal.dart';

class ValidatorItems {
  const ValidatorItems(this.text);

  static const int phoneLength = 16;

  final String? text;

  String? get validateFirstName {
    return text.ext.isNotNullOrNoEmpty
        ? null
        : LocaleKeys.validation_firstName.tr();
  }

  String? get validateLastName {
    return text.ext.isNotNullOrNoEmpty
        ? null
        : LocaleKeys.validation_lastName.tr();
  }
}

class ValidateGenericItems<T> {
  const ValidateGenericItems(this.item);

  final T? item;

  String? get validateDropDown {
    return item != null ? null : LocaleKeys.validation_needs.tr();
  }
}
