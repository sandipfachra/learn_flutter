import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://cdn.pixabay.com/photo/2018/05/11/16/18/man-3390927_960_720.jpg";

    return Drawer(
      child: Container(
        color: Colors.orange,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Sandip Fachara",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                accountEmail: Text("Sandip@gmail.com",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                size: 30,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.4,
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                size: 30,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.4,
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                size: 30,
              ),
              title: Text(
                "Email ",
                textScaleFactor: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
