import 'package:flutter/material.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({super.key});

  final listTileFontSize = 16.0;
  final listTileIconSize = 22.0;
  final listTileFontColor = Colors.white;
  final listTileIconColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: const Color.fromARGB(255, 30, 30, 30),
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/pic2.jpg"),
                ),
              ),
              child: Center(
                child: Text(
                  "H3yy!!",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      fontFamily: "Times New Roman"),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                // shrinkWrap: true,
                children: [
                  ListTile(
                    textColor: listTileFontColor,
                    leading: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.login_outlined,
                        size: listTileIconSize,
                        color: listTileIconColor,
                      ),
                    ),
                    title: Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: listTileFontSize,
                      ),
                    ),
                  ),
                  ListTile(
                    textColor: listTileFontColor,
                    leading: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.person,
                        size: listTileIconSize,
                        color: listTileIconColor,
                      ),
                    ),
                    title: Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: listTileFontSize,
                      ),
                    ),
                  ),
                  ListTile(
                    textColor: listTileFontColor,
                    leading: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.history,
                        size: listTileIconSize,
                        color: listTileIconColor,
                      ),
                    ),
                    title: Text(
                      "History",
                      style: TextStyle(
                        fontSize: listTileFontSize,
                      ),
                    ),
                  ),
                  ListTile(
                    textColor: listTileFontColor,
                    leading: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.settings,
                        size: listTileIconSize,
                        color: listTileIconColor,
                      ),
                    ),
                    title: Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: listTileFontSize,
                      ),
                    ),
                  ),
                  ListTile(
                    textColor: listTileFontColor,
                    leading: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.logout_outlined,
                        size: listTileIconSize,
                        color: listTileIconColor,
                      ),
                    ),
                    title: Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: listTileFontSize,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 25, 235, 246),
              padding: const EdgeInsets.only(
                bottom: 5,
                top: 5,
                right: 6,
              ),
              alignment: Alignment.bottomRight,
              width: double.infinity,
              child: const Text(
                "Developed by : M. Jazeb Javed",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
