// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      street: json['street'] as String,
      city: json['city'] as String,
      zipcode: json['zipcode'] as String,
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'street': instance.street,
      'city': instance.city,
      'zipcode': instance.zipcode,
    };
