import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_v2/product/utility/constants/enums/locales.dart';

@immutable

/// Product localization manager
final class ProductLocalization extends EasyLocalization {
  /// ProductLocalization need to [child] for a wrap locale item
  ProductLocalization({
    required super.child,
    super.key,
  }) : super(
          supportedLocales: _supportedItems,
          path: _translationPath,
          useOnlyLangCode: true,
        );

  /// Project supported locales
  static final List<Locale> _supportedItems = [
    Locales.tr.locale,
    Locales.en.locale,
  ];

  static const String _translationPath = 'assets/translations';

  /// Change app language by using [Locales]
  static void updateLanguage({
    required BuildContext context,
    required Locales value,
  }) =>
      context.setLocale(value.locale);
}
