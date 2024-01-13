import 'dart:io';

/// DartUNLINKER class for switching Dart versions using Homebrew.
class DartUNLINKER {
  /// Constructor for DartUNLINKER.
  /// Takes a list of command-line [arguments].
  DartUNLINKER(List<String> arguments) {
    ///Check if Homebrew is installed
    if (!isBrewInstalled()) {
      print(
          'Homebrew is not installed. Please install Homebrew and try again.');
      exit(1);
    }

    ///Check if the correct number of arguments is provided
    if (arguments.length != 2) {
      print('Usage: dart_version_switcher <old_version> <new_version>');
      exit(1);
    }

    ///Extract old and new Dart version numbers from arguments
    final oldVersion = arguments[0];
    final newVersion = arguments[1];

    try {
      ///Inform the user that Dart switch to the new version is starting
      print('Dart switch to $newVersion started');

      ///Unlink the old version
      var result1 = Process.runSync('brew', ['unlink', 'dart@$oldVersion']);
      print('Dart switch to $newVersion, Process 1 : ${result1.stdout}');

      ///Unlink the new version (to avoid conflicts)
      var result2 = Process.runSync('brew', ['unlink', 'dart@$newVersion']);
      print('Dart switch to $newVersion, Process 2 : ${result2.stdout}');

      ///Link to the new version
      var result3 = Process.runSync('brew', ['link', 'dart@$newVersion']);
      print('Dart switch to $newVersion, Process 3 : ${result3.stdout}');

      ///Inform the user that Dart version has been switched successfully
      print('Dart version switched successfully to $newVersion');
    } catch (e) {
      ///Handle errors and print the error message
      print('Error: $e');
      exit(1);
    }
  }
}

/// Checks if Homebrew is installed on the system.
bool isBrewInstalled() {
  try {
    ///Run 'brew --version' to check if Homebrew is installed
    final result = Process.runSync('brew', ['--version']);

    ///If the command is successful (exit code is 0), return true
    return result.exitCode == 0;
  } catch (_) {
    ///If an exception is caught, Homebrew is not installed; return false
    return false;
  }
}
