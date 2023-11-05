import 'package:dayte/Widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Widget/continueButton.dart';
import '../../../Widget/text_field.dart';
import '../../../constant.dart';
import '../controller/controller_account_creation.dart';

class FinishingAccountStepFive extends StatefulWidget {
  const FinishingAccountStepFive({Key? key}) : super(key: key);

  @override
  State<FinishingAccountStepFive> createState() =>
      _FinishingAccountStepFiveState();
}

class _FinishingAccountStepFiveState extends State<FinishingAccountStepFive> {
  var accountCreationController = Get.find<AccountCreationController>();
  TextEditingController controllerPrompt = TextEditingController();

  TextEditingController controllerDescription = TextEditingController();

  int promptNumber = 1;

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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 40, 15, 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget("What would you like Daytors to know?",
                          AppColor.red, 21.0, FontWeight.w700, 0.0),
                      const SizedBox(height: 50),
                      TextFieldWidget(
                        controller: controllerPrompt,
                        function: (String) {},
                        minLines: 1,
                        maxLines: 3,
                        hint: 'Enter your name...',
                        keyboardType: TextInputType.name,
                        inputdecoration: KinputDecoration.copyWith(
                          hintStyle:
                              const TextStyle(color: Colors.grey, fontSize: 15),
                          hintText: "Prompt 1",
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextFieldWidget(
                        controller: controllerDescription,
                        function: (String) {},
                        hint: 'Brief description...',
                        minLines: 8,
                        maxLines: 8,
                        keyboardType: TextInputType.name,
                        inputdecoration: KinputDecoration.copyWith(
                          hintStyle:
                              const TextStyle(color: Colors.grey, fontSize: 15),
                          hintText: "Brief description...",
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextWidget(promptNumber.toString(), AppColor.red,
                              16.0, FontWeight.w800, 0.0),
                          TextWidget(
                              "/", AppColor.red, 16.0, FontWeight.w800, 0.0),
                          TextWidget(
                              "3", AppColor.red, 16.0, FontWeight.w800, 0.0),
                        ],
                      ),
                      SizedBox(height: 20),
                      TextWidget("•  2 prompts are required to proceed",
                          AppColor.grey, 12.0, FontWeight.w400, 0.0),
                    ],
                  ),
                  SizedBox(height: SizeScreen.height * 0.12),
                  Center(
                    child: ContinueButton(
                      onpress: () {
                        accountCreationController.finishAccount(context);
                        // if (promptNumber >=3){
                        //    Get.toNamed("motherscreen");
                        // }else {
                        //   setState(() {
                        //     controllerDescription.text = '';
                        //     controllerPrompt.text = '' ;
                        //     promptNumber++ ;
                        //   });
                        // }
                      },
                      width: SizeScreen.width * 0.63,
                      height: SizeScreen.height * 0.062,
                      borderColor: AppColor.red,
                      textColor: AppColor.red,
                      textButton: 'Add',
                      widget: const SizedBox(),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
