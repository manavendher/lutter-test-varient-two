import 'package:wireviewer/components/home/mobileView.dart';
import 'package:wireviewer/components/home/tabletView.dart';
import 'package:wireviewer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var ldp = ref.watch(listDataProvider);
// The equivalent of the "smallestWidth" qualifier on Android.
    var smallestDimension = MediaQuery.of(context).size.shortestSide;

// Determine if we should use mobile layout or not. The
// number 600 here is a common breakpoint for a typical
// 7-inch tablet.
    final useMobileLayout = smallestDimension < 600;

    return Scaffold(
      appBar: AppBar(title: Text(ldp.title)),
      body: Column(
        children: [
          TextFormField(
            controller: _controller,
            onChanged: (value) => ldp.filterResults(value),
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      _controller.text = "";
                    });

                    ldp.clearFilters();
                  },
                ),
                hintText: 'Search...',
                border: InputBorder.none),
          ),
          Expanded(
              child: useMobileLayout
                  ? MobileView(ldp: ldp)
                  : TabletView(ldp: ldp)),
        ],
      ),
    );
  }
}
