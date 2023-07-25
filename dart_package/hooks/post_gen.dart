import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  final directory = Directory.current.path;
  final vars = context.vars;
  final packageName = vars['package_name'];

  final packageNameFormatted = packageName
      .split(" ")
      .map((word) => word.toLowerCase())
      .toList()
      .join("_");

  final root = "$directory/$packageNameFormatted";

  final progress = context.logger.progress(
    'Running dart pub get in $packageNameFormatted',
  );

  await Process.run(
    'dart',
    ['pub', 'get'],
    runInShell: true,
    workingDirectory: root,
  );
  progress.complete();
}
