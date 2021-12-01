// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderitem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
      p_id: json['p_id'] as int,
      units: (json['units'] as num).toDouble(),
    );

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'p_id': instance.p_id,
      'units': instance.units,
    };
