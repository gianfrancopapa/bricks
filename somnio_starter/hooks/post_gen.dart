import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  var progress = context.logger.progress(
    'Creating auto generated assets using build_runner',
  );

  final directory = Directory.current.path;
  final vars = context.vars;
  final projectName = vars['project_name'];
  final projectRoot = "$directory/$projectName";
  final root = "$projectRoot/packages/${projectName}_ui";
  final galleryRoot = "$projectRoot/packages/${projectName}_ui/gallery";

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

  progress = context.logger.progress(
    'Getting packages',
  );

  await Process.run(
    'flutter',
    ['pub', 'get'],
    runInShell: true,
    workingDirectory: galleryRoot,
  );

  await Process.run(
    'flutter',
    ['pub', 'get'],
    runInShell: true,
    workingDirectory: projectRoot,
  );

  progress.complete();
}
