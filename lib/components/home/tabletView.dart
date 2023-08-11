import 'package:wireviewer/providers/listDataProvider.dart';
import 'package:flutter/material.dart';

import 'detailsWidget.dart';

class TabletView extends StatefulWidget {
  const TabletView({super.key, required this.ldp});

  final ListDataProvider ldp;

  @override
  State<TabletView> createState() => _TabletViewState();
}

class _TabletViewState extends State<TabletView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  widget.ldp.data[index]["Text"].toString().split(" - ")[0],
                  style: const TextStyle(fontSize: 30),
                ),
                onTap: () {
                  widget.ldp.clearSelections();
                  widget.ldp.data[index]["selected"] = true;
                  widget.ldp.notify();
                },
                selected: (widget.ldp.data[index] as Map<String, dynamic>)
                        .containsKey("selected") &&
                    widget.ldp.data[index]["selected"] == true,
              );
            },
            itemCount: widget.ldp.data.length,
          ),
        ),
        Flexible(
          flex: 3,
          child: DetailsWidget(ldp: widget.ldp),
        )
      ],
    );
  }
}
