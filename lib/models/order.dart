import 'package:json_annotation/json_annotation.dart';
import 'package:uiv2/models/orderitem.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  final String phone_number;
  final List<OrderItem> order_items;
  Order({required this.phone_number, required this.order_items});

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
