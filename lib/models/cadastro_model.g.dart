// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cadastro _$CadastroFromJson(Map<String, dynamic> json) {
  return Cadastro(
    fullName: json['fullName'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    userType: json['userType'] as String,
    userName: json['userName'] as String,
    gender: json['gender'] as String,
    confirmPassword: json['confirmPassword'] as String,
  );
}

Map<String, dynamic> _$CadastroToJson(Cadastro instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'password': instance.password,
      'userType': instance.userType,
      'userName': instance.userName,
      'gender': instance.gender,
      'confirmPassword': instance.confirmPassword,
    };
