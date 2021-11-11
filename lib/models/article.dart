import 'package:flutter/foundation.dart';

class Article {
  final String title;
  final String id;
  final String description;

  const Article({
    @required this.title,
    @required this.id,
    @required this.description,
  });
}
