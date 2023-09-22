import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:job/dashboard/dashboard_modal.dart';
import 'package:job/util/hard_code_list.dart' as hcl;
import 'package:http/http.dart' as http;

import 'job_list.dart';

class JobListings extends StatefulWidget {
  const JobListings({super.key});

  @override
  State<JobListings> createState() => _JobListingsState();
}

class _JobListingsState extends State<JobListings> {
  List<JobList> jobListings = [];
  bool _isLoadedJob = false;

  Future? futureJobListings;

  String formatDisplayDate(String date) {
    if (date != "") {
      date = DateFormat("dd-MMM-yyyy").format(DateTime.parse(date)).toString();
      date = date.replaceAll('-', ' ');
    } else {
      date = "";
    }
    return date;
  }

  void _settingModalBottomSheet(
      BuildContext context, JobList item, double height) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      showDragHandle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      builder: (BuildContext context) {
        return JobDetailsBottomSheet(item: item, height: height);
      },
    );
  }

  // get job listing
  Future getJobs() async {
    final populatedJobs = await fetchJobList(http.Client());
    if (!_isLoadedJob) {
      setState(() {
        jobListings = populatedJobs;
        _isLoadedJob = true;
      });
    }

    return populatedJobs;
  }

  @override
  void initState() {
    super.initState();
    // get job listing
    // futureJobListings = getJobs();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: ListView.separated(
      itemCount: hcl.jobLists.length,
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 8);
      },
      itemBuilder: (context, index) {
        final formatter = NumberFormat.compact(
          locale: "en_US",
        );
        return Card(
          margin: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
          child: ListTile(
            contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            onTap: () {
              _settingModalBottomSheet(
                  context, hcl.jobLists[index], screenHeight);
            },
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  hcl.jobLists[index].company.toUpperCase(),
                  style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 12,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  formatDisplayDate(hcl.jobLists[index].postedAt),
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 4),
                  child: Text(
                    hcl.jobLists[index].title,
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
                        '\$${formatter.format(hcl.jobLists[index].minSalary)}-',
                        style: const TextStyle(
                          color: Colors.grey,
                        )),
                    Text(
                        '\$${formatter.format(hcl.jobLists[index].maxSalary)}/month   ',
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
    ));
  }
}
