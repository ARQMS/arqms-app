import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

/// Custom Datasource exception
class DataSourceException implements Exception {
  final String? message;

  DataSourceException([this.message]);

  DataSourceException.fromParse(ParseError error) : message = error.message;

  @override
  String toString() {
    if (message == null) return "Exception";
    return "Exception: $message";
  }
}
