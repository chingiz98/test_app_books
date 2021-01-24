extension EnumX<T extends Object> on T {
  String get key {
    final description = toString();
    final indexOfDot = description.indexOf('.');
    assert(
    indexOfDot != -1 && indexOfDot < description.length - 1,
    'The provided object "$this" is not an enum.',
    );
    return description.substring(indexOfDot + 1);
  }
}
