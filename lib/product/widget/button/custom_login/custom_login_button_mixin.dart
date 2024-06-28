part of 'custom_login_button.dart';

mixin _CustomLoginButtonMixin
    on MountedMixin<CustomLoginButton>, State<CustomLoginButton> {
  final ValueNotifier<bool> _isLoadingNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _isLoadingNotifier.value = false;
  }

  Future<void> _onPressed() async {
    _isLoadingNotifier.value = true;
    await widget.onOperation.call();
    await safeOperation(() async {
      _isLoadingNotifier.value = false;
    });
  }
}
