import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widget/button_signin.dart';
import '../../Widget/snackBar.dart';
import '../../constant.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}


class _SignInScreenState extends State<SignInScreen> {

  facebookLogin() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login(); // by default we request the email and the public profile

      if (result.status == LoginStatus.success) {
        final userData = await FacebookAuth.i.getUserData();
        print(userData);
        print('1111111111111111111111111111');
        var t = await FacebookAuth.instance.accessToken;
        print(t?.token);
        var body = jsonEncode({
          "token": t?.token,
          "backend": "facebook",
          "grant_type": "convert_token",
          "client_id": clientId,
          "client_secret": clientSecret
        });
        var res = await http.post(
          Uri.parse("$URL/authentication/convert-token/"),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body,
        );
        var decodedBody = jsonDecode(res.body);
        if (res.statusCode == 200) {
          //token = decodedBody["access_token"];
          print(decodedBody);
          var response = await http.post(
            Uri.parse("$URL/auth/profile_exist/"),
            headers: {
              'Authorization': 'Bearer ${decodedBody["access_token"]}',
            },
          );
          print(response.body);
          print(response.statusCode);

          if (response.statusCode == 200) {
            saveData("AccessToken", decodedBody["access_token"]);
            saveData("RefreshToken", decodedBody["refresh_token"]);
            Get.offAllNamed('/signinstepthree');
          } else {
            Get.offAllNamed(
              '/SignUpStepOneGoogle',
              arguments: {
                "access_token": decodedBody["access_token"],
                "refresh_token": decodedBody["refresh_token"],
              },
            );
          }
        } else {
          setState(() {
            isLoading = false;
          });
          snackbar(
              context, 1, "Something reallt wrong happened", Colors.redAccent);
        }
      }
    } catch (error) {
      print(error);
    }
  }

  Map<String, dynamic>? _userData;
  AccessToken? _accessToken;
  bool _checking = true;
  String? accessTokenGoogle;

final GoogleSignIn _googleSignIn = GoogleSignIn(
  clientId: "186651681146-jt0f27mjspuurmrpm2mdc2ipimsfoq2f.apps.googleusercontent.com",
);
  bool isLoading = false;


  _handleSignIn() async {
    try {
      print("111111111111111111111111111111111111111111111111111111111");
      GoogleSignInAccount? account = await _googleSignIn.signOut();
      print("22222222222222222222222222222222222222222222222222222");

      account = await _googleSignIn.signIn();
      print("33333333333333333333333333333333333333333333333");
      GoogleSignInAuthentication authentication = await account!.authentication;
      print("44444444444444444444444444444444444444444444444");

      if (account != null) {

        accessTokenGoogle = authentication.accessToken;
        var body = jsonEncode({
          "token": accessTokenGoogle,
          "backend": "google-oauth2",
          "grant_type": "convert_token",
          //change the client_id / client_secret !!!!!!!! 🍑🍑🍑🍑🍑🍑
          "client_id": 'qMer5V9S5EpJSHM9vPRzNOuuIE3o6dgeS4zrfHun',
          "client_secret": 'hpvsXP5nIvcOLni0Q6htIBPU1u393uQ9hXyTv9Z0TBcwaZUapG317B9OZslwepFaAF9ro5ys73cmhzQkgBvpd19C8LU48L95nbmLFWXnzgh1asP7hSltqLDyzC4SC0EH'
        });
        print(accessTokenGoogle);
        setState(() {
          isLoading = true;
        });
        print(URL);
        //change the url nidhal !!!! 💀💀💀💀💀💀💀💀💀💀
        var res = await http.post(
          Uri.parse("http://192.168.1.16:8000/auth/convert-token/"),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body,
        );
        print(res.body);
        var decodedBody = jsonDecode(res.body);
        if (res.statusCode == 200) {
          //token = decodedBody["access_token"];
          print(decodedBody);

          var response = await http.post(
            Uri.parse("$URL/auth/profile_exist/"),
            headers: {
              'Authorization': 'Bearer ${decodedBody["access_token"]}',
            },
          );
          print(response.body);
          print(response.statusCode);

          if (response.statusCode == 200) {
            saveData("AccessToken", decodedBody["access_token"]);
            saveData("RefreshToken", decodedBody["refresh_token"]);
            Get.offAllNamed('/signinstepthree');
          } else {
            Get.offAllNamed(
              '/SignUpStepOneGoogle',
              arguments: {
                "access_token": decodedBody["access_token"],
                "refresh_token": decodedBody["refresh_token"],
              },
            );
          }
        } else {
          setState(() {
            isLoading = false;
          });
          snackbar(
              context, 1, "Something reallt wrong happened", Colors.redAccent);
        }
      }
    } catch (error) {
      print("tnakettttttttttttttttttttttttttttttttttt");
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return true;
        },
        child: Stack(
          children: [
            SvgPicture.string(
              backgroundsSignIn,
              fit: BoxFit.cover,
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Let's sign you in",
                      style: TextStyle(
                        color: AppColor.red,
                        fontSize: 27,
                        letterSpacing: 0.7,
                        fontFamily: 'Times',
                        fontWeight: FontWeight.w800,
                        wordSpacing: 0.7,
                      ),
                    ),
                    // Center(
                    //   child: AnimatedTextKit(
                    //     animatedTexts: [
                    //       TypewriterAnimatedText(
                    //         "Let's sign you in",
                    //         textStyle: GoogleFonts.montserratAlternates(
                    //           color: AppColor.red,
                    //           fontSize: 23,
                    //           letterSpacing: 0.7,
                    //           fontWeight: FontWeight.bold,
                    //           wordSpacing: 0.7,
                    //         ),
                    //         speed: const Duration(milliseconds: 100),
                    //       ),
                    //     ],
                    //     totalRepeatCount: 1,
                    //     displayFullTextOnTap: true,
                    //   ),
                    // ),
                    const SizedBox(height: 70),
                    ButtonSingnin(
                        SizeScreen.width * 0.85, SizeScreen.height * 0.065,

                        /// TODO GOOGLE SIGNIN FUNCTION
                        () {
//                       print("11111111111111111111111111111111");
//                       //_handleSignIn();
//                       Get.toNamed("/stripe");
_handleSignIn();
                    }, AppColor.red, FontAwesomeIcons.google,
                        "Continue with Google"),
                    const SizedBox(height: 35),
                    ButtonSingnin(
                        SizeScreen.width * 0.85, SizeScreen.height * 0.065,
                        () async {
                      facebookLogin();
                    }, AppColor.red, FontAwesomeIcons.facebook,
                        "Continue with Facebook"),
                    const SizedBox(height: 42),

                    /// USE PHONE NUMBER
                    GestureDetector(
                      onTap: () async {
                        ///TODO LATER
                        Get.toNamed("/loginwithphonenumber");
                        print(dotenv.env['URL']);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Use phone number',
                            style: GoogleFonts.roboto(
                                fontSize: 13,
                                color: AppColor.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 5),
                          const Icon(FontAwesomeIcons.angleRight,
                              color: AppColor.black, size: 15),
                        ],
                      ),
                    ),
                    SizedBox(height: SizeScreen.height * 0.3),
                    GestureDetector(
                      onTap: () {
                        ///TODO LATER
                        Get.toNamed("/signinstepone");
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "You don't have an account? ",
                              style: GoogleFonts.roboto(
                                color: AppColor.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: " Sign up",
                              style: GoogleFonts.roboto(
                                color: AppColor.red,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void saveData(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}
