import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:category_route_list/job.dart';

import 'detail_screen.dart';

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

class JobsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Job>>(
      future: _fetchJobs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Job>? data = snapshot.data;
       //   return _jobsListView(data);
          return Scaffold(
            appBar: AppBar(
              title: Text("Employee Category List"),
            ),
            body: _jobsListView(data),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        List<Widget> children;
        children = <Widget>[
          SizedBox(
            child: CircularProgressIndicator(),
            width: 60,
            height: 60,

          ),

        ];

      return Center(
    child: Column(

    mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    ),
    );
      // return Text("data loading");

      },
    );
  }

  Future<List<Job>> _fetchJobs() async {

    final jobsListAPIUrl = 'https://mock-json-service.glitch.me/';
    final response = await http.get(jobsListAPIUrl);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new Job.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }
  ListView _jobsListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(data[index].position, data[index].company,context,data,index);
        });
  }

  ListTile _tile(String title, String subtitle, BuildContext context, data, int index) => ListTile(
    title: Text(title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),
    subtitle: Text(subtitle),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailScreen(todo: data[index]),
        ),
      );
    },
   /* leading: Icon(
      icon,
      color: Colors.blue[500],
    ),*/
  );
}