// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      buy_price: json['buy_price'] as num?,
      sell_price: json['sell_price'] as num?,
      units: json['units'] as num?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'name': instance.name,
      'type': instance.type,
      'buy_price': instance.buy_price,
      'sell_price': instance.sell_price,
      'units': instance.units,
    };
