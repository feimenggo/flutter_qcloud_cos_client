import 'package:flutter/foundation.dart';

enum LogLevel {
  verbose,
  debug,
  info,
  warn,
  error,
}

class Log {
  static LogLevel logLevel = LogLevel.warn;

  static void v(Object message) {
    _log(LogLevel.verbose, message);
  }

  static void d(Object message) {
    if (logLevel.index <= LogLevel.debug.index) {
      _log(LogLevel.debug, message);
    }
  }

  static void i(Object message) {
    if (logLevel.index <= LogLevel.info.index) {
      _log(LogLevel.info, message);
    }
  }

  static void w(Object message) {
    if (logLevel.index <= LogLevel.warn.index) {
      _log(LogLevel.warn, message);
    }
  }

  static void e(Object message,
      {required Error error, StackTrace? stackTrace}) {
    if (logLevel.index <= LogLevel.error.index) {
      _log(LogLevel.error, message, error, stackTrace);
    }
  }

  static void _log(LogLevel logLevel, Object message,
      [Error? error, StackTrace? stackTrace]) {
    debugPrint('${logLevel.name} $message');
    if (null != error) Future.error(error, stackTrace);
  }
}
