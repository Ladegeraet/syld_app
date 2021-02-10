import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syld_app/features/local_stores/data/remote/models/city_model.dart';
import 'package:syld_app/features/local_stores/domain/entities/city.dart';

import '../../../../../fixtures/fixture_reader.dart';

main() {
  final tCity = CityModel(name: 'Wiesbaden', id: '1');
  final tCities = [
    CityModel(name: 'Wiesbaden', id: '1'),
    CityModel(name: 'Mainz', id: '2'),
  ];

  test('should be a subclass of City', () async {
    // assert
    expect(tCity, isA<City>());
  });

  group('fromJson', () {
    test('should return a valid [CityModel] when json is also valid', () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('city.json'));
      // act
      final result = CityModel.fromJson(jsonMap);
      // assert
      expect(result, equals(tCity));
    });
  });

  group('fromJsonList', () {
    test('should return a valid list of [CityModel] when json is also valid', () async {
      // arrange
      final jsonMap = json.decode(fixture('cities.json'));
      // act
      final result = CityModel.fromJsonList(jsonMap);
      // assert
      expect(result, containsAll(tCities));
    });
  });
}
