import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final imgUrl =
      "https://static.photocdn.pt/images/articles/2019/08/07/images/articles/2019/07/31/best_linkedin_photos.jpg";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                accountName: Text("Davy Jacobs"),
                accountEmail: Text("jacobs9871@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imgUrl),
                ),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home, color: Colors.white),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            ListTile(
              leading:
                  Icon(CupertinoIcons.profile_circled, color: Colors.white),
              title: Text(
                "Profile",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail, color: Colors.white),
              title: Text(
                "E-mail",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
