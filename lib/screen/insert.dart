import 'package:demo_database1/screen/database/database_instance.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

import 'entity/person.dart';

class InsertScreen extends StatefulWidget {
  const InsertScreen({Key? key}) : super(key: key);

  @override
  _InsertScreenState createState() => _InsertScreenState();
}

class _InsertScreenState extends State<InsertScreen> {
  final _formkey = GlobalKey<FormState>();
  String fname = '';
  String add = '';
  String contact = '';
  String age = '';

  Future<void> insertData(
      String fname, String add, String contact, int age) async {
    var person = Person(fname: fname, add: add, contact: contact, age: age);
    final database = await DatabaseInstance.instance.getDatabaseInstance();
    await database.personDao.insertPerson(person);
  }

  String? checkEmpty(value) {
    if (value == null || value.isEmpty) {
  
      return "* Required";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const Text('Personal Info'),
                const SizedBox(height: 30),
                TextFormField(
                  onSaved: (value) {
                    fname = value!;
                  },
                  validator: checkEmpty,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    hintText: 'Enter your full name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onSaved: (value) {
                    add = value!;
                  },
                  validator: checkEmpty,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    hintText: 'Enter your address',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onSaved: (value) {
                    contact = value!;
                  },
                  validator: checkEmpty,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Contact',
                    hintText: 'Enter your mobile no.',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onSaved: (value) {
                    age = value!;
                  },
                  validator: checkEmpty,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'age',
                    hintText: 'Enter your age',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      
                      _formkey.currentState!.save();
                      try {
                        insertData(fname, add, contact, int.parse(age));
                        MotionToast.success(
                          description: 'Data inserted Successfully',
                          title: 'Sucesss',
                        );
                      } catch (err) {
                        MotionToast.error(
                          description: 'Error occured !!!',
                          title: 'Unsucesss',
                        ).show(context);
                        print('Error occured');
                      }
                    }
                    else{
                       MotionToast.error(
                          description: 'Error occured !!!',
                          title: 'Unsucesss',
                        ).show(context);
                    }
                  },
                  child: const Text('Submit'),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {},
                  child: const Text('Clear'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
