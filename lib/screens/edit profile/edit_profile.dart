import 'dart:convert';
import 'dart:io';

import 'package:dayte/Widget/add_image.dart';
import 'package:dayte/Widget/button_next.dart';
import 'package:dayte/Widget/gender_select.dart';
import 'package:dayte/Widget/text_field.dart';
import 'package:dayte/Widget/text_widget.dart';
import 'package:dayte/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import '../mother screen/controller/controller_mother_screen.dart';
import 'controller/controllerEditScreen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  ControllerEditScreen controllerEditScreen = Get.put(ControllerEditScreen());
  var controllerHome = Get.find<MotherScreenController>();

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerName = TextEditingController();
    TextEditingController controllerBirthday = TextEditingController();
    controllerBirthday.text = controllerHome.myProfile.birthday.toString();
    controllerName.text = controllerHome.myProfile.name.toString();
    //print(controllerHome.myProfile.pictures![4].runtimeType != _File);
    print("the lenght of images ");
    print(controllerHome.myProfile.pictures![0]);
    void _showDatePicker(Widget child) {
      showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
          decoration: BoxDecoration(
              color: CupertinoColors.systemBackground.resolveFrom(context),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              )),
          height: SizeScreen.height * 0.43,
          padding: const EdgeInsets.only(top: 6.0),
          // The Bottom margin is provided to align the popup above the system
          // navigation bar.
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          // Provide a background color for the popup.
          // Use a SafeArea widget to avoid system overlaps.
          child: SafeArea(
            top: false,
            child: Column(
              children: [
                SizedBox(
                  height: SizeScreen.height * 0.3,
                  child: child,
                ),
                SizedBox(height: 20),
                ButtonNext(
                  SizeScreen.width * 0.45,
                  SizeScreen.height * 0.055,
                  () {
                    /// TODO LATER
                    Get.back();
                  },
                  AppColor.red,
                  "Finish",
                ),
              ],
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Stack(
        children: [
          SvgPicture.string(
            backgroundEmpty,
            fit: BoxFit.cover,
          ),
          Scaffold(
            appBar: AppBar(
              title: Transform(
                transform: Matrix4.translationValues(-0.0, 0.0, 0.0),
                child: TextWidget(
                    "Edit profile", AppColor.red, 21.0, FontWeight.w700, 0.0),
              ),
              leading: GestureDetector(
                onTap: () {
                  ///TODO LATER
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: SizedBox(child: SvgPicture.string(arrowBack)),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 25, 15, 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => GestureDetector(
                                onTap:
                                    controllerHome.myProfile.pictures!.isEmpty
                                        ? () {
                                            StoragePermission();
                                          }
                                        : null,
                                child: Obx(
                                  () => AddImage(
                                      height: SizeScreen.height * 0.138,
                                      width: SizeScreen.width * 0.28,
                                      image: controllerHome.myProfile.pictures!
                                                  .isNotEmpty &&
                                              controllerHome
                                                      .myProfile
                                                      .pictures![0]
                                                      .runtimeType !=
                                                  String
                                          ? controllerHome
                                              .myProfile.pictures![0]
                                          : null,
                                      imageString: controllerHome.myProfile
                                                  .pictures!.isNotEmpty &&
                                              controllerHome
                                                      .myProfile
                                                      .pictures![0]
                                                      .runtimeType ==
                                                  String
                                          ? controllerHome
                                              .myProfile.pictures![0]
                                          : null,
                                      onPress: () {
                                        controllerHome.myProfile.pictures!
                                            .remove(controllerHome
                                                .myProfile.pictures?[0]);
                                      }),
                                ),
                              ),
                            ),
                            Obx(
                              () => GestureDetector(
                                onTap:
                                    controllerHome.myProfile.pictures!.length <
                                            2
                                        ? () {
                                            StoragePermission();
                                          }
                                        : null,
                                child: Obx(
                                  () => AddImage(
                                      height: SizeScreen.height * 0.138,
                                      width: SizeScreen.width * 0.28,
                                      image: controllerHome.myProfile.pictures!
                                                      .length >
                                                  1 &&
                                              controllerHome
                                                      .myProfile
                                                      .pictures![1]
                                                      .runtimeType !=
                                                  String
                                          ? controllerHome
                                              .myProfile.pictures![1]
                                          : null,
                                      imageString: controllerHome.myProfile
                                                      .pictures!.length >
                                                  1 &&
                                              controllerHome
                                                      .myProfile
                                                      .pictures![1]
                                                      .runtimeType ==
                                                  String
                                          ? controllerHome
                                              .myProfile.pictures![1]
                                          : null,
                                      onPress: () {
                                        controllerHome.myProfile.pictures!
                                            .remove(controllerHome
                                                .myProfile.pictures?[1]);
                                      }),
                                ),
                              ),
                            ),
                            Obx(
                              () => GestureDetector(
                                onTap:
                                    controllerHome.myProfile.pictures!.length <
                                            3
                                        ? () {
                                            StoragePermission();
                                          }
                                        : null,
                                child: Obx(
                                  () => AddImage(
                                      height: SizeScreen.height * 0.138,
                                      width: SizeScreen.width * 0.28,
                                      image: controllerHome.myProfile.pictures!
                                                      .length >
                                                  2 &&
                                              controllerHome
                                                      .myProfile
                                                      .pictures![2]
                                                      .runtimeType !=
                                                  String
                                          ? controllerHome
                                              .myProfile.pictures![2]
                                          : null,
                                      imageString: controllerHome.myProfile
                                                      .pictures!.length >
                                                  2 &&
                                              controllerHome
                                                      .myProfile
                                                      .pictures![2]
                                                      .runtimeType ==
                                                  String
                                          ? controllerHome
                                              .myProfile.pictures![2]
                                          : null,
                                      onPress: () {
                                        controllerHome.myProfile.pictures!
                                            .remove(controllerHome
                                                .myProfile.pictures?[2]);
                                      }),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => GestureDetector(
                                onTap:
                                    controllerHome.myProfile.pictures!.length <
                                            4
                                        ? () {
                                            StoragePermission();
                                          }
                                        : null,
                                child: Obx(
                                  () => AddImage(
                                      height: SizeScreen.height * 0.138,
                                      width: SizeScreen.width * 0.28,
                                      image: controllerHome.myProfile.pictures!
                                                      .length >
                                                  3 &&
                                              controllerHome
                                                      .myProfile
                                                      .pictures![3]
                                                      .runtimeType !=
                                                  String
                                          ? controllerHome
                                              .myProfile.pictures![3]
                                          : null,
                                      imageString: controllerHome.myProfile
                                                      .pictures!.length >
                                                  3 &&
                                              controllerHome
                                                      .myProfile
                                                      .pictures![3]
                                                      .runtimeType ==
                                                  String
                                          ? controllerHome
                                              .myProfile.pictures![3]
                                          : null,
                                      onPress: () {
                                        controllerHome.myProfile.pictures!
                                            .remove(controllerHome
                                                .myProfile.pictures?[3]);
                                      }),
                                ),
                              ),
                            ),
                            Obx(
                              () => GestureDetector(
                                onTap:
                                    controllerHome.myProfile.pictures!.length <
                                            5
                                        ? () {
                                            StoragePermission();
                                          }
                                        : null,
                                child: Obx(
                                  () => AddImage(
                                      height: SizeScreen.height * 0.138,
                                      width: SizeScreen.width * 0.28,
                                      image: controllerHome.myProfile.pictures!
                                                      .length >
                                                  4 &&
                                              controllerHome
                                                      .myProfile
                                                      .pictures![4]
                                                      .runtimeType !=
                                                  String
                                          ? controllerHome
                                              .myProfile.pictures![4]
                                          : null,
                                      imageString: controllerHome.myProfile
                                                      .pictures!.length >
                                                  4 &&
                                              controllerHome
                                                      .myProfile
                                                      .pictures![4]
                                                      .runtimeType ==
                                                  String
                                          ? controllerHome
                                              .myProfile.pictures![4]
                                          : null,
                                      onPress: () {
                                        controllerHome.myProfile.pictures!
                                            .remove(controllerHome
                                                .myProfile.pictures?[4]);
                                      }),
                                ),
                              ),
                            ),
                            Obx(
                              () => GestureDetector(
                                onTap:
                                    controllerHome.myProfile.pictures!.length <
                                            6
                                        ? () {
                                            StoragePermission();
                                          }
                                        : null,
                                child: Obx(
                                  () => AddImage(
                                      height: SizeScreen.height * 0.138,
                                      width: SizeScreen.width * 0.28,
                                      image: controllerHome.myProfile.pictures!
                                                      .length >
                                                  5 &&
                                              controllerHome
                                                      .myProfile
                                                      .pictures![5]
                                                      .runtimeType !=
                                                  String
                                          ? controllerHome
                                              .myProfile.pictures![5]
                                          : null,
                                      imageString: controllerHome.myProfile
                                                      .pictures!.length >
                                                  5 &&
                                              controllerHome
                                                      .myProfile
                                                      .pictures![5]
                                                      .runtimeType ==
                                                  String
                                          ? controllerHome
                                              .myProfile.pictures![5]
                                          : null,
                                      onPress: () {
                                        controllerHome.myProfile.pictures!
                                            .remove(controllerHome
                                                .myProfile.pictures?[5]);
                                      }),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        TextWidget("3 photos required", AppColor.grey, 12.0,
                            FontWeight.w400, 0.0),
                        const SizedBox(height: 30),
                        TextWidget(
                            "Name", AppColor.grey, 12.0, FontWeight.w700, 0.0),
                        const SizedBox(height: 5),
                        TextFieldWidget(
                          colorText: const Color(0xff7F7D7D),
                          controller: controllerName,
                          function: (String) {
                            controllerName.text = String;
                            controllerHome.myProfile.name?.value = String;
                          },
                          hint: 'Enter your name...',
                          keyboardType: TextInputType.name,
                          inputdecoration: KinputDecoration.copyWith(
                              hintStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 15),
                              hintText: "Enter your name...",
                              prefixIcon: const Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Icon(
                                  FontAwesomeIcons.chevronRight,
                                  size: 17,
                                  color: AppColor.greyTextField,
                                ),
                              )),
                        ),
                        const SizedBox(height: 30),
                        TextWidget("Birthday", AppColor.grey, 13.0,
                            FontWeight.w700, 0.0),
                        const SizedBox(height: 5),
                        GestureDetector(
                          onTap: () {
                            _showDatePicker(
                              CupertinoDatePicker(
                                initialDateTime: DateTime.now(),
                                mode: CupertinoDatePickerMode.date,
                                use24hFormat: true,
                                // This shows day of week alongside day of month
                                showDayOfWeek: true,
                                // This is called when the user changes the date.
                                onDateTimeChanged: (DateTime newDate) {
                                  controllerHome.myProfile.birthday?.value =
                                      DateFormat('yyyy-MM-dd').format(newDate);
                                  controllerBirthday.text =
                                      controllerHome.myProfile.birthday!.value;
                                },
                              ),
                            );
                          },
                          child: TextFieldWidget(
                            controller: controllerBirthday,
                            colorText: const Color(0xff7F7D7D),
                            function: (String) {},
                            enabled: false,
                            hint: 'Select your birthday...',
                            keyboardType: TextInputType.name,
                            inputdecoration: KinputDecoration.copyWith(
                                hintStyle: const TextStyle(
                                    color: Colors.grey, fontSize: 15),
                                hintText: "Select your birthday...",
                                suffixIcon: const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Icon(
                                    FontAwesomeIcons.chevronDown,
                                    size: 17,
                                    color: AppColor.greyTextField,
                                  ),
                                ),
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Icon(
                                    FontAwesomeIcons.cakeCandles,
                                    size: 17,
                                    color: AppColor.greyTextField,
                                  ),
                                )),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => GestureDetector(
                                onTap: () {
                                  controllerHome.editGender('man');
                                },
                                child: GenderSelect(
                                  containerColor:
                                      controllerHome.myProfile.gender?.value ==
                                              'man'
                                          ? AppColor.red
                                          : const Color(0xffe9e7e7),
                                  horizontalPadding: 20,
                                  function: () {},
                                  borderColor:
                                      controllerHome.myProfile.gender?.value ==
                                              'man'
                                          ? AppColor.red
                                          : const Color(0xffe9e7e7),
                                  // AppColor.red,
                                  checked: const SizedBox(),
                                  // SvgPicture.string(doubleCheck)
                                  textGender: 'Man',
                                  textColor:
                                      controllerHome.myProfile.gender?.value ==
                                              'man'
                                          ? Colors.white
                                          : const Color(0xff717171),
                                ),
                              ),
                            ),
                            Obx(
                              () => GestureDetector(
                                onTap: () {
                                  controllerHome.editGender('woman');
                                },
                                child: GenderSelect(
                                  containerColor:
                                      controllerHome.myProfile.gender?.value ==
                                              'woman'
                                          ? AppColor.red
                                          : const Color(0xffe9e7e7),
                                  horizontalPadding: 20,
                                  function: () {},
                                  borderColor:
                                      controllerHome.myProfile.gender?.value ==
                                              'woman'
                                          ? AppColor.red
                                          : const Color(0xffe9e7e7),
                                  // AppColor.red,
                                  checked: const SizedBox(),
                                  // SvgPicture.string(doubleCheck)
                                  textGender: 'Woman',
                                  textColor:
                                      controllerHome.myProfile.gender?.value ==
                                              'woman'
                                          ? Colors.white
                                          : const Color(0xff717171),
                                ),
                              ),
                            ),
                            Obx(
                              () => GestureDetector(
                                onTap: () {
                                  controllerHome.editGender('other');
                                },
                                child: GenderSelect(
                                  containerColor:
                                      controllerHome.myProfile.gender?.value ==
                                              'other'
                                          ? AppColor.red
                                          : const Color(0xffe9e7e7),
                                  horizontalPadding: 20,
                                  function: () {},
                                  borderColor:
                                      controllerHome.myProfile.gender?.value ==
                                              'other'
                                          ? AppColor.red
                                          : const Color(0xffe9e7e7),
                                  // AppColor.red,
                                  checked: const SizedBox(),
                                  // SvgPicture.string(doubleCheck)
                                  textGender: 'Other',
                                  textColor:
                                      controllerHome.myProfile.gender?.value ==
                                              'other'
                                          ? Colors.white
                                          : const Color(0xff717171),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: SizeScreen.height * 0.04),
                    Center(
                      child: ButtonNext(
                        SizeScreen.width * 0.8,
                        SizeScreen.height * 0.07,
                        () async {
                          print(controllerName.text);
                        },
                        AppColor.red,
                        "Edit",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

void StoragePermission() async {
  var status = await Permission.storage.status;
  if (status.isGranted) {
    _imgFromGallery();
  } else if (status.isDenied) {
    // You haven't requested permission yet; request it now.
    var result = await Permission.storage.request();
    if (result.isGranted) {
      _imgFromGallery();
    } else {
      var result = await Permission.storage.request();
    }
  } else if (status.isDenied || status.isPermanentlyDenied) {
    openAppSettings(); // Open device settings for the user to enable permissions.
  }
}

File? imageFile;
var bytesss;

_imgFromGallery() async {
  await picker
      .pickImage(source: ImageSource.gallery, imageQuality: 50)
      .then((value) {
    if (value != null) {
      _cropImage(File(value.path));
    }
  });
}

final picker = ImagePicker();

_cropImage(File imgFile) async {
  final croppedFile = await ImageCropper().cropImage(
      sourcePath: imgFile.path,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9
            ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: "Sélectionnez l'image",
            toolbarColor: const Color(0xff284F7B),
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: "Sélectionnez l'image",
        )
      ]);
  if (croppedFile != null) {
    var controllerHome = Get.find<MotherScreenController>();
    imageCache.clear();
    String base64Data = await fileToBase64(File(croppedFile.path));
    print(File(croppedFile.path).runtimeType);
    base64Data = "$base64Data";
    print(base64Data);
    controllerHome.myProfile.pictures!.add(File(croppedFile.path));
  }
}

Future<String> fileToBase64(File file) async {
  List<int> fileBytes = await file.readAsBytes();
  String base64Image = base64Encode(file.readAsBytesSync());

  return base64Image;
}
