import 'package:flutter/material.dart';
import 'package:medical_app/databases/medication_db.dart';
import 'package:medical_app/providers/refresh.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddPill extends StatelessWidget {
  AddPill({
    Key? key,
  }) : super(key: key);

  final drugName = TextEditingController();
  final prescription = TextEditingController();
  TimeOfDay time = TimeOfDay.now();
  String? trueTime;

  // change time
  timeSelection(context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != time) {
      time = picked;
      final local = MaterialLocalizations.of(context);
      final timeFormat = local.formatTimeOfDay(time);
      trueTime = timeFormat;
    }
  }

  void addDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final load = Provider.of<RefreshState>(context);
        return Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              title: const Text(
                'Add Medication',
                textAlign: TextAlign.center,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Drug Name
                  TextField(
                    controller: drugName,
                    decoration: const InputDecoration(
                      labelText: 'Drug Name',
                      hintText: 'Enter name of drug',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Prescription
                  TextField(
                    controller: prescription,
                    decoration: const InputDecoration(
                      labelText: 'Prescription',
                      hintText: 'Enter prescription',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Time
                  GestureDetector(
                    onTap: () => timeSelection(context),
                    child: Container(
                      height: 65,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              width: 1.2,
                              color: Theme.of(context).colorScheme.outline,
                            ),
                            left: BorderSide(
                              width: 1.2,
                              color: Theme.of(context).colorScheme.outline,
                            ),
                            right: BorderSide(
                              width: 1.2,
                              color: Theme.of(context).colorScheme.outline,
                            ),
                            bottom: BorderSide(
                              width: 1.2,
                              color: Theme.of(context).colorScheme.outline,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          Icon(
                            Icons.schedule,
                            size: 20,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            trueTime == null
                                ? 'Pick a time'
                                : trueTime.toString(),
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
                TextButton(
                  onPressed: () {
                    pillAdd(
                      drugName: drugName.text,
                      prescription: prescription.text,
                      time: trueTime,
                    );
                    load.refresh();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => addDialog(context),
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ),
    );
  }
}
