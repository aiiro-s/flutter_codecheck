// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RepositoryItem _$$_RepositoryItemFromJson(Map<String, dynamic> json) =>
    _$_RepositoryItem(
      id: json['id'] as int?,
      name: json['name'] as String?,
      owner: json['owner'] == null
          ? null
          : RepositoryOwner.fromJson(json['owner'] as Map<String, dynamic>),
      html_url: json['html_url'] as String?,
      description: json['description'] as String?,
      stargazers_count: json['stargazers_count'] as int?,
      watchers_count: json['watchers_count'] as int?,
      language: json['language'] as String?,
      forks_count: json['forks_count'] as int?,
      open_issues_count: json['open_issues_count'] as int?,
    );

Map<String, dynamic> _$$_RepositoryItemToJson(_$_RepositoryItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'owner': instance.owner,
      'html_url': instance.html_url,
      'description': instance.description,
      'stargazers_count': instance.stargazers_count,
      'watchers_count': instance.watchers_count,
      'language': instance.language,
      'forks_count': instance.forks_count,
      'open_issues_count': instance.open_issues_count,
    };
