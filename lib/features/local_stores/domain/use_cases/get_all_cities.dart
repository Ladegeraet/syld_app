import 'package:dartz/dartz.dart';
import 'package:syld_app/core/domain/failure/failure.dart';
import 'package:syld_app/core/domain/use_cases/use_case.dart';
import 'package:syld_app/features/local_stores/domain/entities/city.dart';
import 'package:syld_app/features/local_stores/domain/repositories/city_repository.dart';

class GetAllCities implements UseCase<List<City>, NoParams> {
  final CityRepository repository;

  GetAllCities({this.repository});

  @override
  Future<Either<Failure, List<City>>> call(NoParams params) async {
    return await repository.getAll();
  }
}
