import 'address_model.dart';
import 'company_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel{
  String name;
  String email;
  AddressModel address;
  CompanyModel company;

@override
String toString() => '$name, $email';

  UserModel(
    {
      required this.name,
      required this.email,
      required this.address,
      required this.company});
  
  factory UserModel.fromJson(Map<String, dynamic>json) =>
    _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}