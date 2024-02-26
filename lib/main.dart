import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CV App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GroupScreen(),
    );
  }
}

class GroupScreen extends StatelessWidget {
  final List<Person> group = [
    Person(name: 'Nelson', age: 30),
    Person(name: 'Benito', age: 25),
    Person(name: 'Baouly', age: 28),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Membres du Groupe'),
      ),
      body: ListView.builder(
        itemCount: group.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(group[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CVScreen(person: group[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CVScreen extends StatelessWidget {
  final Person person;

  CVScreen({required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CV - ${person.name}'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Name: ${person.name}'),
          ),
          ListTile(
            title: Text('Age: ${person.age}'),
          ),
          ListTile(
            title: Text('Education'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EducationScreen(person: person),
                ),
              );
            },
          ),
          // Add more ListTile widgets for other CV details
        ],
      ),
    );
  }
}

class EducationScreen extends StatelessWidget {
  final Person person;

  EducationScreen({required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Education - ${person.name}'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('University: ESIH'),
          ),
          ListTile(
            title: Text('Degree: Science Informatique'),
          ),
          // Add more ListTile widgets for other education details
        ],
      ),
    );
  }
}

class Person {
  final String name;
  final int age;

  Person({required this.name, required this.age});
}
