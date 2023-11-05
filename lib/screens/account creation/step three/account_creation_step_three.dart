import 'dart:convert';
import 'dart:io';

import 'package:dayte/Widget/add_image.dart';
import 'package:dayte/Widget/snackBar.dart';
import 'package:dayte/Widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../Widget/continueButton.dart';
import '../../../constant.dart';
import '../controller/controller_account_creation.dart';

class FinishingAccountStepThree extends StatelessWidget {
  FinishingAccountStepThree({Key? key}) : super(key: key);
  var accountCreationController = Get.find<AccountCreationController>();

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
          appBar: appBar,
          backgroundColor: Colors.transparent,
          // omk 9a7ba

          body: Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 60, 15, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget("Select your photos", AppColor.red, 21.0,
                          FontWeight.w700, 0.0),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => GestureDetector(
                              onTap:
                                  accountCreationController.imagesList.isEmpty
                                      ? () {
                                          StoragePermission();
                                        }
                                      : null,
                              child: Obx(
                                () => AddImage(
                                    height: SizeScreen.height * 0.138,
                                    width: SizeScreen.width * 0.28,
                                    image: accountCreationController
                                            .imagesList.isNotEmpty
                                        ? accountCreationController
                                            .imagesList[0]
                                        : null,
                                    onPress: () {
                                      accountCreationController.imagesList
                                          .remove(accountCreationController
                                              .imagesList[0]);
                                    }),
                              ),
                            ),
                          ),
                          Obx(
                            () => GestureDetector(
                              onTap:
                                  accountCreationController.imagesList.length <
                                          2
                                      ? () {
                                          StoragePermission();
                                        }
                                      : null,
                              child: Obx(
                                () => AddImage(
                                    height: SizeScreen.height * 0.138,
                                    width: SizeScreen.width * 0.28,
                                    image: accountCreationController
                                                .imagesList.length >
                                            1
                                        ? accountCreationController
                                            .imagesList[1]
                                        : null,
                                    onPress: () {
                                      accountCreationController.imagesList
                                          .remove(accountCreationController
                                              .imagesList[1]);
                                    }),
                              ),
                            ),
                          ),
                          Obx(
                            () => GestureDetector(
                              onTap:
                                  accountCreationController.imagesList.length <
                                          3
                                      ? () {
                                          StoragePermission();
                                        }
                                      : null,
                              child: Obx(
                                () => AddImage(
                                    height: SizeScreen.height * 0.138,
                                    width: SizeScreen.width * 0.28,
                                    image: accountCreationController
                                                .imagesList.length >
                                            2
                                        ? accountCreationController
                                            .imagesList[2]
                                        : null,
                                    onPress: () {
                                      accountCreationController.imagesList
                                          .remove(accountCreationController
                                              .imagesList[2]);
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
                                  accountCreationController.imagesList.length <
                                          4
                                      ? () {
                                          StoragePermission();
                                        }
                                      : null,
                              child: Obx(
                                () => AddImage(
                                    height: SizeScreen.height * 0.138,
                                    width: SizeScreen.width * 0.28,
                                    image: accountCreationController
                                                .imagesList.length >
                                            3
                                        ? accountCreationController
                                            .imagesList[3]
                                        : null,
                                    onPress: () {
                                      accountCreationController.imagesList
                                          .remove(accountCreationController
                                              .imagesList[3]);
                                    }),
                              ),
                            ),
                          ),
                          Obx(
                            () => GestureDetector(
                              onTap:
                                  accountCreationController.imagesList.length <
                                          5
                                      ? () {
                                          StoragePermission();
                                        }
                                      : null,
                              child: Obx(
                                () => AddImage(
                                    height: SizeScreen.height * 0.138,
                                    width: SizeScreen.width * 0.28,
                                    image: accountCreationController
                                                .imagesList.length >
                                            4
                                        ? accountCreationController
                                            .imagesList[4]
                                        : null,
                                    onPress: () {
                                      accountCreationController.imagesList
                                          .remove(accountCreationController
                                              .imagesList[4]);
                                    }),
                              ),
                            ),
                          ),
                          Obx(
                            () => GestureDetector(
                              onTap:
                                  accountCreationController.imagesList.length <
                                          6
                                      ? () {
                                          StoragePermission();
                                        }
                                      : null,
                              child: Obx(
                                () => AddImage(
                                    height: SizeScreen.height * 0.138,
                                    width: SizeScreen.width * 0.28,
                                    image: accountCreationController
                                                .imagesList.length >
                                            5
                                        ? accountCreationController
                                            .imagesList[5]
                                        : null,
                                    onPress: () {
                                      accountCreationController.imagesList
                                          .remove(accountCreationController
                                              .imagesList[5]);
                                    }),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      TextWidget("3 photos required", AppColor.grey, 12.0,
                          FontWeight.w400, 0.0),
                      const SizedBox(height: 80),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: AppColor.grey,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextWidget(
                                "Your profile must contain at least 1 face photo and 2 full body photos",
                                AppColor.grey,
                                12.0,
                                FontWeight.w400,
                                0.0,
                                textalign: TextAlign.center),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Center(
                  child: ContinueButton(
                    onpress: () {
                      if (accountCreationController.imagesList.length < 1) {
                        snackbar(
                            context,
                            1,
                            "Your profile must have at least 3 photos",
                            Colors.redAccent);
                      } else {
                        Get.toNamed("/accountstepfour");
                      }
                    },
                    width: SizeScreen.width * 0.63,
                    height: SizeScreen.height * 0.062,
                    borderColor: AppColor.red,
                    textColor: AppColor.red,
                    textButton: 'Continue',
                    widget: SvgPicture.string(continueArrow),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
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
      imageCache.clear();
      accountCreationController.imagesList.add(File(croppedFile.path));
      String base64Data = await fileToBase64(File(croppedFile.path));

      base64Data = "$base64Data";
      print(base64Data);
      accountCreationController.images.add(base64Data);
    }
  }

  Future<String> fileToBase64(File file) async {
    List<int> fileBytes = await file.readAsBytes();
    String base64Image = base64Encode(file.readAsBytesSync());
    return base64Image;
  }
}
