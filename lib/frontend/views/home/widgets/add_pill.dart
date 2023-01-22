import 'package:flutter/material.dart';
import 'package:medical_app/databases/medication_db.dart';
import 'package:medical_app/providers/refresh.dart';
import 'package:provider/provider.dart';

class AddPill extends StatelessWidget {
  AddPill({
    Key? key,
  }) : super(key: key);

  final drugName = TextEditingController();
  final prescription = TextEditingController();
  final time = TextEditingController();

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
                  TextField(
                    controller: time,
                    decoration: const InputDecoration(
                      labelText: 'Time',
                      hintText: 'Enter time',
                      border: OutlineInputBorder(),
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
                      time: time.text,
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
          color: Colors.black,
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
