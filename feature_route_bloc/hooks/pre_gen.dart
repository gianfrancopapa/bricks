import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  try {
    //Add feature path to template
    final directory = Directory.current.path;
    final folders = directory.toString().split('/').toList();
    final index = folders.indexWhere((folder) => folder == 'lib');
    var featurePath =
        folders.sublist(index + 1, folders.length).join('/').toString();
    final featureName = context.vars['feature_name'];
    if (featurePath.isNotEmpty) featurePath += '/';
    context.vars['path'] = featurePath + featureName;
    
    //Add flutter_bloc & equatable to pubspec
    final addDependencies = context.vars['add_dependencies'];
    if (addDependencies) {
      final root = folders.sublist(0, index).join('/').toString();
      final progress = context.logger.progress(
        'Adding dependencies flutter_bloc equatable',
      );
      await Process.run(
        'flutter',
        ['pub', 'add', 'flutter_bloc', 'equatable'],
        runInShell: true,
        workingDirectory: root,
      );
      progress.complete('Done!');
    }
  } catch (_) {
    throw Exception("The output directory should be inside the lib folder.");
  }
}
