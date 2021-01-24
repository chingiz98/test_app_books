import 'package:testapp/cli/command.dart';
import 'package:testapp/core/infrastructure/extensions/enum_x.dart';

enum _BuildCommandList {
  dev,
  prod,
  stage,
}

class BuildCommand extends Command {
  @override
  bool get argumentRequired => true;

  @override
  Map<String, Command> get commands => {};

  @override
  String get nextPossibleText => _availableCommands.join('|');

  List<String> get _availableCommands =>
      _BuildCommandList.values.map((v) => v.key).toList();

  @override
  Future<int> runCommand(List<String> arguments) {
    assert(arguments.length == 1,
        'Only one argument possible ${nextPossibleText}');
    final env = arguments.first;
    assert(_availableCommands.contains(env),
        'Invalid command `${arguments.first}`. Next possible: $nextPossibleText');

    switch (env) {
    }
    throw UnimplementedError('TODO: implement runCommand');
  }
}
