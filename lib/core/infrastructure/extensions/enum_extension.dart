extension EnumExtension<T extends Object> on T {
  String get key => toString().split('.').last;
}
