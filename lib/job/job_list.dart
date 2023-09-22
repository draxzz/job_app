import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:job/main.dart';
import 'package:job/profile/profile_list.dart';

class JobList {
  int id;
  String title;
  String description;
  bool active;
  dynamic postedAt;
  String company;
  String location;
  int minSalary;
  int maxSalary;
  List<String> requirements;
  dynamic image;

  JobList({
    required this.id,
    required this.title,
    required this.description,
    required this.active,
    required this.postedAt,
    required this.company,
    required this.location,
    required this.minSalary,
    required this.maxSalary,
    required this.requirements,
    required this.image,
  });

  // when getting values from db
  factory JobList.fromJson(Map<String, dynamic> json) {
    return JobList(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      active: json["active"],
      postedAt: json["postedAt"],
      company: json["company"],
      location: json["location"],
      minSalary: json["minSalary"],
      maxSalary: json["maxSalary"],
      requirements: json["requirements"],
      image: json["image"],
    );
  }

  // when passing in values to backend
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "active": active,
        "postedAt": postedAt,
        "location": location,
        "company": company,
        "minSalary": minSalary,
        "maxSalary": maxSalary,
        "requirements": requirements,
        "image": image,
      };
}

List<JobList> parseJob(String responseBody) {
  Map<dynamic, dynamic> jobMap = jsonDecode(responseBody);

  List<JobList> jobList = (jobMap['result']! as List)
      .map((item) => JobList.fromJson(item))
      .toList();

  return jobList;
}

Future<List<JobList>> fetchJobList(http.Client client) async {
  var url = "$SERVER_IP/api/job/view-all-job";
  String? token;

  final response = await client.get(Uri.parse(url), headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  });

  var message = jsonDecode(response.body);

  if (response.statusCode == 201) {
    // If the server did return a 201 OK response,
    // then parse the JSON.
    return parseJob(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    return message["err"];
  }
}

Future submitApplyJob(
    String id,
    Resumes resume,
    CoverLetter coverLetter,
    String school,
    String course,
    String year,
    bool experience,
    bool education) async {
  String? token;

  final response = await http.post(
    Uri.parse("$SERVER_IP/api/job/apply-job"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(<String, dynamic>{
      "id": id,
      "resume": resume,
      "coverList": coverLetter,
      "school": school,
      "course": course,
      "year": year,
      "experience": experience,
      "education": education,
    }),
  );

  var message = jsonDecode(response.body);

  if (response.statusCode == 201) {
    return message['result'];
  } else {
    return message['msg'];
  }
}
