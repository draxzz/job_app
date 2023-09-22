import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    required this.screenHeight,
    required this.scrolledUnderElevation,
    required this.name,
    // required TabBar tabBar,
  });

  final double screenHeight;
  final double? scrolledUnderElevation;
  // final TabBar _tabBar;
  final String name;

  @override
  Size get preferredSize => Size.fromHeight(screenHeight * 0.28);

  TabBar get _tabBar => const TabBar(
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.orangeAccent,
          indicatorPadding: EdgeInsets.only(bottom: 13),
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 3.5,
          tabs: [
            Tab(
              text: "Recent Jobs",
            ),
            Tab(
              text: "Near You",
            )
          ]);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.orange[500],
      toolbarHeight: screenHeight * 0.22,
      elevation: 0,
      automaticallyImplyLeading: false,
      scrolledUnderElevation: scrolledUnderElevation,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "Hi $name ",
                  style: const TextStyle(color: Colors.black, fontSize: 15)),
              WidgetSpan(
                  child: Transform.flip(
                flipX: true,
                child: Icon(
                  Icons.waving_hand_rounded,
                  size: 18,
                  color: Colors.amber[300],
                ),
              )),
              const TextSpan(
                  text: "\nFind The Best Job Here!",
                  style: TextStyle(color: Colors.black, fontSize: 20))
            ]),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          SearchBar(
            leading: Icon(
              Icons.search,
              size: 30,
              color: Colors.grey[700],
            ),
            backgroundColor: MaterialStatePropertyAll(Colors.grey[200]),
            elevation: MaterialStateProperty.all(0),
            constraints: const BoxConstraints(maxHeight: 1000),
            padding: const MaterialStatePropertyAll(EdgeInsets.all(5)),
            hintText: "Start searching for jobs",
            hintStyle:
                MaterialStatePropertyAll(TextStyle(color: Colors.grey[700])),
            shape: MaterialStateProperty.all(const ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            )),
          )
        ],
      ),
      bottom: PreferredSize(
          preferredSize: _tabBar.preferredSize,
          child: ColoredBox(color: Colors.white, child: _tabBar)),
    );
  }
}
