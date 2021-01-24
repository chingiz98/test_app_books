import 'dart:io';

abstract class Command {
  const Command();

  Map<String, Command> get commands;

  bool get argumentRequired;

  String get nextPossibleText => commands.keys.join('|');

  Future<int> run(List<String> arguments) {
    assert(!argumentRequired || arguments.isNotEmpty,
        'Incomplete command: $nextPossibleText');

    return runCommand(arguments);
  }

  Future<int> runCommand(List<String> arguments);

  void error(dynamic error) {
    stderr.writeln(error);
  }

  void writeln(dynamic message) {
    stdout.writeln(message);
  }
}
