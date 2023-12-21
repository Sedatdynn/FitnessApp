import 'package:equatable/equatable.dart';

class AppException extends Equatable implements Exception {
  const AppException({required this.message, required this.statusCode});
  final String message;
  final String statusCode;
  @override
  List<Object?> get props => [message, statusCode];
}

class ServerException extends AppException implements Equatable {
  const ServerException({required super.message, required super.statusCode});
  @override
  List<Object?> get props => [message, statusCode];
}
