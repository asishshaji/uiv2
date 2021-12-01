import 'package:json_annotation/json_annotation.dart';

part 'recentorders.g.dart';

@JsonSerializable()
class RecentOrder {
  final int order_id;
  final String phone_number;
  final double profit;
  final String created_at;

  RecentOrder({
    required this.order_id,
    required this.phone_number,
    required this.profit,
    required this.created_at,
  });

  factory RecentOrder.fromJson(Map<String, dynamic> json) =>
      _$RecentOrderFromJson(json);

  Map<String, dynamic> toJson() => _$RecentOrderToJson(this);
}
