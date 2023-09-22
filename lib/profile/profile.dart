import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:job/util/hard_code_list.dart' as hcl;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String formatDisplayDate(String date) {
    if (date != "") {
      date = DateFormat("dd-MM-yy").format(DateTime.parse(date)).toString();
      date = date.replaceAll('-', '/');
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text(
                    "Your Profile",
                    style: TextStyle(fontSize: 25),
                  ),
                  Icon(
                    Icons.person,
                    size: 25,
                  )
                ],
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Center(
                child: CircleAvatar(
                  maxRadius: 50,
                  backgroundImage: AssetImage(
                    hcl.profiles[0].image,
                  ),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Contact Info",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.edit,
                    color: Colors.black,
                  )
                ],
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              const Text(
                "Full Name",
                style: TextStyle(color: Colors.grey),
              ),
              Text("${hcl.profiles[0].firstName} ${hcl.profiles[0].lastName}"),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              const Text(
                "Email",
                style: TextStyle(color: Colors.grey),
              ),
              Text(hcl.profiles[0].email),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              const Text(
                "Mobile Number",
                style: TextStyle(color: Colors.grey),
              ),
              Text("${hcl.profiles[0].mobileNumber} "),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              const Divider(),
              SizedBox(
                height: screenHeight * 0.02,
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
                height: screenHeight * 0.02,
              ),
              const Text(
                "Resume",
                style: TextStyle(color: Colors.grey),
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: Text(
                  hcl.profiles[0].resumeList[0].name,
                ),
                subtitle: Text(
                  formatDisplayDate(
                    hcl.profiles[0].resumeList[0].uploadDate,
                  ),
                ),
                leading: const SizedBox(
                    height: double.infinity,
                    child: Icon(Icons.document_scanner_rounded,
                        color: Colors.black)),
              ),
              const Text(
                "Cover Letter",
                style: TextStyle(color: Colors.grey),
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: Text(
                  hcl.profiles[0].coverList[0].name,
                ),
                subtitle: Text(
                  formatDisplayDate(
                    hcl.profiles[0].coverList[0].uploadDate,
                  ),
                ),
                leading: const SizedBox(
                    height: double.infinity,
                    child: Icon(Icons.document_scanner_rounded,
                        color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
