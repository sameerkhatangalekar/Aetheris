import 'package:aetheris/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCase<Success, Params> {
  Future<Either<Failure, Success>> call(Params param);
}
