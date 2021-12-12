import 'package:json_annotation/json_annotation.dart';

part 'orderPreview.g.dart';

@JsonSerializable()
class OrderPreview {
  final String product_name, units_bought, cost, profit;
  OrderPreview(
      {required this.product_name,
      required this.units_bought,
      required this.cost,
      required this.profit});

  factory OrderPreview.fromJson(Map<String, dynamic> json) =>
      _$OrderPreviewFromJson(json);

  Map<String, dynamic> toJson() => _$OrderPreviewToJson(this);
}
