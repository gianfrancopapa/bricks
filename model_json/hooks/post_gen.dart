import 'package:mason/mason.dart';

void run(HookContext context) async {
  final completed = context.logger.progress(
    'Creating auto generated models using build_runner',
  );
  await Process.run(
    'flutter',
    ['pub', 'run', 'build_runner', 'build --delete-conflicting-outputs'],
    runInShell: true,
    workingDirectory: root,
  );
  completed();
}
