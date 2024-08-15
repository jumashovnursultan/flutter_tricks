import 'package:flutter/material.dart';
import 'package:flutter_tricks/ui/widgets/first_widget.dart';

import 'data/models/trick_model.dart';

final tricks = [
  TrickModel(
    name: 'first widget',
    type: TrickType.widget,
    widget: const FirstWidget(),
  ),
  TrickModel(
    name: 'dialog',
    type: TrickType.dialog,
    widget: const Dialog(),
  ),
];

class ViewTricksScreen extends StatelessWidget {
  const ViewTricksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: tricks.length,
        itemBuilder: (BuildContext context, int index) {
          final trick = tricks[index];

          return const Text('tricks');
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 20,
          );
        },
      ),
    );
  }
}
