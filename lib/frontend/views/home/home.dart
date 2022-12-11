import 'package:flutter/material.dart';

import 'package:medical_app/config/constants.dart';
import 'package:medical_app/frontend/views/appointment/appointment.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Today, 6 December',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Text(
                      'Good Morning, Paul',
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 0.5, color: Colors.grey),
                      ),
                      child: IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.calendar_month_outlined,
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'You have 3 appointments today',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 30),

                // card
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AppointView()),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 3, color: Colors.white54),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2, color: Colors.transparent),
                                  ),
                                  child: const CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(
                                        'assets/images/doctor_img.jpg'),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Dr. Dylan Cooper',
                                    style: TextStyle(
                                      letterSpacing: 1,
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Today, 09:00 AM',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: const [
                          Spacer(),
                          Text(
                            'See all',
                            style: TextStyle(color: kPrimaryColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Medication',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Before lunch',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // carousel slider
                // ListView.builder(itemBuilder: ((context, index) {
                //   return Column(
                //     children: [
                //       Container(
                //         height: 200,
                //         width: 100,
                //         margin: const EdgeInsets.symmetric(
                //           horizontal: 15,
                //           vertical: 20,
                //         ),
                //         decoration: BoxDecoration(
                //           color: Colors.white,
                //           borderRadius: BorderRadius.circular(15),
                //           boxShadow: const [
                //             BoxShadow(
                //               color: Colors.grey,
                //               blurRadius: 4,
                //               spreadRadius: 3,
                //             ),
                //           ],
                //         ),
                //         child: Stack(
                //           children: [
                //             InkWell(
                //               onTap: () {},
                //               child: Container(
                //                 decoration: const BoxDecoration(
                //                     borderRadius: BorderRadius.only(
                //                   topLeft: Radius.circular(15),
                //                   topRight: Radius.circular(15),
                //                 )),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   );
                // })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/* 
                Swiper(
                  itemBuilder: (context, index) {
                    return Container(
                      width: 30,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        children: const [
                          CircleAvatar(child: Text('P')),
                          Text('Aspirin'),
                          Text('1 pill, 25 mg.'),
                        ],
                      ),
                    );
                  },
                  itemCount: 1,
                ), */