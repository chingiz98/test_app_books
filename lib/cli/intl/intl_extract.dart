import 'dart:io' as io;

import '../command.dart';
import 'intl.config.dart';

class IntlExtract extends Command {
  @override
  bool get argumentRequired => false;

  @override
  Map<String, Command> get commands => {};

  @override
  Future<int> runCommand(List<String> arguments) async {
    final result = await io.Process.run('flutter', [
      'pub',
      'run',
      'intl_translation:extract_to_arb',
      '--output-dir=${L10nConfig.intlArbPath}',
      L10nConfig.intlLocalizationFile,
    ]);

    if (result.exitCode != 0) {
      io.stderr.write(result.stderr);
    } else {
      io.stdout.write(result.stdout);
    }
    return result.exitCode;
  }
}
