import 'package:flutter/material.dart';

class Instrument with ChangeNotifier {
  final String id;
  final String name;
  final String family;
  final int overallQuantity;
  final String type;
  final String typeName;
  final String color;
  final int weight;
  final String url;
  final int price;
  final String description;

  Instrument(
      {@required this.id,
      @required this.name,
      @required this.type,
      @required this.typeName,
      @required this.color,
      @required this.weight,
      @required this.url,
      @required this.price,
      @required this.family,
      @required this.overallQuantity,
      @required this.description});
}
