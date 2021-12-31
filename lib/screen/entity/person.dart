import 'package:floor/floor.dart';

@entity
class Person {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String fname;
  final String add;
  final String contact;
  final int age;

  Person(
      {this.id,
      required this.fname,
      required this.add,
      required this.contact,
      required this.age});
}
