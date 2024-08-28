import 'package:flutter/material.dart';
import 'package:flutter_tricks/ui/widgets/first_widget.dart';

import 'data/models/trick_model.dart';
import 'ui/screens/image_viewer_screen.dart';

final tricks = [
  TrickModel(
    name: 'FirstWidget',
    type: TrickType.widget,
    widget: const FirstWidget(),
  ),
  TrickModel(
    name: 'ImageViewer',
    type: TrickType.screen,
    widget: const ImageViewerScreen(),
  ),
  TrickModel(
    name: 'dialog',
    type: TrickType.dialog,
    widget: const AlertDialog(),
  ),
];

class ViewTricksScreen extends StatelessWidget {
  const ViewTricksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchTextController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: StatefulBuilder(
            builder: (context, setState) {
              final searchText = searchTextController.text.toLowerCase().trim();
              final list = searchText.isEmpty
                  ? tricks
                  : tricks
                      .where(
                        (e) => e.name.toLowerCase().contains(searchText),
                      )
                      .toList();

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      controller: searchTextController,
                      decoration: const InputDecoration(hintText: 'Search'),
                    ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      final trick = list[index];
                      if (trick.type == TrickType.widget) {
                        return trick.widget;
                      } else if (trick.type == TrickType.dialog) {
                        return InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return trick.widget;
                              },
                            );
                          },
                          child: Container(
                            height: 100,
                            width: double.infinity,
                            color: Colors.green,
                            alignment: Alignment.center,
                            child: Center(child: Text(trick.name)),
                          ),
                        );
                      } else if (trick.type == TrickType.screen) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => trick.widget,
                              ),
                            );
                          },
                          child: Container(
                            height: 100,
                            width: double.infinity,
                            color: Colors.green,
                            alignment: Alignment.center,
                            child: Text(trick.name),
                          ),
                        );
                      } else {
                        return const Text('is not');
                      }
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
