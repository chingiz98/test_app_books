import 'dart:async';
import 'dart:io' as io;
import 'dart:io';

import '../command.dart';
import 'intl.config.dart';

class IntlGenerate extends Command {
  @override
  bool get argumentRequired => false;

  @override
  Map<String, Command> get commands => {};

  @override
  Future<int> runCommand(List<String> arguments) async {
    var dir = Directory(L10nConfig.intlArbPath);
    final arbList = await _findArb(dir);

    int exitCode;
    if (arbList.isNotEmpty) {
      final result = await io.Process.run('flutter', [
        'pub',
        'run',
        'intl_translation:generate_from_arb',
        '--output-dir=${L10nConfig.intlMessagesPath}',
        '${L10nConfig.intlLocalizationFile}',
        ...arbList.map((entry) => entry.path).toList()
      ]);

      exitCode = result.exitCode;
      if (exitCode != 0) {
        io.stderr.write(result.stderr);
      } else {
        io.stdout.write(result.stdout);
      }
    } else {
      io.stderr.writeln('ARB files not found, missing `./jump intl extract`?');
      exitCode = -1;
    }

    return exitCode;
  }

  Future<List<FileSystemEntity>> _findArb(Directory dir) {
    var files = <FileSystemEntity>[];
    var completer = Completer<List<FileSystemEntity>>();
    var lister = dir.list(recursive: false);
    lister.listen(
      (file) {
        if (file.path.endsWith('.arb')) {
          files.add(file);
        }
      },
      onDone: () => completer.complete(files),
    );
    return completer.future;
  }
}
