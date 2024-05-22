import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hyrule/controllers/dao_controller.dart';
import 'package:hyrule/domain/models/entry.dart';
import 'package:hyrule/screens/details.dart';

class EntryCard extends StatelessWidget {
  EntryCard({super.key, required this.entry, required this.isSaved});
  final bool isSaved;
  final Entry entry;

  final DaoController daoController = DaoController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Dismissible(
        key: ValueKey<int>(entry.id),
        direction:
            isSaved ? DismissDirection.endToStart : DismissDirection.none,
        onDismissed: (direction) {
          daoController.deleteEntry(entry: entry);
        },
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Details(entry: entry),
                    ));
              },
              child: Ink(
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 150,
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
                    Container(
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              overflow: TextOverflow.clip,
                              entry.name,
                              style: const TextStyle(fontSize: 20),
                            ),
                            Text(
                              textAlign: TextAlign.justify,
                              overflow: TextOverflow.clip,
                              entry.description,
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
            Wrap(
              children: entry
                  .commonLocationsConverter()
                  .map(
                    (e) => Chip(
                      label: Text(e),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
