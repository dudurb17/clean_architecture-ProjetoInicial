import 'package:flutter/material.dart';
import 'package:hyrule/screens/results.dart';
import 'package:hyrule/utils/consts/categories.dart';

class Category extends StatelessWidget {
  const Category({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Results(
                  category: category,
                ),
              ),
            );
          },
          child: Ink(
            child: Container(
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 36, 36, 36),
                border: Border.all(
                  color: Colors.blue, // Cor da borda
                  width: 2.0,

                  // Largura da borda
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Cor da sombra
                    spreadRadius: 5, // Raio de propagação da sombra
                    blurRadius: 7, // Raio de desfoque da sombra
                    offset: const Offset(
                        0, 2), // Posição da sombra (horizontal, vertical)
                  ),
                ],
              ),
              child: Center(
                child: Image.asset("$imagePath$category.png"),
              ),
            ),
          ),
        ),
        Text(
          categories[category]!,
          style: const TextStyle(color: Colors.blue, fontSize: 20),
        )
      ],
    );
  }
}
