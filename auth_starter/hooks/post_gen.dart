import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final directory = Directory.current.absolute.path;
  String sourcePath = directory + '/form_inputs';
  final sourceFolder = Directory(sourcePath);
  final contents = Directory.current.parent.listSync();
  final destinationDirectory = contents
      .firstWhere((element) => element.path.contains('packages'), orElse: () {
        final parentPath = Directory.current.parent.path;
        final packagesDirectory = Directory('${parentPath}/packages')
          ..createSync();
        context.logger.info('Creating packages directory');
        return packagesDirectory;
      })
      .path
      .toString();

  if (sourceFolder.existsSync()) {
    Directory(destinationDirectory).createSync(recursive: true);
    String fileName = sourcePath.split('/').last;
    String destinationPath = '$destinationDirectory/$fileName';

    try {
      Directory(sourcePath).renameSync(destinationPath);
      context.logger.success('forms_input package in packages directory');
    } on FileSystemException {
      Directory(sourcePath).deleteSync(recursive: true);
      context.logger.info('forms_input package already in packages directory');
    } catch (e) {
      print('Error: $e');
    }
  } else {
    context.logger.err('Unable to move forms_input into packages directory');
  }

  var progress = context.logger.progress(
    'Adding dependencies to pubspec.yaml',
  );

  await Process.run(
    'dart',
    [
      'pub',
      'add',
      'form_inputs:{"path":"packages/form_inputs"}',
    ],
    runInShell: true,
    workingDirectory: Directory.current.parent.path,
  );

  progress.complete();
  progress = context.logger.progress('Installing packages');

  await Process.run('flutter', ['packages', 'get']);

  progress.complete();
}
