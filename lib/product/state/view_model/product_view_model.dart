

import 'package:flutter/material.dart';
import 'package:flutter_weefit/feature/home/view_model/state/base/base_cubit.dart';
import 'package:flutter_weefit/product/state/view_model/product_state.dart';

final class ProductViewModel extends BaseCubit<ProductState>{
  ProductViewModel() : super(const ProductState());

  /// Change theme mode
  /// [themeMode] is [ThemeMode.light] or [ThemeMode.dark]
  void changeThemeMode(ThemeMode themeMode){
    emit(state.copWith(themeMode: themeMode));

  }
}
