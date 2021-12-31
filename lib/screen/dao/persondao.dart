import 'package:demo_database1/screen/entity/person.dart';
import 'package:floor/floor.dart';

@dao
abstract class PersonDao {
  @Query('Select * from Person')
  Future<List<Person>> findAllPersons();

  @Query('Select * from Person Where id= :id')
  Future<Person?> findPersonById(int id);

  @insert
  Future<int> insertPerson(Person person);
}
