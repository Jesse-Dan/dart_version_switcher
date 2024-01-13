import 'package:dart_version_switcher/dart_version_switcher.dart';

/// Entry point of the Dart version switcher script.
///
/// This script initializes the DartUNLINKER class and triggers the process
/// of switching Dart versions using Homebrew based on command-line arguments.
///
/// Usage: dart main.dart <old_version> <new_version>
///
/// - <old_version>: The current Dart version to be unlinked.
/// - <new_version>: The new Dart version to be linked.
void main(List<String> arguments) {
  /// Initialize the DartUNLINKER class with command-line arguments
  DartUNLINKER(arguments);
}
