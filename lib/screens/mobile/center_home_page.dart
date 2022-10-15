import 'package:collabworkx/utils/colors.dart';
import 'package:collabworkx/widgets/add_space_dialog.dart';
import 'package:collabworkx/widgets/digital_space_index_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../widgets/overlapping_panels.dart';

class CenterHomePage extends StatefulWidget {
  const CenterHomePage({super.key});

  @override
  State<CenterHomePage> createState() => _CenterHomePageState();
}

class _CenterHomePageState extends State<CenterHomePage> {
  bool isFabBig = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size deviceScreen = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: isFabBig
            // this might be a wrong way to use the animated switcher
            // i could have just put everything in a function but hey
            // wheres the fun without maybe losing some fps
            ? AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: FloatingActionButton.extended(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    addSpaceDialog(context);
                  },
                  label: const Text("Add Space"),
                ),
              )
            : AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () {
                    addSpaceDialog(context);
                  },
                ),
              ),
        body: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (notification.direction == ScrollDirection.forward) {
              setState(() {
                isFabBig = true;
              });
            } else if (notification.direction == ScrollDirection.reverse) {
              setState(() {
                isFabBig = false;
              });
            }
            return true;
          },
          child: CustomScrollView(
            // floatHeaderSlivers: true,
            slivers: [
              SliverAppBar(
                backgroundColor: collabGrey,
                title: const Text(
                  "Digital Spaces",
                ),
                elevation: 1,
                leading: IconButton(
                  icon: const Icon(
                    Icons.menu,
                  ),
                  onPressed: () {
                    OverlappingPanels.of(context)?.reveal(RevealSide.left);
                  },
                ),
                bottom: const PreferredSize(
                    preferredSize: Size(10, 10),
                    child: Chip(
                        label: Text(
                            "Platform made to manage teams and sync collaborations"))),
                floating: true,
                snap: true,
                expandedHeight: 100,
              ),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: 30,
                  (context, index) => const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: DigitalSpaceIndexWidget(),
                  ),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
              ),
            ],
          ),
        ));
  }
}
