import 'package:flutter/material.dart';

class Category {
  final String name;
  final IconData icon;
  final List<SubCategory> subcategories;

  Category({
    required this.name,
    required this.icon,
    this.subcategories = const [],
  });
}

class SubCategory {
  final String name;

  SubCategory({
    required this.name,
  });
}


