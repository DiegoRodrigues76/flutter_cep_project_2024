import 'package:json_annotation/json_annotation.dart';

part 'company_model.g.dart';

@JsonSerializable()
class CompanyModel{
  String name;
  String catchPhrase;

@override
String toString() => '$name, $catchPhrase';

  CompanyModel({required this.name, required this.catchPhrase});

  factory CompanyModel.fromJson(Map<String, dynamic>json) =>
    _$CompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);
}