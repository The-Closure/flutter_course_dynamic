


import 'dart:ffi';

void main() {

Human person = Human.Dotor(jop: 'Engineer', name: 'Ahmad');

print(person.name);

Human person2 =Human.Dotor(name: 'Yaser', jop: 'Doctor');

print(person2.name);

}


class Human {
  String name;
  String jop;

  Human({required this.jop,required this.name});
 // ? named constructer
factory Human.Dotor({required name,required jop}){
  if(jop == 'Doctor'){

  return Human(jop: jop, name: "Dr."+name);
  }else {
    return Human(jop: jop, name: name);
  }
}
}

enum jops{
  DOCTOR,ENGINEER,TEACHER
}