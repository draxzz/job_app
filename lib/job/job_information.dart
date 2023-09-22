import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmployementInformation extends StatefulWidget {
  EmployementInformation(
      {super.key,
      required this.height,
      required this.width,
      required this.nextPage,
      required this.school,
      required this.study,
      required this.year,
      required this.educationSwitch,
      required this.experienceSwitch});

  final double height;
  final double width;
  final Function nextPage;
  String school, study, year;
  bool experienceSwitch, educationSwitch;

  @override
  State<EmployementInformation> createState() => _EmployementInformationState();
}

class _EmployementInformationState extends State<EmployementInformation> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: const Text("Education",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              subtitle: const Text("Included in Resume"),
              trailing: CupertinoSwitch(
                value: widget.educationSwitch,
                activeColor: Colors.grey,
                onChanged: (bool value) {
                  setState(() {
                    widget.educationSwitch = value;
                  });
                },
              )),
          SizedBox(
            height: widget.height * 0.015,
          ),

          //school
          const Text("Name of school"),
          SizedBox(
            height: widget.height * 0.01,
          ),
          textFields(widget.school),
          SizedBox(
            height: widget.height * 0.02,
          ),

          //study
          const Text("Course of study"),
          SizedBox(
            height: widget.height * 0.01,
          ),
          textFields(widget.study),
          SizedBox(
            height: widget.height * 0.015,
          ),

          //year
          const Text("Year graduated"),
          SizedBox(
            height: widget.height * 0.01,
          ),
          textFields(widget.year),
          SizedBox(
            height: widget.height * 0.02,
          ),
          ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: const Text("Work Experience",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              subtitle: const Text("Included in Resume"),
              trailing: CupertinoSwitch(
                value: widget.experienceSwitch,
                activeColor: Colors.grey,
                onChanged: (bool value) {
                  setState(() {
                    widget.experienceSwitch = value;
                  });
                },
              )),
          SizedBox(
            height: widget.height * 0.02,
          ),
          const Text("Additional Skills"),

          Center(
            child: SizedBox(
              width: widget.width,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.orange),
                ),
                child: const Text(
                  "Proceed",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  widget.nextPage();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextField textFields(String input) {
    return TextField(
      decoration: InputDecoration(
        // hintText: 'example@mail.com',

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 1,
            color: Color(0xFF837E93),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 1,
            color: Colors.orange,
          ),
        ),
      ),
      onChanged: (value) {
        input = value;
      },
    );
  }
}
