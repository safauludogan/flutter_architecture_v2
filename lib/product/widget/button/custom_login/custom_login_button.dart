import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weefit/product/widget/button/normal_button.dart';
import 'package:widgets/widgets.dart';

part 'custom_login_button_mixin.dart';

/// CustomLoginButton with loading and AsyncCallback
final class CustomLoginButton extends StatefulWidget {
  const CustomLoginButton({required this.onOperation, super.key});

  final AsyncCallback onOperation;

  @override
  State<CustomLoginButton> createState() => _CustomLoginButtonState();
}

class _CustomLoginButtonState extends State<CustomLoginButton>
    with MountedMixin, _CustomLoginButtonMixin {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isLoadingNotifier,
      builder: (context, value, child) {
        if (value) return const CircularProgressIndicator();
        return NormalButton(
          title: 'Login',
          onPressed: () async {
            await _onPressed();
          },
        );
      },
    );
  }
}
