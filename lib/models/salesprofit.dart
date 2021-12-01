import 'package:freezed_annotation/freezed_annotation.dart';

part 'salesprofit.g.dart';

@JsonSerializable()
class SalesProfit {
  // ignore: non_constant_identifier_names
  final List<double> sales_list;
  // ignore: non_constant_identifier_names
  final List<double> profit_list;
  final List<String> dates;

  SalesProfit({
    // ignore: non_constant_identifier_names
    required this.sales_list,
    // ignore: non_constant_identifier_names
    required this.profit_list,
    required this.dates,
  });
  factory SalesProfit.fromJson(Map<String, dynamic> json) =>
      _$SalesProfitFromJson(json);

  Map<String, dynamic> toJson() => _$SalesProfitToJson(this);
}
