import 'package:dartz/dartz.dart';
import 'package:movies_app/common/domain/entities/failure.dart';

typedef EitherFailureOr<T> = Future<Either<Failure, T>>;
