import 'package:flutter/material.dart';

class AppBarProfile extends StatelessWidget with PreferredSizeWidget {
  const AppBarProfile(
      {Key? key, required this.appBarName, required this.isLeading})
      : super(key: key);

  final String appBarName;
  final bool isLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: isLeading,
      iconTheme: const IconThemeData(
        color: Colors.white, //change your color here
      ),
      // leading: SizedBox(
      //   height: 30,
      //   child: Image.asset('assets/images/hamburger.png'),
      //   width: 20,
      // ),
      flexibleSpace: Container(
        decoration: BoxDecoration(color: Colors.transparent),
      ),
      title: Center(
          child: SizedBox(
              height: 50, child: Image.asset('assets/images/icon.png'))),
      backgroundColor: Colors.white,
      elevation: 0,
      actions: <Widget>[
        SizedBox(
          height: 30,
          child: GestureDetector(
              onTap: () {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => ProfileView()));
              },
              child: Image.asset('assets/images/profile.png')),
          width: 30,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
