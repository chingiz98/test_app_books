extension ObjectX on Object {
  /// Возвращает истину, если объект равен:
  /// - null `Object`
  bool get isNull => this == null;

  /// Возвращает истину, если объект не равен:
  /// - null `Object`
  bool get isNotNull => this != null;

  /// Возвращает истину в случаях, если объект:
  /// - null `Object`
  /// - empty `String`s
  /// - empty `Iterable` (list, set, ...)
  /// - empty `Map`
  bool get isNullOrEmpty =>
      isNull ||
      _isStringObjectEmpty ||
      _isIterableObjectEmpty ||
      _isMapObjectEmpty;

  /// Возвращает истину в случаях, если объект:
  /// - null `Object`
  /// - empty `String`s
  /// - empty `Iterable` (list, set, ...)
  /// - empty `Map`
  bool get isNullEmptyOrFalse =>
      isNull ||
      _isStringObjectEmpty ||
      _isIterableObjectEmpty ||
      _isMapObjectEmpty ||
      _isBoolObjectFalse;

  /// Возвращает истину в случаях, если объект:
  /// - null `Object`
  /// - empty `String`
  /// - empty `Iterable` (list, map, set, ...)
  /// - false `bool`
  bool get isNullEmptyFalseOrZero =>
      isNull ||
      _isStringObjectEmpty ||
      _isIterableObjectEmpty ||
      _isMapObjectEmpty ||
      _isBoolObjectFalse ||
      _isNumObjectZero;

  /// Если объект имеет тип `String`, вызывает String's метод `isEmpty`
  ///
  /// В противном случае возвращает `false`, чтобы не влиять на логическое выражение `OR`.
  /// Поскольку `false` обозначается как undefined или N/A по той причине, что объект не является `String`
  bool get _isStringObjectEmpty => (this is String) && (this as String).isEmpty;

  /// Если объект имеет тип `Iterable`, вызывает Iterable's метод `isEmpty`
  ///
  /// В противном случае возвращает `false`, чтобы не влиять на логическое выражение `OR`.
  /// Поскольку `false` обозначается как undefined или N/A по той причине, что объект не является `Iterable`
  bool get _isIterableObjectEmpty =>
      (this is Iterable) && (this as Iterable).isEmpty;

  /// Если объект имеет тип `Map`, вызывает Iterable's метод `isEmpty`
  ///
  /// В противном случае возвращает `false`, чтобы не влиять на логическое выражение `OR`.
  /// Поскольку `false` обозначается как undefined или N/A по той причине, что объект не является `Map`
  bool get _isMapObjectEmpty => (this is Map) && (this as Map).isEmpty;

  /// Если объект имеет тип `bool`, возвращает выражение `isFalse`
  ///
  /// В противном случае возвращает `false`, чтобы не влиять на логическое выражение `OR`.
  /// Поскольку `false` обозначается как undefined или N/A по той причине, что объект не является `bool`
  bool get _isBoolObjectFalse => (this is bool) && (this as bool) == false;

  /// Если объект имеет тип `num`, возвращает выражение `isZero`
  ///
  /// В противном случае возвращает `false`, чтобы не влиять на логическое выражение `OR`.
  /// Поскольку `false` обозначается как undefined или N/A по той причине, что объект не является `num`
  bool get _isNumObjectZero => (this is num) && (this as num) == 0;
}
