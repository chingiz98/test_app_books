extension StringX on String {
  /// Переводит первую букву строки в заглавную
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Переводит строку в тип `bool`
  ///

  /// Всегда возвращает `false`, если строка не содержит `true`
  bool toBoolean() => toLowerCase() == 'true';

  /// Возвращает истину в случаях, если строка:
  /// - null
  /// - empty
  /// - whitespace string.
  ///

  /// [Здесь](https://stackoverflow.com/a/59826129/10830091) перечислены символы, считающиеся "пробелами".
  bool get isNullEmptyOrWhitespace => this == null || isEmpty || trim().isEmpty;
}
