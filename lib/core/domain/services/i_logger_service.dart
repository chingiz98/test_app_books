import 'package:logging/logging.dart';

abstract class ILoggerService {
  Logger create(String name);
}
