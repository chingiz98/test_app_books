import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:testapp/core/domain/services/i_logger_service.dart';

@Singleton(as: ILoggerService)
class LoggerService implements ILoggerService {
  const LoggerService._();

  static LoggerService _instance;

  @factoryMethod
  static Future<LoggerService> initialize() async {
    if (_instance == null) {
      Logger.root.level = kDebugMode ? Level.ALL : Level.WARNING;
      Logger.root.onRecord.listen((record) {
        final printStackTrace =
            record.stackTrace?.toString()?.isNotEmpty ?? false;

        var message =
            '${record.level.name}: ${record.time} [${record.loggerName}] ${record.message}';
        if (record.error != null) {
          message +=
              ' [(${record.error.runtimeType}) ${record.error.toString()}]';
        }

        debugPrint(message);

        if (printStackTrace) {
          debugPrint(record.stackTrace.toString());
        }
      });

      _instance = const LoggerService._();
    }

    return _instance;
  }

  static bool _wantSentToSentry(dynamic error) {
    // detect not found && outdated errors
    const isNotFoundError = false;
    const isOutDatedError = false;
    return error != null &&
        isNotFoundError == false &&
        isOutDatedError == false;
  }

  @override
  Logger create(String name) => Logger(name);
}
