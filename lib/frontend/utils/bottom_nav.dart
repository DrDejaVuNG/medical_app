import '../views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/config/constants.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/frontend/views/profile/profile.dart';
import 'package:medical_app/frontend/views/schedule/schedule.dart';
import 'package:medical_app/frontend/views/notififications/notifications.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int index = 0;
  final views = [
    const HomeView(),
    const ScheduleView(),
    const NotifyView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[index],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          border: Border(
            top: BorderSide(
              width: 2,
              color: kPrimaryColor,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: GNav(
            gap: 8,
            color: Colors.white,
            activeColor: Colors.white,
            selectedIndex: index,
            onTabChange: (value) {
              setState(() {
                index = value;
              });
            },
            backgroundColor: Colors.black,
            padding: const EdgeInsets.all(6),
            tabBackgroundColor: Colors.grey.shade800,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            tabs: const [
              GButton(
                icon: Icons.home_outlined,
                text: 'Home',
              ),
              GButton(
                icon: Icons.calendar_month_outlined,
                text: 'Schedule',
              ),
              GButton(
                icon: FontAwesomeIcons.bell,
                text: 'Notifications',
              ),
              GButton(
                icon: Icons.person_outline_rounded,
                iconSize: 26,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
