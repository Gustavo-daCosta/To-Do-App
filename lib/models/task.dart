import 'package:flutter/material.dart';

class Task {
  final int? id;
  final String title;
  final DateTime deadLineDate;
  final Color color;
  final IconData icon;

  Task({
    this.id,
    required this.title,
    required this.deadLineDate,
    required this.color,
    required this.icon,
  });
}

/*
 * Título
 * Data de entrega
 * Cor
 * Icone
*/