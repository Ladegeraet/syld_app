import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:syld_app/features/local_stores/domain/entities/store.dart';

part 'store_model.g.dart';

@JsonSerializable(nullable: false)
class StoreModel extends Store {
  StoreModel({
    @required String name,
    @required int zipCode,
    @required String description,
    @required String address,
    @required String phone,
    String thumbnailUri,
    String email,
    String web,
  }) : super(
          name: name,
          address: address,
          description: description,
          phone: phone,
          zipCode: zipCode,
          email: email,
          thumbnailUri: Uri.parse(thumbnailUri),
          web: Uri.parse(web),
        );

  factory StoreModel.fromJson(Map<String, dynamic> json) => _$StoreModelFromJson(json);
  Map<String, dynamic> toJson() => _$StoreModelToJson(this);

  static List<StoreModel> fromJsonList(Iterable json) {
    return List<StoreModel>.from(json.map((model) => StoreModel.fromJson(model)));
  }
}
