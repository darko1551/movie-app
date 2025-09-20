// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Cast _$CastFromJson(Map<String, dynamic> json) => _Cast(
      id: (json['id'] as num?)?.toInt(),
      knownForDepartment: json['knownForDepartment'] as String?,
      name: json['name'] as String?,
      character: json['character'] as String?,
      profilePath: json['profilePath'] as String?,
    );

Map<String, dynamic> _$CastToJson(_Cast instance) => <String, dynamic>{
      'id': instance.id,
      'knownForDepartment': instance.knownForDepartment,
      'name': instance.name,
      'character': instance.character,
      'profilePath': instance.profilePath,
    };
