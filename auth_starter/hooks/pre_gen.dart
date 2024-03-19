import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  try {
    final currentPath = Directory.current.path;
    if (!currentPath.contains('lib')) {
      throw Exception("The output directory should be inside the lib folder.");
    }
  } catch (e) {
    rethrow;
  }
}
