import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:syld_app/features/local_stores/domain/entities/city.dart';

part 'city_model.g.dart';

@JsonSerializable(nullable: false)
class CityModel extends City {
  CityModel({
    @required String name,
    @required List<int> zipCodes,
  }) : super(name: name, zipCodes: zipCodes);

  factory CityModel.fromJson(Map<String, dynamic> json) => _$CityModelFromJson(json);
  Map<String, dynamic> toJson() => _$CityModelToJson(this);

  static List<CityModel> fromJsonList(Iterable json) {
    return List<CityModel>.from(json.map((model) => CityModel.fromJson(model)));
  }
}
