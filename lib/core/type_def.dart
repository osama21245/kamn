import 'package:dartz/dartz.dart';

import 'faliure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureVoid = FutureEither<void>;
