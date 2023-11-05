import 'package:dayte/constant.dart';
import 'package:dayte/screens/mother%20screen/Dayte%20screen/dayte_screen.dart';
import 'package:dayte/screens/mother%20screen/home%20screen/petals_screen.dart';
import 'package:dayte/screens/mother%20screen/profile%20screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MotherScreen extends StatefulWidget {
  const MotherScreen({Key? key}) : super(key: key);

  @override
  State<MotherScreen> createState() => _MotherScreenState();
}

class _MotherScreenState extends State<MotherScreen> {
  int indexScreen = 1;

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
            extendBody: true, // very important as noted
            backgroundColor: Color(0x00ffffff),

            bottomNavigationBar: BottomNavigationBar(
                elevation: 0,
                // to get rid of the shadow
                backgroundColor: Colors.transparent,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.user),
                    label: 'Profile',
                    backgroundColor: Colors.transparent,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.leaf), //fileCirclePlus
                    label: 'Petals',
                    backgroundColor: Colors.transparent,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_month_rounded),
                    label: 'Dayte',
                    backgroundColor: Colors.transparent,
                  ),
                ],
                selectedIconTheme: const IconThemeData(size: 24.0),
                unselectedIconTheme: const IconThemeData(size: 24.0),
                selectedFontSize: 14,

                unselectedFontSize: 14,
                //showUnselectedLabels: true,
                currentIndex: indexScreen,
                selectedItemColor: AppColor.red,
                onTap: (index) {
                  setState(() {
                    indexScreen = index;
                  });
                }),
            body: SafeArea(
              child: _screenOption.elementAt(indexScreen),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> _screenOption = [
  const ProfileScreen(),
  const PetalsScreen(),
  const DayteScreen(),
];
