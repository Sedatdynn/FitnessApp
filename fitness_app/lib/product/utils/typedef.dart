import 'package:fistness_app_firebase/core/base/exception/exception.dart';
import 'package:fpdart/fpdart.dart';

typedef BaseResponseData<T> = Future<Either<ServerException, T>>;
typedef BaseVoidData = BaseResponseData<void>;
typedef WeightMapType = Map<int, int>;
