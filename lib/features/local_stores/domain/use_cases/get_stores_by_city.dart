import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:syld_app/core/domain/failure/failure.dart';
import 'package:syld_app/core/domain/use_cases/use_case.dart';
import 'package:syld_app/features/local_stores/domain/entities/city.dart';
import 'package:syld_app/features/local_stores/domain/entities/store.dart';
import 'package:syld_app/features/local_stores/domain/repositories/store_repository.dart';

class GetStoresByCity implements UseCase<List<Store>, Params> {
  final StoreRepository repository;

  GetStoresByCity({
    @required this.repository,
  });

  @override
  Future<Either<Failure, List<Store>>> call(Params params) async {
    return await repository.findByCity(params.city);
    // return stores.fold((failure) => Left(failure), (stores) {
    //   // TODO: the repository should handle this... or refactor test to allow empty list?
    //   if (stores.isEmpty) {
    //     return Left(NoStoresFoundFailure());
    //   } else {
    //     return Right(stores);
    //   }
    // });
  }
}

class Params extends Equatable {
  final City city;

  Params({
    @required this.city,
  });

  @override
  List<Object> get props => [city];
}
