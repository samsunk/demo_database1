import 'package:flutter/material.dart';

import 'database/database_instance.dart';
import 'entity/person.dart';

class ViewData extends StatefulWidget {
  const ViewData({Key? key}) : super(key: key);

  @override
  State<ViewData> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  @override
  void initState() {
    super.initState();
    // databaseConnection();
  }

  // Future<void> databaseConnection() async {
  //   final database =
  //       await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  //   personDao = database.personDao;
  // }

  Future<List<Person>> displayData() async {
    // final result = await widget.personDao.findAllPerson();
    var database = await DatabaseInstance.instance.getDatabaseInstance();
    var result = database.personDao.findAllPersons();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Data of person'),
      ),
      body: FutureBuilder<List<Person>>(
        future: displayData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text('ID:${snapshot.data![index].id}'),
                  subtitle: Text(
                      'Name:${snapshot.data![index].fname} ${snapshot.data![index].add}'),
                );
              },
              itemCount: snapshot.data!.length,
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
