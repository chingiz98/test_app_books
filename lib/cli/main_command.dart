
import './build_command.dart';
import './command.dart';
import './intl/intl_command.dart';
import '../core/infrastructure/extensions/enum_x.dart';

enum _MainCommandList {
  intl,
  release_note,
  build,
}

class MainCommand extends Command {
  @override
  Map<String, Command> get commands => <String, Command>{
        _MainCommandList.intl.key: IntlCommand(),
        _MainCommandList.build.key: BuildCommand(),
      };

  @override
  bool get argumentRequired => true;

  @override
  Future<int> runCommand(List<String> arguments) {
    assert(commands.containsKey(arguments.first),
        'Invalid command `${arguments.first}`. Next possible: $nextPossibleText');

    return commands[arguments.first].run(arguments.sublist(1));
  }
}
