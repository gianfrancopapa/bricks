import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  final directory = Directory.current.path;
  final vars = context.vars;
  final projectName = vars['project_name'];
  final projectDirectory = "$directory/$projectName";
  final uiPackageDirectory = "$projectDirectory/packages/${projectName}_ui";
  final galleryDirectory = "$uiPackageDirectory/gallery";

  final progress = context.logger.progress(
    'Creating auto generated assets using build_runner',
  );

  await Process.run(
    'flutter',
    ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs'],
    runInShell: true,
    workingDirectory: uiPackageDirectory,
  );

  progress.update('Getting packages');

  await Process.run(
    'flutter',
    ['pub', 'get'],
    runInShell: true,
    workingDirectory: galleryDirectory,
  );

  await Process.run(
    'flutter',
    ['pub', 'get'],
    runInShell: true,
    workingDirectory: uiPackageDirectory,
  );

  await Process.run(
    'flutter',
    ['pub', 'get'],
    runInShell: true,
    workingDirectory: projectDirectory,
  );

  progress.update('Code generation');

  await Process.run(
    'flutter',
    ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs'],
    runInShell: true,
    workingDirectory: uiPackageDirectory,
  );

  progress.update('Running dart fix');

  await Process.run(
    'dart',
    ['fix', '--apply'],
    runInShell: true,
    workingDirectory: galleryDirectory,
  );

  await Process.run(
    'dart',
    ['fix', '--apply'],
    runInShell: true,
    workingDirectory: uiPackageDirectory,
  );

  await Process.run(
    'dart',
    ['fix', '--apply'],
    runInShell: true,
    workingDirectory: projectDirectory,
  );

  progress.complete();
}
