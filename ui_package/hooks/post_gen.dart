import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  final progress = context.logger.progress(
    'Creating auto generated assets using build_runner',
  );

  final directory = Directory.current.path;
  final vars = context.vars;
  final packageName = vars['package_name'];
  final root = "$directory/${packageName}_ui";
  await Process.run(
    'flutter',
    ['pub', 'get'],
    runInShell: true,
    workingDirectory: root,
  );
  await Process.run(
    'flutter',
    ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs'],
    runInShell: true,
    workingDirectory: root,
  );
  final galleryRoot = "$directory/${packageName}_ui/gallery";
  await Process.run(
    'flutter',
    ['pub', 'get'],
    runInShell: true,
    workingDirectory: galleryRoot,
  );

  progress.complete();
}
