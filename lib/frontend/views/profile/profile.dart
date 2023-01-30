import 'update_profile.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/config/constants.dart';
import 'package:medical_app/backend/auth/auth.dart';
import 'package:medical_app/databases/user_db.dart';
import 'package:medical_app/databases/appointment_db.dart';
import 'package:medical_app/frontend/views/profile/profile_schedule.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    PopupMenuButton<ProfileOptions>(
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: ProfileOptions.update,
                          child: Text('Update Profile'),
                        ),
                        const PopupMenuItem(
                          value: ProfileOptions.logout,
                          child: Text('Log Out'),
                        ),
                      ],
                      onSelected: (value) {
                        switch (value) {
                          case ProfileOptions.update:
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const UpdateProfile()));
                            break;
                          case ProfileOptions.logout:
                            Auth().logUserOut;
                            break;
                          default:
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border(
                            top: BorderSide(color: kPrimaryColor, width: 1.5),
                            bottom:
                                BorderSide(color: kPrimaryColor, width: 1.5),
                            left: BorderSide(color: kPrimaryColor, width: 1.5),
                            right: BorderSide(color: kPrimaryColor, width: 1.5),
                          ),
                        ),
                        child: const Icon(Icons.settings_outlined),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 3, color: kPrimaryColor),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.transparent),
                    ),
                    child: const CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          AssetImage('assets/images/doctor_img.jpg'),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  user.name,
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '${user.age} years old',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Stats',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: size.width * 0.416,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Blood group',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            user.bloodType.toString(),
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 25),
                    Container(
                      width: size.width * 0.416,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Weight',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            user.weight.toString(),
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    const Text(
                      'Total Appointments',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: kPrimaryColor,
                            width: 2,
                          ),
                          right: BorderSide(
                            color: kPrimaryColor,
                            width: 2,
                          ),
                          bottom: BorderSide(
                            color: kPrimaryColor,
                            width: 2,
                          ),
                          left: BorderSide(
                            color: kPrimaryColor,
                            width: 2,
                          ),
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        appointmentList.length.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 180,
                  child: PageView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: appointmentList.length,
                    itemBuilder: (context, index) {
                      final item = appointmentList[index];
                      return ProfileSchedule(
                        appointment: item,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum ProfileOptions {
  update,
  logout,
}
