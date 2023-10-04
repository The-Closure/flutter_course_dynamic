import 'package:flutter/material.dart';
import 'package:pageview_bottomnavigation_drawer_snackbar/pages/BottomPages/calender.dart';
import 'package:pageview_bottomnavigation_drawer_snackbar/pages/BottomPages/home.dart';
import 'package:pageview_bottomnavigation_drawer_snackbar/pages/BottomPages/location.dart';

class Profile extends StatefulWidget {
  final PageController controller;
  const Profile({super.key, required this.controller});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black38,
              ),
              child: SizedBox(
                width: 10,
                height: 10,
                child: FlutterLogo(
                  style: FlutterLogoStyle.horizontal,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const Home();
                  }),
                );
              },
              leading: const Icon(Icons.home),
              title: const Text("Home"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const Calender();
                  }),
                );
              },
              leading: const Icon(Icons.calendar_view_day_rounded),
              title: const Text("Calender"),
            ),
            buildListTile(
                context, "Location", Icons.location_city, const Location()),
            // ListTile(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) {
            //         return const Location();
            //       }),
            //     );
            //   },
            //   leading: const Icon(Icons.location_city),
            //   title: const Text("Location"),
            // ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Pofrile Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("I am Profile Page"),
            MaterialButton(
              color: Colors.red,
              onPressed: () {
                widget.controller.animateToPage(0,
                    duration: const Duration(seconds: 4),
                    curve: Curves.linearToEaseOut);
              },
              child: const Text("Go To Page"),
            )
          ],
        ),
      ),
    );
  }
}

ListTile buildListTile(
    BuildContext context, String tilte, IconData icon, Widget page) {
  return ListTile(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return page;
        }),
      );
    },
    leading: Icon(icon),
    title: Text(tilte),
  );
}
