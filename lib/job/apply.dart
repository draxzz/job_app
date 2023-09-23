import 'package:flutter/material.dart';
import 'package:job/profile/profile_list.dart';

import 'job_documents.dart';
import 'job_information.dart';

import 'package:job/util/hard_code_list.dart' as hcl;

import 'review_information.dart';

class Application extends StatefulWidget {
  const Application({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<Application> createState() => _ApplicationState();
}

double _progress = 0;
int currentPage = 0;
final PageController _progressController = PageController(initialPage: 0);

String school = "";
String study = "";
String year = "";

int selectedResume = 0;
int selectedCoverLetter = 0;

bool educationSwitch = false;
bool experienceSwitch = false;

class _ApplicationState extends State<Application> {
  ProfileList? profileList;

  bool _isLoadedProfile = false;

  Future? futureProfileListings;

  @override
  void initState() {
    super.initState();
    _progress = 1 / 3;
    futureProfileListings = getProfile();
  }

  String returnProgressTitle() {
    String title = "";
    if (_progress == 1 / 3) {
      title = "Uploading of Documents";
    } else if (_progress == 2 / 3) {
      title = "Employment Information";
    } else {
      title = "Review Information";
    }
    return title;
  }

  void nextPage() {
    setState(() {
      currentPage = currentPage + 1;
      _progress = (currentPage + 1) / 3;
    });
    _progressController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  void previousPage() {
    _progressController.previousPage(
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
    setState(() {
      currentPage = currentPage - 1;
      _progress = (currentPage - 1) / 3;
    });
  }

  Future getProfile() async {
    // final populatedProfile = await fetchProfile(http.Client());
    if (!_isLoadedProfile) {
      setState(() {
        profileList = hcl.profiles[0];

        _isLoadedProfile = true;
      });
    }

    return profileList;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: _progress != 1 / 3
            ? IconButton(
                icon: const Icon(
                  Icons.chevron_left,
                  color: Colors.black,
                ),
                onPressed: () {
                  previousPage();
                },
              )
            : IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
      ),
      body: SafeArea(
          minimum: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Apply to Slack",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Text(
                returnProgressTitle(),
                style: const TextStyle(color: Colors.orange),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              LinearProgressIndicator(
                  minHeight: 5.0,
                  value: _progress,
                  color: Colors.orange[700],
                  backgroundColor: Colors.white),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Expanded(
                child: PageView(
                  controller: _progressController,
                  onPageChanged: (int page) {
                    setState(() {
                      currentPage = page;
                      _progress = (currentPage + 1) /
                          3; // Update the progress based on the current page
                    });
                  },
                  children: [
                    JobUploadDocuments(
                      height: screenHeight,
                      width: screenWidth,
                      nextPage: nextPage,
                      profile: profileList!,
                      selectedResume: selectedResume,
                      selectedCoverLetter: selectedCoverLetter,
                    ),
                    EmployementInformation(
                      height: screenHeight,
                      width: screenWidth,
                      nextPage: nextPage,
                      school: school,
                      study: study,
                      year: year,
                      experienceSwitch: experienceSwitch,
                      educationSwitch: educationSwitch,
                    ),
                    ReviewInformation(
                      height: screenHeight,
                      width: screenWidth,
                      nextPage: nextPage,
                      profile: profileList!,
                      selectedResume: selectedResume,
                      selectedCoverLetter: selectedCoverLetter,
                      id: widget.id,
                      school: school,
                      course: study,
                      year: year,
                      experience: experienceSwitch,
                      education: educationSwitch,
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
