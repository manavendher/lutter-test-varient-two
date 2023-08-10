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
      body: useMobileLayout ? MobileView(ldp: ldp) : TabletView(ldp: ldp),
    );
  }
}
