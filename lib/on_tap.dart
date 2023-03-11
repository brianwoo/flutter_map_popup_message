import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_demo/providers/pin_info_provider.dart';
import 'package:map_demo/widgets/pin_info_panel.dart';
import 'package:provider/provider.dart';

class OnTapPage extends StatefulWidget {
  static const String route = 'on_tap';

  const OnTapPage({Key? key}) : super(key: key);

  @override
  OnTapPageState createState() {
    return OnTapPageState();
  }
}

class OnTapPageState extends State<OnTapPage> {
  static LatLng london = LatLng(51.5, -0.09);
  static LatLng paris = LatLng(48.8566, 2.3522);
  static LatLng dublin = LatLng(53.3498, -6.2603);

  Icon getIcon(Color color) {
    return Icon(
      Icons.location_on_sharp,
      size: 50.0,
      color: color,
    );
  }

  void onTapPin(bool visibility, {String? msg, Color? color}) {
    log("$msg", name: "onTapPin");
    Provider.of<PinInfoProvider>(
      context,
      listen: false,
    ).updatePinInfoPanel(visibility, msg: msg, color: color);
  }

  @override
  Widget build(BuildContext context) {
    final markers = <Marker>[
      Marker(
        width: 80,
        height: 80,
        point: london,
        builder: (ctx) => GestureDetector(
          onTap: () => onTapPin(true, msg: "blue", color: Colors.blue),
          child: getIcon(Colors.blue),
        ),
      ),
      Marker(
        width: 80,
        height: 80,
        point: dublin,
        builder: (ctx) => GestureDetector(
          onTap: () => onTapPin(true, msg: "green", color: Colors.green),
          child: getIcon(Colors.green),
        ),
      ),
      Marker(
        width: 80,
        height: 80,
        point: paris,
        builder: (ctx) => GestureDetector(
          onTap: () => onTapPin(true, msg: "purple", color: Colors.purple),
          child: getIcon(Colors.purple),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('OnTap')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Text('Try tapping on the markers'),
            ),
            Flexible(
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(51.5, -0.09),
                  zoom: 5,
                  maxZoom: 5,
                  minZoom: 3,
                  onTap: (tapPosition, point) => onTapPin(false),
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                  ),
                  MarkerLayer(markers: markers),
                  const PinInfoPanel(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
