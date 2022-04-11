class Job {
  final int id;
  final String position;
  final String company;
  final String description;
  final String location;

  Job({required this.id, required this.position, required this.company, required this.description,required this.location});

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      position: json['position'],
      company: json['company'],
      description: json['description'],
      location: json['location'],
    );
  }
}