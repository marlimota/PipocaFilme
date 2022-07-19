import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmes_app/core/error/failure.dart';

abstract class UseCase<Type, NoParams> {
  Future<Either<Failure, Type>> call();
}

class NoParams extends Equatable {}
