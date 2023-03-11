import 'package:flutter/material.dart';
import 'package:map_demo/providers/pin_info_provider.dart';
import 'package:provider/provider.dart';

class PinInfoPanel extends StatelessWidget {
  const PinInfoPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final pinInfo = Provider.of<PinInfoProvider>(context).pinInfo;

    return Positioned(
      bottom: 5.0,
      left: 5.0,
      right: 5.0,
      child: Visibility(
        visible: pinInfo.visibility,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: pinInfo.color,
          ),
          child: ListTile(
            leading: Icon(
              Icons.location_on_sharp,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            title: Text(
              "Pin tapped!",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            subtitle: Text(
              '${pinInfo.msg} is selected',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
