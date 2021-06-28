import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmes_app/core/error/failure.dart';

abstract class UseCase<Type, NoParams> {
  Future<Either<Failure, Type>> call(NoParams params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => throw UnimplementedError();
}
