import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:job/main.dart';

class ProfileList {
  String firstName;
  String lastName;
  String email;
  String mobileNumber;
  List<String> skills;
  List<Resumes> resumeList;
  List<CoverLetter> coverList;
  List<int> appliedList;
  dynamic image;

  ProfileList({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobileNumber,
    required this.skills,
    required this.resumeList,
    required this.coverList,
    required this.appliedList,
    required this.image,
  });

  // when getting values from db
  factory ProfileList.fromJson(Map<String, dynamic> json) {
    return ProfileList(
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
      mobileNumber: json["mobileNumber"],
      skills: json["skills"],
      resumeList: json["resumeList"],
      coverList: json["coverList"],
      appliedList: json["appliedList"],
      image: json["image"],
    );
  }

  // when passing in values to backend
  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "mobileNumber": mobileNumber,
        "skills": skills,
        "resumeList": resumeList,
        "coverList": coverList,
        "appliedList": appliedList,
        "image": image,
      };
}

class Resumes {
  String name;
  String fileLocation;
  dynamic uploadDate;

  Resumes(
      {required this.name,
      required this.fileLocation,
      required this.uploadDate});

  factory Resumes.fromJson(Map<String, dynamic> json) {
    return Resumes(
        name: json["name"],
        fileLocation: json["fileLocation"],
        uploadDate: json["uploadDate"]);
  }

  Map<String, dynamic> toJson() =>
      {"name": name, "fileLocation": fileLocation, "uploadDate": uploadDate};
}

class CoverLetter {
  String name;
  String fileLocation;
  String uploadDate;

  CoverLetter(
      {required this.name,
      required this.fileLocation,
      required this.uploadDate});

  factory CoverLetter.fromJson(Map<String, dynamic> json) {
    return CoverLetter(
        name: json["name"],
        fileLocation: json["fileLocation"],
        uploadDate: json["uploadDate"]);
  }

  Map<String, dynamic> toJson() =>
      {"name": name, "fileLocation": fileLocation, "uploadDate": uploadDate};
}

List<ProfileList> parseJob(String responseBody) {
  Map<dynamic, dynamic> jobMap = jsonDecode(responseBody);

  List<ProfileList> jobList = (jobMap['result']! as List)
      .map((item) => ProfileList.fromJson(item))
      .toList();

  return jobList;
}

Future<List<ProfileList>> fetchProfile(http.Client client) async {
  var url = "$SERVER_IP/api/job/view-profile";
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
