import 'package:category_route_list/music_play.dart';
import 'package:flutter/material.dart';

import 'package:category_route_list/job.dart';

/*class Job {
  final int id;
  final String position;
  final String company;
  final String description;

  Job({required this.id, required this.position, required this.company, required this.description});

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      position: json['position'],
      company: json['company'],
      description: json['description'],
    );
  }
}*/

class DetailScreen extends StatelessWidget {
  // In the constructor, require a Todo.

  const DetailScreen({Key? key, required this.todo}) : super(key: key);

  // Declare a field that holds the Todo.
  final Job todo;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.company),

      ),
    /*  body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),*/

      body: new Container(
        padding: const EdgeInsets.all(16.0),
      height: 400.0,
      alignment: Alignment.center,
      child: new Column(
      children: [
        new Container(
          padding: const EdgeInsets.all(4.0),
          child: Text(todo.position),
        ),
      new Container(
        padding: const EdgeInsets.all(4.0),
        child: Text(todo.description),
    ),

        new Container(
          padding: const EdgeInsets.all(4.0),
          child: Text(todo.location,
       ),

        ),
      ElevatedButton(
        child: Text('Next'),
        onPressed: (){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext ctx) => MusicPlay()));

        },
      ),

    ],
    ),
    ),
    );
    }
}