import 'package:dayte/screens/Location/Location.dart';
import 'package:dayte/screens/account%20creation/step%20five/account_creation_step_five.dart';
import 'package:dayte/screens/account%20creation/step%20four/account_creation_step_four.dart';
import 'package:dayte/screens/account%20creation/step%20one/account_creation_step_one.dart';
import 'package:dayte/screens/account%20creation/step%20three/account_creation_step_three.dart';
import 'package:dayte/screens/account%20creation/step%20two/account_creation_step_two.dart';
import 'package:dayte/screens/availability%20screen/availability_screen.dart';
import 'package:dayte/screens/change%20password/change_password.dart';
import 'package:dayte/screens/edit%20profile/edit_profile.dart';
import 'package:dayte/screens/forget%20password%20steps/forget_password_step_one.dart';
import 'package:dayte/screens/forget%20password%20steps/forget_password_step_three.dart';
import 'package:dayte/screens/forget%20password%20steps/forget_password_step_two.dart';
import 'package:dayte/screens/its%20a%20date%20!!!!/its_a_date_screen.dart';
import 'package:dayte/screens/login%20with%20phone%20number/login_with_phone%20_number.dart';
import 'package:dayte/screens/mother%20screen/mother_screen.dart';
import 'package:dayte/screens/password/password_screen.dart';
import 'package:dayte/screens/profile%20detail%20screen/profile_detail_screen.dart';
import 'package:dayte/screens/signin_screen/signin_screen.dart';
import 'package:dayte/screens/signup%20step%20four/signup_step_four.dart';
import 'package:dayte/screens/signup%20step%20one/controller/controller_signup.dart';
import 'package:dayte/screens/signup%20step%20one/signup_step_one.dart';
import 'package:dayte/screens/signup%20step%20password/signup_step_password.dart';
import 'package:dayte/screens/signup%20step%20two/signup_step_two.dart';
import 'package:dayte/screens/splash%20screen/splash_screen.dart';
import 'package:dayte/screens/stripe/stripe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? token;

var prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize GetX bindings
  //  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  // Stripe.publishableKey = dotenv.env['STRIPE_PUBLIC_KEY']!;
  // await Stripe.instance.applySettings();
  // Register your controller
  prefs = await SharedPreferences.getInstance();
  token = prefs.getString('access_token');
  //Get.put(ControllerCreateScreen());
  Get.put(SignUpController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      //token == '' || token == null ? '/' : '/motherscreen',
      //token == null ? '/' : '/signinstepthree',
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(
          name: '/signinsignup',
          page: () => const SignInScreen(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: '/signinstepone',
          page: () => const SignupStepOne(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: '/signinsteptwo',
          page: () => const SignupStepTwo(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: '/location',
          page: () => const SignupStepThree(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: '/signinstepfour',
          page: () => const SignupStepFour(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(name: '/accountstepone', page: () => FinishingAccountStepOne()),
        GetPage(
            name: '/accountsteptwo',
            page: () => const FinishingAccountStepTwo()),
        GetPage(
            name: '/accountstepthree', page: () => FinishingAccountStepThree()),
        GetPage(
            name: '/accountstepfour',
            page: () => const FinishingAccountStepFour()),
        GetPage(
            name: '/accountstepfive',
            page: () => const FinishingAccountStepFive()),
        GetPage(name: '/motherscreen', page: () => const MotherScreen()),
        GetPage(name: '/itsadate', page: () => const ItsADateScreen()),
        GetPage(name: '/availability', page: () => const AvailabilityScreen()),
        GetPage(name: '/password', page: () => const PasswordScreen()),
        GetPage(name: '/changepassword', page: () => const ChangePassword()),
        GetPage(
            name: '/forgetpasswordstepone',
            page: () => const ForgetPasswordStepOne()),
        GetPage(
            name: '/forgetpasswordsteptwo',
            page: () => const ForgetPasswordStepTwo()),
        GetPage(
            name: '/forgetpasswordstepthree',
            page: () => const ForgetPasswordStepThree()),
        GetPage(name: '/editprofile', page: () => const EditProfileScreen()),
        GetPage(
            name: '/profiledetail', page: () => const ProfileDetailScreen()),
        GetPage(
          name: '/createpassword',
          page: () => const SignupStepPassword(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: '/loginwithphonenumber',
          page: () => const LoginWithPhoneNumber(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: '/stripe',
          page: () => const CardFormScreen(),
          transition: Transition.rightToLeftWithFade,
        ),
      ],
    );
  }
}
