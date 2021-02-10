import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syld_app/features/local_stores/domain/entities/city.dart';
import 'package:syld_app/features/local_stores/domain/entities/store.dart';
import 'package:syld_app/features/local_stores/domain/repositories/store_repository.dart';
import 'package:syld_app/features/local_stores/domain/use_cases/get_stores_by_city.dart';

class MockStoreRepository extends Mock implements StoreRepository {}

main() {
  GetStoresByCity useCase;
  MockStoreRepository mockStoreRepository;

  setUp(() {
    mockStoreRepository = MockStoreRepository();
    useCase = GetStoresByCity(repository: mockStoreRepository);
  });

  final tExistingCity = City(
    name: 'Test City',
  );

  final tCityWithoutStores = City(
    name: 'Empty City',
  );

  final tStores = [
    Store(
      name: 'Test 1',
      zipCode: 123,
      description: 'description',
      address: 'address',
      phone: 'phone ',
    ),
    Store(
      name: 'Test 2',
      zipCode: 234,
      description: 'description',
      address: 'address',
      phone: 'phone ',
    )
  ];
  final tNoStores = <Store>[];

  group('GetStoreByCity', () {
    test(
        'should return all stores for city '
        'when called with existing city', () async {
      // arrange
      when(mockStoreRepository.findByCity(any)).thenAnswer((_) async => Right(tStores));

      // act
      final result = await useCase(Params(city: tExistingCity));

      // assert
      expect(result, equals(Right(tStores)));
      verify(mockStoreRepository.findByCity(tExistingCity));
      verifyNoMoreInteractions(mockStoreRepository);
    });

    test(
        'should return empty list'
        'when no stores found by city', () async {
      // arrange
      when(mockStoreRepository.findByCity(any)).thenAnswer((_) async => Right(tNoStores));

      // act
      final result = await useCase(Params(city: tCityWithoutStores));

      // assert
      expect(result, equals(Right(tNoStores)));
      verify(mockStoreRepository.findByCity(tCityWithoutStores));
      verifyNoMoreInteractions(mockStoreRepository);
    });
  });
}
