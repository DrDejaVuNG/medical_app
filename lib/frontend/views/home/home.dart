import 'widgets/greeting.dart';
import 'widgets/pill_card.dart';
import 'package:intl/intl.dart';
import 'widgets/health_card.dart';
import 'package:flutter/material.dart';
import 'widgets/appointment_card.dart';
import 'widgets/appointment_count.dart';
import 'package:provider/provider.dart';
import '../../../providers/page_state.dart';
import 'package:medical_app/providers/refresh.dart';
import 'package:medical_app/databases/medication_db.dart';
import 'package:medical_app/databases/appointment_db.dart';
import '../../../backend/appointment/get_appointments.dart';
import 'package:medical_app/frontend/views/home/widgets/add_pill.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<PageState>(context);
    final load = Provider.of<RefreshState>(context);
    // ignore: unused_local_variable
    int id = load.read;
    String date = DateFormat('d MMMM').format(DateTime.now());
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => getAppointments().then((items) {
            appointmentData = items;
            if (appointmentData.isNotEmpty) {
              rewriteAppointment();
              load.refresh();
            }
          }).catchError((error) {}),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Text(
                    'Today, $date',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const Greeting(),
                      const SizedBox(width: 120),
                      GestureDetector(
                        onTap: () {
                          state.profile();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 3,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 2, color: Colors.transparent),
                            ),
                            child: const CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  AssetImage('assets/images/doctor_img.jpg'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const AppointmentCount(),
                const SizedBox(height: 25),
                /*make displayList*/
                AppointmentCard(appointment: appointmentList.last),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          state.schedule();
                        },
                        child: Text(
                          'See all',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
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
                            'Per Day',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      AddPill(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                medication(),
                const HealthCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget medication() {
    if (pillList.isEmpty) {
      return SizedBox(
        height: 150,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Image.asset(
                'assets/images/pills.png',
                scale: 8,
                color: Colors.grey,
              ),
              const Text(
                'Add Medication',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return SizedBox(
        height: 230,
        child: ListView.builder(
          padding: const EdgeInsets.only(left: 20),
          scrollDirection: Axis.horizontal,
          itemCount: pillList.length,
          itemBuilder: (context, index) {
            var item = pillList[index];
            return PillItem(item, index);
          },
        ),
      );
    }
  }
}
