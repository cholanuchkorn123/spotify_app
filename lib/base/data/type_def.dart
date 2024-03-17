import 'package:dartz/dartz.dart';
import 'package:spotify_app/base/data/model/app_failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureEitherVoid = FutureEither<void>;
