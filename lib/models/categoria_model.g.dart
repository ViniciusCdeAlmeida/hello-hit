// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoria_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categoria _$CategoriaFromJson(Map<String, dynamic> json) {
  return Categoria(
    name: json['name'] as String,
    description: json['description'] as String,
    imageUrl: json['imageUrl'] as String,
  );
}

Map<String, dynamic> _$CategoriaToJson(Categoria instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
    };
