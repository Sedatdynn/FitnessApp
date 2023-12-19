import 'package:equatable/equatable.dart';
import 'package:fistness_app_firebase/core/base/exception/exception.dart';

abstract class Failure extends Equatable {
  const Failure({required this.message, required this.statusCode});
  final String message;
  final dynamic statusCode;

  @override
  List<dynamic> get props => [message, statusCode];
}

class FirebaseFailure extends Failure {
  const FirebaseFailure({required super.message, required super.statusCode});
  FirebaseFailure.fromException(FirebaseException exception)
      : this(message: exception.message, statusCode: exception.statusCode);
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message, required super.statusCode});
  ServerFailure.fromException(ServerException exception)
      : this(message: exception.message, statusCode: exception.statusCode);
}
