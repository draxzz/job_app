import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoadingCircle extends StatelessWidget {
  LoadingCircle(
      {super.key, required this.isLoading, required this.loadingColor});

  bool isLoading;
  Color loadingColor;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(loadingColor),
            ),
          )
        : const SizedBox.shrink();
  }
}

// Container(
//             color: Colors.white,
//             child: Center(
//               child: Card(
//                 elevation: 8.0, // Adjust the elevation as needed
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 child: const Padding(
//                   padding: EdgeInsets.all(20.0),
//                   child: CircularProgressIndicator(
//                     backgroundColor:
//                         Colors.black, // Black background for the circle
//                     valueColor: AlwaysStoppedAnimation<Color>(
//                         Colors.white), // White circle color
//                   ),
//                 ),
//               ),
//             ),
//           )
