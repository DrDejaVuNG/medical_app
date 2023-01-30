import 'package:provider/provider.dart';
import '../../providers/page_state.dart';
import '../views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/frontend/views/profile/profile.dart';
import 'package:medical_app/frontend/views/schedule/schedule_view.dart';
import 'package:medical_app/frontend/views/notififications/notifications_view.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<PageState>(context);
    int index = state.index;
    return Scaffold(
      body: [
        const HomeView(),
        const ScheduleView(),
        const NotifyView(),
        const ProfileView(),
      ].elementAt(index),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 2,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: GNav(
            haptic: false,
            duration: const Duration(milliseconds: 400),
            onTabChange: (value) {
              state.setCurrentIndex(value);
            },
            gap: 8,
            selectedIndex: index,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            activeColor: Theme.of(context).colorScheme.onPrimaryContainer,
            padding: const EdgeInsets.all(6),
            tabBackgroundColor: Theme.of(context).colorScheme.primaryContainer,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            tabs: [
              GButton(
                icon: index == 0 ? Icons.home : Icons.home_outlined,
                text: 'Home',
              ),
              GButton(
                icon: index == 1
                    ? Icons.calendar_month
                    : Icons.calendar_month_outlined,
                text: 'Schedule',
              ),
              GButton(
                icon: index == 2
                    ? FontAwesomeIcons.solidBell
                    : FontAwesomeIcons.bell,
                text: 'Notifications',
              ),
              GButton(
                icon: index == 3 ? Icons.person : Icons.person_outline_rounded,
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
