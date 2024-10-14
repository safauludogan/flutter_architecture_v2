///Project service path
enum ProductServicePath {
  login('$_user/Login'),
  userV1('user'),
  posts('posts'),
  userV2('v2/users');

  final String value;
  const ProductServicePath(this.value);

  /// [withQuery] is add query to path
  ///
  /// Example: users/123
  String withQuery(String value) {
    return '${this.value}/$value';
  }

  /// Api UserProfile name
  static const String _user = 'Users/';
  /*static const String _order = 'Order/';
  static const String _barcode = 'Barcode/';
  static const String _scan = 'Scan/';
  static const String _wayybill = 'Irsaliye/';
  */
}
