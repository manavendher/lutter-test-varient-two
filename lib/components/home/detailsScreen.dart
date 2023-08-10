import 'package:wireviewer/components/home/detailsWidget.dart';
import 'package:wireviewer/providers/listDataProvider.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final ListDataProvider ldp;

  const DetailsScreen({super.key, required this.ldp});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Charecter Details")),
      body: DetailsWidget(
        ldp: ldp,
      ),
    );
  }
}
