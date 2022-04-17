import 'package:logger/logger.dart';

abstract class Logging {
  static final log = Logger(
    printer: PrettyPrinter(),
  );

  static void _log({
    required String message,
    required String className,
    required Level level,
    Object? error,
    StackTrace? stackTrace,
  }) {
    log.log(
      level,
      '$className:  $message',
      error,
      stackTrace,
    );
  }

  static void info({
    required String className,
    required String message,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(
      message: message,
      className: className,
      level: Level.info,
      error: error,
      stackTrace: stackTrace,
    );
  }

  static void warn({
    required String className,
    required String message,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(
      message: message,
      className: className,
      level: Level.warning,
      error: error,
      stackTrace: stackTrace,
    );
  }

  static void debug({
    required String className,
    required String message,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(
      message: message,
      className: className,
      level: Level.debug,
      error: error,
      stackTrace: stackTrace,
    );
  }

  static void error({
    required String className,
    required String message,
    required Object error,
    StackTrace? stackTrace,
  }) {
    _log(
      message: message,
      className: className,
      level: Level.error,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
