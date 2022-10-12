import 'package:flutter/material.dart';
import 'package:to_do/models/categories.dart';

Widget taskList(BuildContext context, int index) {
  final Categorie categorie = categories[index];

  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 8,
      vertical: 3,
    ),
    child: ListTile(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 1,
          color: Colors.grey[600]!,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      title: Text("${categorie.name} task"),
      subtitle: Text("${categorie.name} task subtitle"),
      leading: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            width: 1,
            color: categorie.color,
          ),
        ),
        child: Icon(
          categorie.icon,
          color: categorie.color,
          size: 30,
        ),
      ),
      trailing: Icon(
        Icons.edit,
        color: Theme.of(context).primaryColor,
      ),
    ),
  );
}