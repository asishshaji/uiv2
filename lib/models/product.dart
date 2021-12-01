import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  int? id;
  String? created_at;
  String? updated_at;
  String? name;
  String? type;
  num? buy_price;
  num? sell_price;
  num? units;

  Product({
    this.id,
    this.created_at,
    this.updated_at,
    this.name,
    this.type,
    this.buy_price,
    this.sell_price,
    this.units,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
