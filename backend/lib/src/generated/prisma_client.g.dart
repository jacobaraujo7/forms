// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prisma_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AggregateClient _$AggregateClientFromJson(Map<String, dynamic> json) =>
    AggregateClient(
      $avg: json['_avg'] == null
          ? null
          : ClientAvgAggregateOutputType.fromJson(
              json['_avg'] as Map<String, dynamic>),
      $sum: json['_sum'] == null
          ? null
          : ClientSumAggregateOutputType.fromJson(
              json['_sum'] as Map<String, dynamic>),
      $min: json['_min'] == null
          ? null
          : ClientMinAggregateOutputType.fromJson(
              json['_min'] as Map<String, dynamic>),
      $max: json['_max'] == null
          ? null
          : ClientMaxAggregateOutputType.fromJson(
              json['_max'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AggregateClientToJson(AggregateClient instance) =>
    <String, dynamic>{
      '_avg': instance.$avg?.toJson(),
      '_sum': instance.$sum?.toJson(),
      '_min': instance.$min?.toJson(),
      '_max': instance.$max?.toJson(),
    };

ClientGroupByOutputType _$ClientGroupByOutputTypeFromJson(
        Map<String, dynamic> json) =>
    ClientGroupByOutputType(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      email: json['email'] as String,
      name: json['name'] as String,
      cpf: json['cpf'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      $avg: json['_avg'] == null
          ? null
          : ClientAvgAggregateOutputType.fromJson(
              json['_avg'] as Map<String, dynamic>),
      $sum: json['_sum'] == null
          ? null
          : ClientSumAggregateOutputType.fromJson(
              json['_sum'] as Map<String, dynamic>),
      $min: json['_min'] == null
          ? null
          : ClientMinAggregateOutputType.fromJson(
              json['_min'] as Map<String, dynamic>),
      $max: json['_max'] == null
          ? null
          : ClientMaxAggregateOutputType.fromJson(
              json['_max'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClientGroupByOutputTypeToJson(
        ClientGroupByOutputType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'email': instance.email,
      'name': instance.name,
      'cpf': instance.cpf,
      'city': instance.city,
      'state': instance.state,
      '_avg': instance.$avg?.toJson(),
      '_sum': instance.$sum?.toJson(),
      '_min': instance.$min?.toJson(),
      '_max': instance.$max?.toJson(),
    };

AffectedRowsOutput _$AffectedRowsOutputFromJson(Map<String, dynamic> json) =>
    AffectedRowsOutput(
      count: json['count'] as int,
    );

Map<String, dynamic> _$AffectedRowsOutputToJson(AffectedRowsOutput instance) =>
    <String, dynamic>{
      'count': instance.count,
    };

ClientCountAggregateOutputType _$ClientCountAggregateOutputTypeFromJson(
        Map<String, dynamic> json) =>
    ClientCountAggregateOutputType(
      id: json['id'] as int,
      createdAt: json['createdAt'] as int,
      email: json['email'] as int,
      name: json['name'] as int,
      cpf: json['cpf'] as int,
      city: json['city'] as int,
      state: json['state'] as int,
      $all: json['_all'] as int,
    );

Map<String, dynamic> _$ClientCountAggregateOutputTypeToJson(
        ClientCountAggregateOutputType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'email': instance.email,
      'name': instance.name,
      'cpf': instance.cpf,
      'city': instance.city,
      'state': instance.state,
      '_all': instance.$all,
    };

ClientAvgAggregateOutputType _$ClientAvgAggregateOutputTypeFromJson(
        Map<String, dynamic> json) =>
    ClientAvgAggregateOutputType(
      id: (json['id'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ClientAvgAggregateOutputTypeToJson(
        ClientAvgAggregateOutputType instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

ClientSumAggregateOutputType _$ClientSumAggregateOutputTypeFromJson(
        Map<String, dynamic> json) =>
    ClientSumAggregateOutputType(
      id: json['id'] as int?,
    );

Map<String, dynamic> _$ClientSumAggregateOutputTypeToJson(
        ClientSumAggregateOutputType instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

ClientMinAggregateOutputType _$ClientMinAggregateOutputTypeFromJson(
        Map<String, dynamic> json) =>
    ClientMinAggregateOutputType(
      id: json['id'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      email: json['email'] as String?,
      name: json['name'] as String?,
      cpf: json['cpf'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$ClientMinAggregateOutputTypeToJson(
        ClientMinAggregateOutputType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'email': instance.email,
      'name': instance.name,
      'cpf': instance.cpf,
      'city': instance.city,
      'state': instance.state,
    };

ClientMaxAggregateOutputType _$ClientMaxAggregateOutputTypeFromJson(
        Map<String, dynamic> json) =>
    ClientMaxAggregateOutputType(
      id: json['id'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      email: json['email'] as String?,
      name: json['name'] as String?,
      cpf: json['cpf'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$ClientMaxAggregateOutputTypeToJson(
        ClientMaxAggregateOutputType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'email': instance.email,
      'name': instance.name,
      'cpf': instance.cpf,
      'city': instance.city,
      'state': instance.state,
    };

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      email: json['email'] as String,
      name: json['name'] as String,
      cpf: json['cpf'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
    );

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'email': instance.email,
      'name': instance.name,
      'cpf': instance.cpf,
      'city': instance.city,
      'state': instance.state,
    };
