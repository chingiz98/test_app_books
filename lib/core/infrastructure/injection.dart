import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:testapp/core/infrastructure/injection.config.dart';

const stage = Environment(EnvironmentX.stage);

final GetIt getIt = GetIt.instance;

@injectableInit
Future<GetIt> configureInjection(Environment environment) async {
  return $initGetIt(getIt, environment: environment.name);
}

extension EnvironmentX on Environment {
  static const stage = 'stage';

  /// Проверяет, является ли окружение средой разработки
  bool get isDev => name == Environment.dev;

  /// Проверяет, не является ли окружение средой разработки
  bool get isNotDev => name != Environment.dev;

  /// Проверяет, является ли окружение промежуточной средой для тестирования
  bool get isStage => name == stage;

  /// Проверяет, не является ли окружение промежуточной средой для тестирования
  bool get isNotStage => name != stage;

  /// Проверяет, является ли окружение производственной средой
  bool get isProd => name == Environment.prod;

  /// Проверяет, не является ли окружение производственной средой
  bool get isNotProd => name != Environment.prod;
}
