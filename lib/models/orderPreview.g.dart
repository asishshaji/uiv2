// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderPreview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderPreview _$OrderPreviewFromJson(Map<String, dynamic> json) => OrderPreview(
      product_name: json['product_name'] as String,
      units_bought: json['units_bought'] as String,
      cost: json['cost'] as String,
      profit: json['profit'] as String,
    );

Map<String, dynamic> _$OrderPreviewToJson(OrderPreview instance) =>
    <String, dynamic>{
      'product_name': instance.product_name,
      'units_bought': instance.units_bought,
      'cost': instance.cost,
      'profit': instance.profit,
    };
