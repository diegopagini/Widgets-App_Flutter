import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ui Controls')),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        // Switch
        SwitchListTile(
            title: const Text('Developer Mode'),
            subtitle: const Text('Extra controls'),
            value: isDeveloper,
            onChanged: (value) => setState(() {
                  isDeveloper = !isDeveloper;
                })),

        // Radio
        ExpansionTile(
          title: const Text('Transportations'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
                title: const Text('By Car'),
                subtitle: const Text('Car'),
                value: Transportation.car,
                groupValue: selectedTransportation,
                onChanged: (value) {
                  setState(() {
                    selectedTransportation = Transportation.car;
                  });
                }),
            RadioListTile(
                title: const Text('By Plane'),
                subtitle: const Text('Plane'),
                value: Transportation.plane,
                groupValue: selectedTransportation,
                onChanged: (value) {
                  setState(() {
                    selectedTransportation = Transportation.plane;
                  });
                }),
            RadioListTile(
                title: const Text('By Boat'),
                subtitle: const Text('Boat'),
                value: Transportation.boat,
                groupValue: selectedTransportation,
                onChanged: (value) {
                  setState(() {
                    selectedTransportation = Transportation.boat;
                  });
                }),
            RadioListTile(
                title: const Text('By Submarine'),
                subtitle: const Text('Submarine'),
                value: Transportation.submarine,
                groupValue: selectedTransportation,
                onChanged: (value) {
                  setState(() {
                    selectedTransportation = Transportation.submarine;
                  });
                })
          ],
        ),

        // Checkbox
        CheckboxListTile(
            title: const Text('Breakfast?'),
            value: wantsBreakfast,
            onChanged: (value) => setState(() {
                  wantsBreakfast = !wantsBreakfast;
                })),

        CheckboxListTile(
            title: const Text('Lunch?'),
            value: wantsLunch,
            onChanged: (value) => setState(() {
                  wantsLunch = !wantsLunch;
                })),

        CheckboxListTile(
            title: const Text('Dinner?'),
            value: wantsDinner,
            onChanged: (value) => setState(() {
                  wantsDinner = !wantsDinner;
                })),
      ],
    );
  }
}
