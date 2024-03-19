import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  try {
    final currentPath = Directory.current.path;
    if (!currentPath.contains('lib')) {
      throw Exception("The output directory should be inside the lib folder.");
    }

    final addDependencies = context.vars['add_dependencies'];
    if (addDependencies) {
      final root = Directory.current.path;
      final progress = context.logger.progress(
        'Adding dependencies flutter_bloc equatable',
      );
      await Process.run(
        'flutter',
        ['pub', 'add', 'flutter_bloc', 'equatable'],
        runInShell: true,
        workingDirectory: root,
      );
      progress.complete();
    }
  } catch (e) {
    rethrow;
  }
}
