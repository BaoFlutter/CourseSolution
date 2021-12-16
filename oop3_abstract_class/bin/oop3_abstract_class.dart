

import 'person.dart';

void main(List<String> arguments) {
  Person person = Person(id: "P1", name: "Nguyen");
  person.setBirthYear(birthYear: 2001);
  person.getInfor();
}
