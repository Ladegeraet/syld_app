import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syld_app/features/local_stores/data/remote/models/store_model.dart';
import 'package:syld_app/features/local_stores/domain/entities/store.dart';

import '../../../../../fixtures/fixture_reader.dart';

main() {
  final tStore = StoreModel(
    name: 'Test-Store',
    zipCode: 65195,
    description: 'description',
    address: 'address',
    phone: 'phone',
    web: 'google.de',
    email: 'email',
    thumbnailUri: 'https://dummyimage.com/16:9x1080/',
  );

  final tStores = [tStore];

  test('should be a subclass of Store', () async {
    // assert
    expect(tStore, isA<Store>());
  });

  group('fromJson', () {
    test('should return a valid [StoreModel] when json is also valid', () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('store.json'));
      // act
      final result = StoreModel.fromJson(jsonMap);
      // assert
      expect(result, equals(tStore));
    });

    test('should throw an [NoSuchMethodError] when json is invalid', () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('city.json'));
      // act
      final result = () => StoreModel.fromJson(jsonMap);
      // assert
      expect(() => result(), throwsNoSuchMethodError);
    });
  });

  group('fromJsonList', () {
    test('should return a valid list of [StoreModel] when json is also valid', () async {
      // arrange
      final jsonMap = json.decode(fixture('stores.json'));
      // act
      final result = StoreModel.fromJsonList(jsonMap);
      // assert
      expect(result, containsAll(tStores));
    });
  });
}
