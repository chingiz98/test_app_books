import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:testapp/core/infrastructure/models/errors/app_error.dart';

abstract class SecureStorageBaseProvider {
  const SecureStorageBaseProvider(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  Future<Either<AppError, String>> read({
    @required String key,
  }) async {
    try {
      final value = await _secureStorage.read(key: key);
      if (value != null) {
        return Right(value);
      } else {
        return Left(
          AppUnknownError(message: 'The key `$key` has not yet been created.'),
        );
      }
    } catch (e, s) {
      Logger.root.shout(e, e, s);
      return Left(AppError.fromException(e));
    }
  }

  Future<Either<AppError, Unit>> write({
    @required String key,
    @required String value,
  }) async {
    try {
      await _secureStorage.write(key: key, value: value);
      return const Right(unit);
    } catch (e, s) {
      Logger.root.shout(e, e, s);
      return Left(AppError.fromException(e));
    }
  }

  Future<Either<AppError, Unit>> delete({
    @required String key,
  }) async {
    try {
      await _secureStorage.delete(key: key);
      return const Right(unit);
    } catch (e, s) {
      Logger.root.shout(e, e, s);
      return Left(AppError.fromException(e));
    }
  }

  Future<Either<AppError, Unit>> deleteAll() async {
    try {
      await _secureStorage.deleteAll();
      return const Right(unit);
    } catch (e, s) {
      Logger.root.shout(e, e, s);
      return Left(AppError.fromException(e));
    }
  }
}
