import 'package:dartz/dartz.dart';
import 'package:syld_app/core/domain/failure/failure.dart';
import 'package:syld_app/features/local_stores/domain/entities/city.dart';

abstract class CityRepository {
  Future<Either<Failure, List<City>>> getAll();
}
