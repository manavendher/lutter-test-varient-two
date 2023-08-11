import 'package:wireviewer/components/home/detailsScreen.dart';
import 'package:wireviewer/providers/listDataProvider.dart';
import 'package:flutter/material.dart';

class MobileView extends StatelessWidget {
  const MobileView({super.key, required this.ldp});

  final ListDataProvider ldp;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        var title = ldp.data[index]["Text"].toString().split(" - ")[0];
        return ListTile(
          title: Text(
            title,
            style: const TextStyle(fontSize: 20),
          ),
          onTap: () {
            ldp.clearSelections();
            ldp.data[index]["selected"] = true;
            ldp.notify();
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => DetailsScreen(ldp: ldp)));
          },
        );
      },
      itemCount: ldp.data.length,
    );
  }
}
