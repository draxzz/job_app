import 'package:flutter/material.dart';
import 'package:job/job/apply.dart';
import 'package:job/job/job_list.dart';

class JobDetailsBottomSheet extends StatefulWidget {
  final JobList item;
  final double height;

  const JobDetailsBottomSheet(
      {super.key, required this.item, required this.height});

  @override
  State<JobDetailsBottomSheet> createState() => _JobDetailsBottomSheetState();
}

class _JobDetailsBottomSheetState extends State<JobDetailsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    widget.item.image,
                    scale: 3,
                  ),
                  Text(
                    widget.item.company.toUpperCase(),
                    style: const TextStyle(color: Colors.orange),
                  ),
                  SizedBox(
                    height: widget.height * 0.01,
                  ),
                  Text(
                    widget.item.title,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: widget.height * 0.01,
                  ),
                  Text(widget.item.location,
                      style: const TextStyle(color: Colors.grey, fontSize: 12))
                ],
              ),
            ),
            SizedBox(
              height: widget.height * 0.02,
            ),
            const Text(
              "Job Description",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: widget.height * 0.01,
            ),
            Text(
              widget.item.description,
              style: const TextStyle(wordSpacing: 5, height: 1.5),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: widget.height * 0.01,
            ),
            const Text(
              "Requirements",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: widget.height * 0.01,
            ),
            ListView.builder(
              itemCount: widget.item.requirements.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Text(
                  "- ${widget.item.requirements[index]}",
                  style: const TextStyle(height: 1.5),
                );
              },
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.orange)),
                    child: const Text(
                      "Apply This Job",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Application(id: widget.item.id.toString())),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 238, 230, 219))),
                  child: const Icon(
                    Icons.bookmark_border,
                    color: Colors.orange,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
