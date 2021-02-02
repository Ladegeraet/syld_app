import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syld_app/features/local_stores/data/remote/models/city_model.dart';
import 'package:syld_app/features/local_stores/domain/entities/city.dart';

import '../../../../../fixtures/fixture_reader.dart';

main() {
  final tCity = CityModel(name: "Wiesbaden", zipCodes: [65183]);
  final tCityOnlyName = CityModel(name: "Mainz", zipCodes: []);

  test('should be a subclass of City', () async {
    // assert
    expect(tCity, isA<City>());
  });

  group('fromJson', () {
    test('should return a valid model when json is also valid', () async {
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
}
