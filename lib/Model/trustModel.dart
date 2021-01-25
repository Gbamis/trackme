import 'dart:async';

class TrusteeModel {
  List<TrusteePerson> tPerson = List<TrusteePerson>();

  TrusteePerson a = TrusteePerson("g@email.com");
  TrusteePerson b = TrusteePerson("r@gmail.com");

  StreamController<List<TrusteePerson>> sc = StreamController();

  TrusteeModel() {
    tPerson.add(a);
    tPerson.add(b);
    tPerson.add(b);
    tPerson.add(b);

    sc.sink.add(tPerson);
  }
}

class TrusteePerson {
  final String emailAddress;
  TrusteePerson(this.emailAddress);
}