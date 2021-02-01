import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syld_app/core/domain/failure/failure.dart';
import 'package:syld_app/core/domain/use_cases/use_case.dart';
import 'package:syld_app/features/local_stores/domain/entities/city.dart';
import 'package:syld_app/features/local_stores/domain/repositories/city_repository.dart';
import 'package:syld_app/features/local_stores/domain/use_cases/get_all_cities.dart';

class MockCityRepository extends Mock implements CityRepository {}

main() {
  GetAllCities useCase;
  MockCityRepository mockCityRepository;

  setUp(() {
    mockCityRepository = MockCityRepository();
    useCase = GetAllCities(repository: mockCityRepository);
  });

  final tCities = [
    City(
      name: "Wiesbaden",
      zipCodes: [65195, 65194, 65193],
    ),
    City(
      name: "Mainz",
      zipCodes: [55128, 55116],
    )
  ];

  final tFailure = UnknownFailure();

  group('GetAllCities', () {
    test('should get all cities from repo', () async {
      // arrange
      when(mockCityRepository.getAll()).thenAnswer((_) async => Right(tCities));

      // act
      final result = await useCase(NoParams());

      // assert
      expect(result, equals(Right(tCities)));
      verify(mockCityRepository.getAll());
      verifyNoMoreInteractions(mockCityRepository);
    });

    test('should return failure when something went wrong', () async {
      // arrange
      when(mockCityRepository.getAll()).thenAnswer((_) async => Left(tFailure));

      // act
      final result = await useCase(NoParams());

      // assert
      expect(result, equals(Left(tFailure)));
      verify(mockCityRepository.getAll());
      verifyNoMoreInteractions(mockCityRepository);
    });
  });
}
