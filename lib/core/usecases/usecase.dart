import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmes_app/core/error/failure.dart';

//Type = output
//NoParams = input
abstract class UseCase<Type, NoParams> {
//call permite que chame a classe direto, sem precisar colocar nomedaclasse.metodo. é só chamar pelo nome direto (recebe um input e output)
  Future<Either<Failure, Type>> call(NoParams params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
