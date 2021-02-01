import 'package:dartz/dartz.dart';
import 'package:syld_app/core/domain/failure/failure.dart';
import 'package:syld_app/features/local_stores/domain/entities/city.dart';
import 'package:syld_app/features/local_stores/domain/entities/store.dart';

abstract class StoreRepository {
  Future<Either<Failure, List<Store>>> findByCity(City city);
  Future<Either<Failure, List<Store>>> findByZipCode(int zipCode);
}
