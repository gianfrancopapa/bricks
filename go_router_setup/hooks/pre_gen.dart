import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  try {
    //Add feature path to template
    final directory = Directory.current.path;
    final folders = directory.toString().split('/').toList();
    final index = folders.indexWhere((folder) => folder == 'lib');
    // Construir las rutas para 'app'
    final rootPath = folders.sublist(0, index + 1).join('/');
    final appPath = '$rootPath/app';

    // Delete 'app' folder
    final appDirectory = Directory(appPath);
    if (await appDirectory.exists()) {
      await appDirectory.delete(recursive: true);
      context.logger.info('Deleted the app folder.');
    }

    //Add go_router to pubspec
    final root = folders.sublist(0, index).join('/').toString();
    final progress = context.logger.progress(
      'Adding dependencies go_router',
    );
    await Process.run(
      'flutter',
      ['pub', 'add', 'go_router'],
      runInShell: true,
      workingDirectory: root,
    );
    progress.complete();
  } catch (_) {
    throw Exception("The output directory should be inside the lib folder.");
  }
}
