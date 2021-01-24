import 'dart:io';

import 'package:args/args.dart';
import 'package:testapp/cli/main_command.dart';

ArgResults argResults;

Future<void> main(List<String> arguments) async {
  exitCode = 0;
  final parser = ArgParser()..addOption('version', abbr: 'v');
  try {
    exitCode = await MainCommand().run(parser.parse(arguments).arguments);
  } on UnimplementedError catch (e) {
    exitCode = 255;
    stderr.writeln(e.message ?? e.toString());
  } catch (e) {
    exitCode = 255;
    stderr.writeln(e.toString());
  }
}
