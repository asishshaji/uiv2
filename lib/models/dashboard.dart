import 'package:json_annotation/json_annotation.dart';

part 'dashboard.g.dart';

@JsonSerializable()
class Dashboard {
  final double profit;
  final int orders;
  final double sales;

  Dashboard({
    required this.profit,
    required this.orders,
    required this.sales,
  });

  factory Dashboard.fromJson(Map<String, dynamic> json) =>
      _$DashboardFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardToJson(this);
}
