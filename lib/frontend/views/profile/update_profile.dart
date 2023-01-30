import 'package:flutter/material.dart';
import 'package:medical_app/databases/user_db.dart';
import 'package:medical_app/models/user_model.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    String name = '';
    String age = '';
    String weight = '';
    String bloodType = '';
    String mobile = '';
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_rounded),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      if (name != '' && mobile != '') {
                        UserModel user = UserModel(
                          name: name,
                          age: age,
                          weight: weight,
                          bloodType: bloodType,
                          mobile: mobile,
                          userId: userId,
                        );
                        saveUser(user);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        'Update',
                        style: TextStyle(
                          fontSize: 15,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Update Profile',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                child: TextFormField(
                  initialValue: user.name,
                  style: const TextStyle(fontSize: 18),
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value != null) {
                      name = value;
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                child: TextFormField(
                  initialValue: user.age,
                  style: const TextStyle(fontSize: 18),
                  decoration: const InputDecoration(
                    labelText: 'Age',
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value != null) {
                      age = value;
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                child: TextFormField(
                  initialValue: user.weight,
                  style: const TextStyle(fontSize: 18),
                  decoration: const InputDecoration(
                    labelText: 'Weight',
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value != null) {
                      weight = value;
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                child: TextFormField(
                  initialValue: user.bloodType,
                  style: const TextStyle(fontSize: 18),
                  decoration: const InputDecoration(
                    labelText: 'Blood Type',
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value != null) {
                      bloodType = value;
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                child: TextFormField(
                  initialValue: user.mobile,
                  style: const TextStyle(fontSize: 18),
                  decoration: const InputDecoration(
                    labelText: 'Mobile',
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value != null) {
                      mobile = value;
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
