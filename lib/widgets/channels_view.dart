import 'package:collabworkx/utils/global_variables.dart';
import 'package:collabworkx/widgets/schedule_meeting_bottomsheet.dart';
import 'package:collabworkx/widgets/set_reminder_bottomsheet.dart';
import 'package:flutter/material.dart';

class ChannelsView extends StatelessWidget {
  // final String spaceViewImageUrl;
  const ChannelsView({
    super.key,
    // required this.spaceViewImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final Size deviceScreen = MediaQuery.of(context).size;
    return Expanded(
      child: SafeArea(
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const Image(
                    image: AssetImage(collabImage),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[100]!))),
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Expanded(
                              child: Text(
                            "CollabWorkx space",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Bring your team's work together",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Material(
                    color: Colors.white,
                    child: ListView(
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.only(top: 16, left: 16, right: 16),
                          child: Text(
                            'CHANNELS',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 30.0),
                          child: ListTile(
                            leading: Icon(Icons.broadcast_on_personal_rounded),
                            title: Text("Community"),
                            trailing: Icon(Icons.mic_off),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 30.0),
                          child: ListTile(
                            leading: Icon(Icons.work_rounded),
                            title: Text("Projects"),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 30.0),
                          child: ListTile(
                            leading: Icon(Icons.cloud_upload_rounded),
                            title: Text("Cloud"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30.0),
                          child: ExpansionTile(
                            leading: const Icon(Icons.videocam_rounded),
                            title: const Text("Meet"),
                            trailing: const Icon(Icons.keyboard_arrow_down),
                            children: [
                              ListTile(
                                leading: const Icon(Icons.videocam_rounded),
                                title: const Text("Schedule a meeting"),
                                onTap: () {
                                  showScheduleMeetingBottomSheet(
                                      context, deviceScreen);
                                },
                              ),
                               ListTile(
                                leading: Icon(Icons.alarm),
                                title: Text("Set a reminder"),
                                

                                onTap: () {
                                  setReminderBottomSheet(
                                      context, deviceScreen);
                                },
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 30.0),
                          child: ListTile(
                            leading: Icon(Icons.workspaces_rounded),
                            title: Text("Tools"),
                            trailing: Icon(Icons.keyboard_arrow_down),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 30.0),
                          child: ListTile(
                            leading: Icon(
                              Icons.people_alt_rounded,
                              color: Colors.blue,
                            ),
                            title: Text("Team Space"),
                            trailing: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
