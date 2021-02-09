// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) {
  return StoreModel(
    name: json['name'] as String,
    zipCode: json['zipCode'] as int,
    description: json['description'] as String,
    address: json['address'] as String,
    phone: json['phone'] as String,
    thumbnailUri: json['thumbnailUri'] as String,
    email: json['email'] as String,
    web: json['web'] as String,
  );
}

Map<String, dynamic> _$StoreModelToJson(StoreModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'zipCode': instance.zipCode,
      'thumbnailUri': instance.thumbnailUri.toString(),
      'description': instance.description,
      'address': instance.address,
      'phone': instance.phone,
      'email': instance.email,
      'web': instance.web.toString(),
    };
