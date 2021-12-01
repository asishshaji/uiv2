// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dashboard _$DashboardFromJson(Map<String, dynamic> json) => Dashboard(
      profit: (json['profit'] as num).toDouble(),
      orders: json['orders'] as int,
      sales: (json['sales'] as num).toDouble(),
    );

Map<String, dynamic> _$DashboardToJson(Dashboard instance) => <String, dynamic>{
      'profit': instance.profit,
      'orders': instance.orders,
      'sales': instance.sales,
    };
