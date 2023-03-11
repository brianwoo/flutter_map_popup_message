import 'package:flutter/material.dart';
import 'package:map_demo/on_tap.dart';
import 'package:map_demo/providers/pin_info_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PinInfoProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Map',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const OnTapPage(),
      ),
    );
  }
}
