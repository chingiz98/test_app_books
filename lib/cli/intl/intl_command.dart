import './intl_extract.dart';
import './intl_generate.dart';
import '../../core/infrastructure/extensions/enum_x.dart';
import '../command.dart';

enum _L10nCommandList {
  extract,
  generate,
}

class IntlCommand extends Command {
  const IntlCommand() : super();

  @override
  bool get argumentRequired => true;

  @override
  Map<String, Command> get commands => {
        _L10nCommandList.extract.key: IntlExtract(),
        _L10nCommandList.generate.key: IntlGenerate(),
      };

  @override
  Future<int> runCommand(List<String> arguments) {
    assert(commands.containsKey(arguments.first),
        'Invalid command `${arguments.first}`. Next possible: $nextPossibleText');

    return commands[arguments.first].run(arguments.sublist(1));
  }
}
