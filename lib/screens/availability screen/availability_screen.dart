import 'package:dayte/Widget/button_next.dart';
import 'package:dayte/Widget/checkbox_widget.dart';
import 'package:dayte/Widget/snackBar.dart';
import 'package:dayte/Widget/text_widget.dart';
import 'package:dayte/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'controller/availlability_screen_controller.dart';

class AvailabilityScreen extends StatefulWidget {
  const AvailabilityScreen({Key? key}) : super(key: key);

  @override
  State<AvailabilityScreen> createState() => _AvailabilityScreenState();
}

class _AvailabilityScreenState extends State<AvailabilityScreen> {
  AvailabilityScreenController availabilityScreenController =
      Get.put(AvailabilityScreenController());

  void _showDialog(function) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        decoration: BoxDecoration(
            color: CupertinoColors.systemBackground.resolveFrom(context),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        height: SizeScreen.height * 0.35,
        padding: const EdgeInsets.only(top: 6.0),
        // The bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeScreen.height * 0.25,
                child: Center(
                  child: CupertinoDatePicker(
                    initialDateTime: time,
                    mode: CupertinoDatePickerMode.time,
                    use24hFormat: false,
                    // This is called when the user changes the time.
                    onDateTimeChanged: (DateTime newTime) {
                      setState(() {
                        time = newTime;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: ButtonNext(
                  SizeScreen.width * 0.8,
                  SizeScreen.height * 0.07,
                  function,
                  AppColor.red,
                  "Save",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool d1 = false;
  bool d2 = false;
  bool d3 = false;
  bool d4 = false;
  bool d5 = false;
  bool d6 = false;
  bool d7 = false;

  //Time
  // Create a DateTime object that represents the current time
  DateTime time = DateTime(2016, 5, 10, 22, 35);

// Create a DateTime object that represents the first Monday of the month
  DateTime date = findFirstDayInMonth('Monday');

// Create a DateTime object that represents the current time
  DateTime timeToAdd = DateTime.now();

// Create a Duration object that represents the current time
  Duration duration =
      Duration(hours: DateTime.now().hour, minutes: DateTime.now().minute);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        SvgPicture.string(
          backgroundEmpty,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 30, 15, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: TextWidget("Availability", AppColor.red, 25.0,
                            FontWeight.w700, 0.0),
                      ),
                      const SizedBox(height: 5),
                      TextWidget(
                        "Pick your Availability. when you want to have the dayte",
                        AppColor.grey,
                        12.0,
                        FontWeight.w400,
                        0.0,
                        textalign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      CheckboxWidget(
                        text: 'Monday',
                        d: d1,
                        onChange: (val) {
                          if (d1) {
                            setState(() {
                              d1 = false;
                              availabilityScreenController.deleteDay('Monday');
                            });
                          } else {
                            _showDialog(
                              () async {
                                setState(() {
                                  d1 = !d1;
                                  DateTime date = findFirstDayInMonth('Monday');
                                  timeToAdd = DateTime(
                                      date.year,
                                      date.month,
                                      date.day,
                                      time.hour,
                                      time.minute,
                                      time.second);
                                  availabilityScreenController.addDay(
                                      'Monday', timeToAdd);
                                });
                                Get.back();
                              },
                            );
                          }
                        },
                      ),
                      CheckboxWidget(
                        text: 'Tuesday',
                        d: d2,
                        onChange: (val) {
                          if (d2) {
                            setState(() {
                              d2 = false;
                              availabilityScreenController.deleteDay('Tuesday');
                            });
                          } else {
                            _showDialog(
                              () async {
                                setState(() {
                                  d2 = !d2;
                                  DateTime date =
                                      findFirstDayInMonth('Tuesday');
                                  timeToAdd = DateTime(
                                      date.year,
                                      date.month,
                                      date.day,
                                      time.hour,
                                      time.minute,
                                      time.second);
                                  availabilityScreenController.addDay(
                                      'Tuesday', timeToAdd);
                                });
                                Get.back();
                              },
                            );
                          }
                        },
                      ),
                      CheckboxWidget(
                        text: 'Wednesday',
                        d: d3,
                        onChange: (val) {
                          if (d3) {
                            setState(() {
                              d3 = false;
                              availabilityScreenController
                                  .deleteDay("Wednesday");
                            });
                          } else {
                            _showDialog(
                              () async {
                                setState(() {
                                  d3 = !d3;
                                  DateTime date =
                                      findFirstDayInMonth('Wednesday');
                                  timeToAdd = DateTime(
                                      date.year,
                                      date.month,
                                      date.day,
                                      time.hour,
                                      time.minute,
                                      time.second);
                                  availabilityScreenController.addDay(
                                      "Wednesday", timeToAdd);
                                });
                                Get.back();
                              },
                            );
                          }
                        },
                      ),
                      CheckboxWidget(
                        text: 'Thursday',
                        d: d4,
                        onChange: (val) {
                          if (d4) {
                            setState(() {
                              d4 = false;
                              availabilityScreenController
                                  .deleteDay('Thursday');
                            });
                          } else {
                            _showDialog(
                              () async {
                                setState(() {
                                  d4 = !d4;
                                  DateTime date =
                                      findFirstDayInMonth('Thursday');
                                  timeToAdd = DateTime(
                                      date.year,
                                      date.month,
                                      date.day,
                                      time.hour,
                                      time.minute,
                                      time.second);
                                  availabilityScreenController.addDay(
                                      'Thursday', timeToAdd);
                                });
                                Get.back();
                              },
                            );
                          }
                        },
                      ),
                      CheckboxWidget(
                        text: 'Friday',
                        d: d5,
                        onChange: (val) {
                          if (d5) {
                            setState(() {
                              d5 = false;
                              availabilityScreenController.deleteDay('Friday');
                            });
                          } else {
                            _showDialog(
                              () async {
                                setState(() {
                                  d5 = !d5;
                                  DateTime date = findFirstDayInMonth('Friday');
                                  timeToAdd = DateTime(
                                      date.year,
                                      date.month,
                                      date.day,
                                      time.hour,
                                      time.minute,
                                      time.second);
                                  availabilityScreenController.addDay(
                                      'Friday', timeToAdd);
                                });
                                Get.back();
                              },
                            );
                          }
                        },
                      ),
                      CheckboxWidget(
                        text: 'Saturday',
                        d: d6,
                        onChange: (val) {
                          if (d6) {
                            setState(() {
                              d6 = false;
                              availabilityScreenController
                                  .deleteDay('Saturday');
                            });
                          } else {
                            _showDialog(
                              () async {
                                setState(() {
                                  d6 = !d6;
                                  DateTime date =
                                      findFirstDayInMonth('Saturday');
                                  timeToAdd = DateTime(
                                      date.year,
                                      date.month,
                                      date.day,
                                      time.hour,
                                      time.minute,
                                      time.second);
                                  availabilityScreenController.addDay(
                                      'Saturday', timeToAdd);
                                });
                                Get.back();
                              },
                            );
                          }
                        },
                      ),
                      CheckboxWidget(
                        text: 'Sunday',
                        d: d7,
                        onChange: (val) {
                          if (d7) {
                            setState(() {
                              d7 = false;
                              availabilityScreenController.deleteDay('Sunday');
                            });
                          } else {
                            _showDialog(
                              () async {
                                setState(() {
                                  d7 = !d7;
                                  DateTime date = findFirstDayInMonth('Sunday');
                                  timeToAdd = DateTime(
                                      date.year,
                                      date.month,
                                      date.day,
                                      time.hour,
                                      time.minute,
                                      time.second);
                                  availabilityScreenController.addDay(
                                      'Sunday', timeToAdd);
                                });
                                Get.back();
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Center(
                  child: ButtonNext(
                    SizeScreen.width * 0.8,
                    SizeScreen.height * 0.07,
                    () async {
                      if (availabilityScreenController.myMap.isEmpty) {
                        snackbar(
                            context,
                            1,
                            "You have to select at least a day for the date",
                            Colors.redAccent);
                      } else {
                        snackbar(context, 1, "Your date is programmed",
                            Colors.green);
                      }

                      print(availabilityScreenController.myMap);
                    },
                    AppColor.red,
                    "Submit",
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}

void cancelDayte(context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      // Drawer from the bottom
      return SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          height: SizeScreen.height * 0.7,
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StatefulBuilder(
                  builder: (BuildContext context,
                      void Function(void Function()) setState) {
                    return const SizedBox();
                  },
                ),
                Center(
                  child: ButtonNext(
                    SizeScreen.width * 0.8,
                    SizeScreen.height * 0.07,
                    () async {
                      cancelDayte(context);
                    },
                    AppColor.red,
                    "Save",
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

class CheckboxTime extends StatelessWidget {
  String time;
  bool? t;
  Function(bool?)? onChange;

  CheckboxTime({Key? key, required this.time, this.onChange, this.t = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 15),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    child: TextWidget(
                        time, AppColor.grey, 15.0, FontWeight.w500, 0.0),
                  ),
                ),
              ),
              Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                side: const BorderSide(
                  color: Color(0xffADA9A9),
                  width: 2,
                ),
                splashRadius: 0,
                value: t,
                onChanged: onChange,
                activeColor: const Color(0xffADA9A9),
                checkColor: AppColor.red,
              ),
            ],
          ),
          const Divider(
            height: 0,
            thickness: 2,
            indent: 0,
            endIndent: 0,
            color: Color(0xff7C7C7C),
          ),
        ],
      ),
    );
  }
}

DateTime findFirstDayInMonth(String dayName) {
  // Get the current date
  DateTime now = DateTime.now();

  // Find the first day of the month
  DateTime firstDayOfMonth = DateTime(now.year, now.month, now.day);

  // Map day names to their corresponding integers (e.g., Monday -> 1, Tuesday -> 2, ...)
  Map<String, int> dayMapping = {
    'Monday': DateTime.monday,
    'Tuesday': DateTime.tuesday,
    'Wednesday': DateTime.wednesday,
    'Thursday': DateTime.thursday,
    'Friday': DateTime.friday,
    'Saturday': DateTime.saturday,
    'Sunday': DateTime.sunday,
  };

  // Get the desired day of the week as an integer
  int? desiredDay = dayMapping[dayName];

  // Calculate the date of the first occurrence of the desired day in the current month
  DateTime firstDay = firstDayOfMonth;
  while (firstDay.weekday != desiredDay) {
    firstDay = firstDay.add(const Duration(days: 1));
  }

  return firstDay;
}
