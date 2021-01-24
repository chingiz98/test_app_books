# Test App
Тестовое приложение

## Архитектура
Этот проект следует принципам [Google architecture guidelines](https://developer.android.com/jetpack/docs/guide), основанным на архитектуре [BLoC](https://bloclibrary.dev/#/), придерживаясь ряду идей относительно [чистой архитектуры](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html), которые подразумевают разделение слоев проекта на несколько уровней.

Достичь этих идей также помогает использование Dependency Injection с реализацией DI-контейнера при помощи пакета [getIt](https://pub.dev/packages/get_it) в связке с автоматическим внедрением зависимостей через [Injectable](https://pub.dev/packages/injectable). Все модели проекта основаны на использовании неизменяемых объектов [Freezed](https://pub.dev/packages/freezed).

## Требования к среде разработки
* [Dart SDK](https://dart.dev/get-dart) (2.9 и выше)
* [Flutter SDK](https://flutter.dev/docs/get-started/install)
* [Android Studio](https://developer.android.com/studio)

## Начало работы
### Шаг 1
Для установки зависимостей проекта переходим в корневую директорию и запускаем команду:
```shell script
$ flutter pub get packages
```

### Шаг 2 (генерация файлов локализации)
В качестве терминала должен использваться .zsh
```shell script
$ ./jump intl extract
$ ./jump intl generate
```

### Шаг 3
Этот проект также зависим от библиотек, которые используют кодогенерацию, поэтому, необходимо запустить следующую команду для генерации этих файлов:
```shell script
$ flutter packages pub run build_runner build --delete-conflicting-outputs
```


### Шаг 4
Собирать проект из файла 

```shell script
main_dev.dart
```

### Проблемы с кодогенерацией?
Убедитесь, что вы применяете все свои изменения в коде — запуском кодогенерации. Если же что-то пошло не так, то вы всегда можете удалить сгенерированные файлы следующей командой:
```shell script
$ flutter packages pub run build_runner clean
```
и перезапустить кодогенерацию, вернувшись к шагу [№3](#шаг-3).

