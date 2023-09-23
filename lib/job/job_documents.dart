// ignore_for_file: unused_local_variable, unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:job/job/apply.dart';
import 'package:job/profile/profile_list.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

// ignore: must_be_immutable
class JobUploadDocuments extends StatefulWidget {
  JobUploadDocuments(
      {super.key,
      required this.height,
      required this.width,
      required this.nextPage,
      required this.profile,
      required this.selectedCoverLetter,
      required this.selectedResume});

  final double height;
  final double width;
  final Function nextPage;
  final ProfileList profile;
  int selectedResume, selectedCoverLetter;

  @override
  State<JobUploadDocuments> createState() => _JobUploadDocumentsState();
}

class _JobUploadDocumentsState extends State<JobUploadDocuments> {
  List<String> resumeList = [];
  List<String> coverLetterList = [];

  String formatDisplayDate(String date) {
    if (date != "") {
      date = DateFormat("dd-MM-yy").format(DateTime.parse(date)).toString();
      date = date.replaceAll('-', '/');
    } else {
      date = "";
    }
    return date;
  }

  dynamic attachment, input;

  void _pickFile(bool isResume) async {
    attachment = await FilePicker.platform
        .pickFiles(allowedExtensions: ['pdf'], type: FileType.custom);

    if (attachment != null) {
      input = File(attachment.files.single.path!);
      var bytes = input.readAsBytesSync();
      var fileName = attachment.files.first.name;

      // Get the directory where you want to save the PDF file

      // final directory = await getApplicationDocumentsDirectory();
      // final pdfDirectory = Directory.current;
      // final documentsDirectory =
      //     Directory(path.join(pdfDirectory.path, 'documents'));

      // // Save the PDF file to the root folder of the documents directory
      // final file = File(path.join(documentsDirectory.path, fileName));

      // await file.writeAsBytes(bytes);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: const Text("Resume",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
            subtitle:
                const Text("Remember to include your most updated resume"),
            trailing: InkWell(
                onTap: () {
                  _pickFile(true);
                },
                child: const Icon(
                  Icons.add_rounded,
                  color: Colors.black,
                  weight: 100,
                )),
          ),
          SizedBox(
            height: widget.height * 0.01,
          ),
          ListView.separated(
              shrinkWrap: true,
              itemCount: (widget.profile.resumeList).length,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return const SizedBox(height: 8);
              },
              itemBuilder: ((context, index) {
                return ListTile(
                  title: Text(
                    widget.profile.resumeList[index].name,
                    style: TextStyle(
                        color: selectedResume == index
                            ? Colors.white
                            : Colors.orange),
                  ),
                  subtitle: Text(
                    formatDisplayDate(
                      widget.profile.resumeList[index].uploadDate,
                    ),
                    style: TextStyle(
                        color: selectedResume == index
                            ? Colors.white
                            : Colors.orange),
                  ),
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(width: 1, color: Colors.orange)),
                  tileColor: selectedResume == index
                      ? Colors.orange
                      : Colors.orange[100],
                  leading: SizedBox(
                      height: double.infinity,
                      child: Icon(
                        Icons.document_scanner_rounded,
                        color: selectedResume == index
                            ? Colors.white
                            : Colors.orange,
                      )),
                  onTap: () {
                    setState(() {
                      selectedResume = index;
                    });
                  },
                );
              })),
          SizedBox(
            height: widget.height * 0.02,
          ),
          ListTile(
            title: const Text("Cover Letter",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
            subtitle: const Text("Stand out with your cover letter"),
            trailing: InkWell(
                onTap: () {
                  _pickFile(false);
                },
                child: const Icon(
                  Icons.add_rounded,
                  color: Colors.black,
                  weight: 100,
                )),
          ),
          SizedBox(
            height: widget.height * 0.01,
          ),
          ListView.separated(
              shrinkWrap: true,
              itemCount: (widget.profile.coverList).length,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return const SizedBox(height: 8);
              },
              itemBuilder: ((context, index) {
                return ListTile(
                  title: Text(
                    widget.profile.coverList[index].name,
                    style: TextStyle(
                        color: selectedCoverLetter == index
                            ? Colors.white
                            : Colors.orange),
                  ),
                  subtitle: Text(
                    formatDisplayDate(
                      widget.profile.coverList[index].uploadDate,
                    ),
                    style: TextStyle(
                        color: selectedCoverLetter == index
                            ? Colors.white
                            : Colors.orange),
                  ),
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(width: 1, color: Colors.orange)),
                  tileColor: selectedCoverLetter == index
                      ? Colors.orange
                      : Colors.orange[100],
                  leading: SizedBox(
                      height: double.infinity,
                      child: Icon(
                        Icons.document_scanner_rounded,
                        color: selectedCoverLetter == index
                            ? Colors.white
                            : Colors.orange,
                      )),
                  onTap: () {
                    setState(() {
                      selectedCoverLetter = index;
                    });
                  },
                );
              })),
          SizedBox(
            height: widget.height * 0.02,
          ),
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
}
