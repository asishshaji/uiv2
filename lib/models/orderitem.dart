import 'package:json_annotation/json_annotation.dart';

part 'orderitem.g.dart';

@JsonSerializable()
class OrderItem {
  final int p_id;
  final double units;
  OrderItem({required this.p_id, required this.units});

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}
