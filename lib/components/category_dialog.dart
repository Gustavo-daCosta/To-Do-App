import 'package:flutter/material.dart';
import 'package:to_do/models/categories.dart';

class CategoryDialog extends StatelessWidget {

  const CategoryDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final Categorie categorie = categories[index];
    return AlertDialog(
      title: const Text(
        "Choose a category",
        style: TextStyle(
          fontSize: 24,
        ),
      ),
      content: SizedBox(
        height: 320,
        width: 150,
        child: ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder:(context, index) {
            final Categorie categorie = categories[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: categorie.color),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15)
                  )
                ),
                child: InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text(
                      categorie.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    leading: Icon(
                      categorie.icon,
                      size: 30,
                    ),
                    iconColor: categorie.color,
                  ),
                )
              ),
            );
          },
        ),
      ),
    );
  }
}
