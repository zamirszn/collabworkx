import 'package:collabworkx/widgets/collab_round_icon_button.dart';
import 'package:collabworkx/widgets/collab_dropdown.dart';
import 'package:collabworkx/widgets/date_time_widget.dart';
import 'package:collabworkx/widgets/text_field.dart';
import 'package:flutter/material.dart';

Future<void> setReminderBottomSheet(BuildContext context, Size deviceScreen) {
  return showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return const IndustryBottomSheetContainer();
      });
}

class IndustryBottomSheetContainer extends StatefulWidget {
  const IndustryBottomSheetContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<IndustryBottomSheetContainer> createState() =>
      _IndustryBottomSheetContainerState();
}

class _IndustryBottomSheetContainerState
    extends State<IndustryBottomSheetContainer> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    locationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size deviceScreen = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: deviceScreen.height * 0.8,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          border: Border.all(
            width: 5,
            color: Colors.transparent,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Center(
                  child: SizedBox(
                      width: 50,
                      height: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )),
                ),
              ),
              Row(
                children: const [
                  Icon(
                    Icons.alarm,
                    color: Colors.green,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Set Reminder",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0, left: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Topic",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
              CollabworkxTextInput(
                  hintText: "Add title",
                  textInputType: TextInputType.text,
                  textEditingController: titleController),
              const DateTimeWidget(title: "Start"),
              const DateTimeWidget(title: "End"),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: CollabDropDown(dropdownitems: [
                  "GMT-05:00 Eastern Time (US & Canada)",
                  "WAT-18:00 West African Time ",
                ], hintText: "Pick a timezone"),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0, left: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Location",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
              CollabworkxTextInput(
                  hintText: "Optional",
                  textInputType: TextInputType.text,
                  textEditingController: locationController),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CollabIconRoundButton(
                    color: Colors.red,
                    iconData: Icons.close,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: "Discard",
                  ),
                  CollabIconRoundButton(
                    color: Colors.green,
                    iconData: Icons.check,
                    onPressed: () {},
                    text: "Set Reminder",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
