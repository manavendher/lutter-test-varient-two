import 'package:wireviewer/env.dart';
import 'package:wireviewer/providers/listDataProvider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class DetailsWidget extends StatefulWidget {
  const DetailsWidget({
    super.key,
    required this.ldp,
  });

  final ListDataProvider ldp;

  @override
  State<DetailsWidget> createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  @override
  Widget build(BuildContext context) {
    var selected = widget.ldp.data.isNotEmpty
        ? widget.ldp.data.firstWhere(
            (element) =>
                (element as Map<String, dynamic>).containsKey("selected") &&
                element["selected"] == true, orElse: () {
            return {};
          })
        : {};

    // Logger().d(selected);
    if (selected != null && (selected as Map).isNotEmpty) {
      Logger().d(selected["Icon"]);
      return SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: environment["imgBaseUrl"] + selected["Icon"]["URL"],
              placeholder: imagePlaceHolder,
              errorWidget: imageErrorWidget,
              height: double.tryParse(selected["Icon"]["Height"]) ?? 300,
              width: double.tryParse(selected["Icon"]["Width"]) ?? 300,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "Name: ${selected["Text"].toString().split(" - ")[0]}",
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "Description: ${selected["Text"].toString().split(" - ")[1]}",
                    style: const TextStyle(fontSize: 24),
                  )),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return const Center(
        child: Text(
          "Please select a charecter on the left to see more details.",
          style: TextStyle(fontSize: 24),
        ),
      );
    }
  }

  Widget Function(BuildContext, String)? imagePlaceHolder =
      (context, url) => const LinearProgressIndicator(
            backgroundColor: Colors.grey,
            color: Colors.green,
          );

  Widget Function(BuildContext, String, dynamic)? imageErrorWidget =
      (context, url, error) => const SizedBox(
            width: 300,
            height: 300,
            child: Center(child: Text("Image coming soon")),
          );
}
