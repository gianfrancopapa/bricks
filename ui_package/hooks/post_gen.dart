import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  final progress = context.logger.progress(
    'Creating auto generated assets using build_runner',
  );
  await Process.run(
    'flutter',
    ['pub', 'get'],
    runInShell: true,
  );

  await Process.run(
    'flutter',
    ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs'],
    runInShell: true,
  );
  progress.complete();
}
