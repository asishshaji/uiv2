// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recentorders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentOrder _$RecentOrderFromJson(Map<String, dynamic> json) => RecentOrder(
      order_id: json['order_id'] as int,
      phone_number: json['phone_number'] as String,
      profit: (json['profit'] as num).toDouble(),
      created_at: json['created_at'] as String,
    );

Map<String, dynamic> _$RecentOrderToJson(RecentOrder instance) =>
    <String, dynamic>{
      'order_id': instance.order_id,
      'phone_number': instance.phone_number,
      'profit': instance.profit,
      'created_at': instance.created_at,
    };
