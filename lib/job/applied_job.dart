// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:job/profile/profile_list.dart';
import 'package:job/util/hard_code_list.dart' as hcl;
import 'package:http/http.dart' as http;

import 'job_list.dart';

class AppliedJobs extends StatefulWidget {
  const AppliedJobs({super.key});

  @override
  State<AppliedJobs> createState() => _AppliedJobsState();
}

class _AppliedJobsState extends State<AppliedJobs> {
  List<JobList> appliedJobsList = [];
  List<JobList> jobListings = [];
  ProfileList? profileList;

  bool _isLoadedJob = false;
  bool _isLoadedProfile = false;
  Future? futureJobListings;
  Future? futureProfileListings;
  @override
  void initState() {
    super.initState();

    futureJobListings = getJobs();
    futureProfileListings = getProfile();
  }

  // get job listing
  Future getJobs() async {
    // final populatedJobs = await fetchJobList(http.Client());
    if (!_isLoadedJob) {
      setState(() {
        jobListings = hcl.jobLists;
        _isLoadedJob = true;
      });
    }

    return jobListings;
  }

  // get profile
  Future getProfile() async {
    // final populatedProfile = await fetchProfile(http.Client());
    if (!_isLoadedProfile) {
      setState(() {
        profileList = hcl.profiles[0];
        for (final job in jobListings) {
          if (profileList!.appliedList.contains(job.id)) {
            appliedJobsList.add(job);
          }
        }
        _isLoadedProfile = true;
      });
    }

    return appliedJobsList;
  }

  String formatDisplayDate(String date) {
    if (date != "") {
      date = DateFormat("dd-MMM-yyyy").format(DateTime.parse(date)).toString();
      date = date.replaceAll('-', ' ');
    } else {
      date = "";
    }
    return date;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        minimum: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text(
                    "Your Applied Jobs ",
                    style: TextStyle(fontSize: 30),
                  ),
                  Icon(Icons.edit)
                ],
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Text(
                  "You applied for ${hcl.profiles[0].appliedList.length} jobs"),
              ListView.separated(
                itemCount: appliedJobsList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8);
                },
                itemBuilder: (context, index) {
                  final formatter = NumberFormat.compact(
                    locale: "en_US",
                  );
                  return Card(
                    margin: const EdgeInsets.only(
                        top: 5, left: 10, right: 10, bottom: 5),
                    child: ListTile(
                      contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            appliedJobsList[index].company.toUpperCase(),
                            style: const TextStyle(
                                color: Colors.orange,
                                fontSize: 12,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            formatDisplayDate(hcl.jobLists[index].postedAt),
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0, top: 4),
                            child: Text(
                              appliedJobsList[index].title,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.money),
                              Text(
                                  '\$${formatter.format(appliedJobsList[index].minSalary)}-',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  )),
                              Text(
                                  '\$${formatter.format(appliedJobsList[index].maxSalary)}/month   ',
                                  style: const TextStyle(color: Colors.grey)),
                              Text(
                                hcl.jobLists[index].location,
                                style: const TextStyle(color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ));
  }
}
