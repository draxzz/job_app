import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:job/dashboard/dashboard.dart';

import 'package:job/profile/profile_list.dart';
import 'package:job/util/global.dart';
import 'package:job/util/loading_circle.dart';

class ReviewInformation extends StatefulWidget {
  const ReviewInformation(
      {super.key,
      required this.height,
      required this.width,
      required this.nextPage,
      required this.profile,
      required this.selectedCoverLetter,
      required this.selectedResume,
      required this.id,
      required this.school,
      required this.course,
      required this.year,
      required this.experience,
      required this.education});

  final double height;
  final double width;
  final Function nextPage;
  final ProfileList profile;
  final int selectedResume;
  final int selectedCoverLetter;

  final String id;
  final String school;
  final String course;
  final String year;
  final bool experience;
  final bool education;

  @override
  State<ReviewInformation> createState() => _ReviewInformationState();
}

class _ReviewInformationState extends State<ReviewInformation> {
  String formatDisplayDate(String date) {
    if (date != "") {
      date = DateFormat("dd-MM-yy").format(DateTime.parse(date)).toString();
      date = date.replaceAll('-', '/');
    } else {
      date = "";
    }
    return date;
  }

  bool _isLoading = false;

  // simulate submission
  Future submitJob() async {
    // assume delay to post data to db
    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const JobDashboard()),
      );
      showSnackBar(context, "success", "Successfully Applied Job");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Contact Info"),
            Icon(
              Icons.edit,
              color: Colors.black,
            )
          ],
        ),
        SizedBox(
          height: widget.height * 0.01,
        ),
        Center(
          child: CircleAvatar(
            maxRadius: 50,
            backgroundImage: AssetImage(
              widget.profile.image,
            ),
          ),
        ),
        SizedBox(
          height: widget.height * 0.01,
        ),
        const Text(
          "Full Name",
          style: TextStyle(color: Colors.grey),
        ),
        Text("${widget.profile.firstName} ${widget.profile.lastName}"),
        SizedBox(
          height: widget.height * 0.02,
        ),
        const Text(
          "Email",
          style: TextStyle(color: Colors.grey),
        ),
        Text(widget.profile.email),
        SizedBox(
          height: widget.height * 0.02,
        ),
        const Divider(),
        SizedBox(
          height: widget.height * 0.02,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Employment Information"),
            Icon(
              Icons.edit,
              color: Colors.black,
            )
          ],
        ),
        SizedBox(
          height: widget.height * 0.02,
        ),
        const Text(
          "Resume",
          style: TextStyle(color: Colors.grey),
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          title: Text(
            widget.profile.resumeList[widget.selectedResume].name,
          ),
          subtitle: Text(
            formatDisplayDate(
              widget.profile.resumeList[widget.selectedResume].uploadDate,
            ),
          ),
          leading: const SizedBox(
              height: double.infinity,
              child: Icon(Icons.document_scanner_rounded, color: Colors.black)),
        ),
        const Text(
          "Cover Letter",
          style: TextStyle(color: Colors.grey),
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          title: Text(
            widget.profile.coverList[widget.selectedCoverLetter].name,
          ),
          subtitle: Text(
            formatDisplayDate(
              widget.profile.coverList[widget.selectedCoverLetter].uploadDate,
            ),
          ),
          leading: const SizedBox(
              height: double.infinity,
              child: Icon(Icons.document_scanner_rounded, color: Colors.black)),
        ),
        const Text(
          "Additional Skills",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(
          height: widget.height * 0.01,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.all(5),
          child: Text(widget.profile.skills[0]),
        ),
        // ListView.separated(
        //     shrinkWrap: true,
        //     itemBuilder: (context, index) {
        //       return Container(
        //         decoration: BoxDecoration(border: Border.all()),
        //         child: Text(widget.profile.skills[index]),
        //       );
        //     },
        //     separatorBuilder: (context, index) {
        //       return const SizedBox(width: 8);
        //     },
        //     itemCount: widget.profile.skills.length),
        Center(
          child: SizedBox(
            width: widget.width,
            child: _isLoading
                ? LoadingCircle(
                    isLoading: _isLoading,
                    loadingColor: Colors.orange,
                  )
                : ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.orange),
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      await submitJob();
                      // await submitApplyJob(
                      //     widget.id,
                      //     widget.profile.resumeList[selectedResume],
                      //     widget.profile.coverList[selectedCoverLetter],
                      //     widget.school,
                      //     widget.course,
                      //     widget.year,
                      //     widget.experience,
                      //     widget.education);
                    },
                  ),
          ),
        ),
      ],
    ));
  }
}
