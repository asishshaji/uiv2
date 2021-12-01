// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salesprofit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesProfit _$SalesProfitFromJson(Map<String, dynamic> json) => SalesProfit(
      sales_list: (json['sales_list'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      profit_list: (json['profit_list'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      dates: (json['dates'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$SalesProfitToJson(SalesProfit instance) =>
    <String, dynamic>{
      'sales_list': instance.sales_list,
      'profit_list': instance.profit_list,
      'dates': instance.dates,
    };
