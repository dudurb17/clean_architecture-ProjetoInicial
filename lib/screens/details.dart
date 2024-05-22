import 'package:flutter/material.dart';
import 'package:hyrule/controllers/dao_controller.dart';
import 'package:hyrule/domain/models/entry.dart';

class Details extends StatelessWidget {
  Details({super.key, required this.entry});
  final Entry entry;

  final DaoController daoController = DaoController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Detalhes"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            daoController.saveEntry(entry: entry);
          },
          child: Icon(Icons.bookmark),
        ),
        body: Column(
          children: [
            Text(
              entry.name,
              style: const TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
            ),
            Wrap(
              children: entry
                  .commonLocationsConverter()
                  .map((e) => Chip(
                        label: Text(e),
                      ))
                  .toList(),
            ),
            Container(
              width: 400,
              height: 300,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox.fromSize(
                  size: Size.fromRadius(48),
                  child: Image.network(entry.image, fit: BoxFit.fill),
                ),
              ),
            ),
            Text(entry.description)
          ],
        ),
      ),
    );
  }
}
