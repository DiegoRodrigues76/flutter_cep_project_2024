import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel{
  String street;
  String city;
  String zipcode;

@override
String toString() => '$street, $city, $zipcode';

  AddressModel(
    {required this.street, required this.city, required this.zipcode});

  factory AddressModel.fromJson(Map<String, dynamic>json) =>
    _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}