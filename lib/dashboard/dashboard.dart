import 'package:flutter/material.dart';
import 'package:job/job/applied_job.dart';
import 'package:job/job/job_view.dart';
import 'package:job/profile/profile.dart';
import 'package:job/util/hard_code_list.dart' as hcl;
import 'package:intl/intl.dart';

import 'dashboard_appbar.dart';

class JobDashboard extends StatefulWidget {
  const JobDashboard({super.key});

  @override
  State<JobDashboard> createState() => _JobDashboardState();
}

class _JobDashboardState extends State<JobDashboard> {
  bool shadowColor = false;
  double? scrolledUnderElevation;
  int selectedNavBar = 0;

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

    int topTab = 2;
    return DefaultTabController(
      initialIndex: 0,
      length: topTab,
      child: Scaffold(
        appBar: selectedNavBar == 0
            ? AppBarWidget(
                screenHeight: screenHeight,
                scrolledUnderElevation: scrolledUnderElevation,
                name: hcl.firstName,
              )
            : null,
        body: IndexedStack(
          index: selectedNavBar,
          children: const [JobListings(), AppliedJobs(), ProfilePage()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.black,
          onTap: (value) {
            selectedNavBar = value;
            setState(() {});
          },
          currentIndex: selectedNavBar,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_outlined), label: ('Job Listings')),
            BottomNavigationBarItem(
                icon: Icon(Icons.edit), label: ('Applied Jobs')),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: ('Profile')),
          ],
        ),
      ),
    );
  }
}


 // SizedBox(
              //     child: SearchAnchor(
              //   builder: (context, controller) {
              //     return const SearchBar(
              //       leading: Icon(Icons.search),
              //     );
              //   },
              //   suggestionsBuilder:
              //       (BuildContext context, SearchController controller) {
              //     return List<ListTile>.generate(5, (int index) {
              //       final String item = 'item $index';
              //       return ListTile(
              //         title: Text(item),
              //         onTap: () {
              //           setState(() {
              //             controller.closeView(item);
              //           });
              //         },
              //       );
              //     });
              //   },
              // )),