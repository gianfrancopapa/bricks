import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  final directory = Directory.current.path;
  final vars = context.vars;
  final packageName = vars['feature_name'];

  final packageNameFormatted = packageName
      .split(" ")
      .map((word) => word.toLowerCase())
      .toList()
      .join("_");

  final root = "$directory/$packageNameFormatted";

  final progress = context.logger.progress(
    'Running flutter pub get in $packageNameFormatted',
  );

  await Process.run(
    'flutter',
    ['pub', 'get'],
    runInShell: true,
    workingDirectory: root,
  );
  await Process.run(
    'flutter',
    ['pub', 'add', 'flutter_bloc', 'equatable'],
    runInShell: true,
    workingDirectory: root,
  );
  await Process.run(
    'flutter',
    ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs'],
    runInShell: true,
    workingDirectory: root,
  );

  progress.complete();
}
