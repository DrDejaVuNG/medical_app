import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/providers/refresh.dart';
import 'package:medical_app/databases/medication_db.dart';
import 'package:medical_app/models/medication_model.dart';

class PillCard extends StatefulWidget {
  const PillCard({
    super.key,
    required this.name,
    required this.time,
    required this.prescription,
    required this.index,
  });

  final int index;

  final String name;

  final String time;

  final String prescription;

  @override
  State<PillCard> createState() => _PillCardState();
}

class _PillCardState extends State<PillCard> {
  final load = Get.put(RefreshState());
  bool clicked = false;

  void action() {
    setState(() {
      clicked = !clicked;
      pillList.removeAt(widget.index);
      load.refresh;
      storeMed();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Icon(
                  Icons.medication_outlined,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 17,
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                widget.prescription,
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                widget.time,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    onPressed: action,
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(clicked ? 'Removed' : 'Remove'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PillItem extends PillCard {
  PillItem(MedicationModel item, int index, {super.key})
      : super(
          name: item.name,
          time: item.time,
          prescription: item.prescription,
          index: index,
        );
}
