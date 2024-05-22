import 'package:flutter/material.dart';
import 'package:hyrule/utils/consts/categories.dart';

class name extends StatelessWidget {
  const name({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Ink(
            child: Center(
              child: Image.asset("$imagePath$category.png"),
            ),
          ),
        ),
        Text(categories[category]!)
      ],
    );
  }
}
