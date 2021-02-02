import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syld_app/features/local_stores/data/remote/models/city_model.dart';
import 'package:syld_app/features/local_stores/domain/entities/city.dart';

import '../../../../../fixtures/fixture_reader.dart';

main() {
  final tCity = CityModel(name: "Wiesbaden", zipCodes: [65183]);
  final tCities = [
    CityModel(name: "Wiesbaden", zipCodes: [65183]),
    CityModel(name: "Mainz", zipCodes: [55116]),
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

    test('should throw an [NoSuchMethodError] when json is invalid', () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('city_only_name.json'));
      // act
      final result = () => CityModel.fromJson(jsonMap);
      // assert
      expect(() => result(), throwsNoSuchMethodError);
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
