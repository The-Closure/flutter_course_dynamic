import 'package:flutter/material.dart';
import 'package:slivers/weekly_schedule.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text(
      //     "Weekly Schedule",
      //     style: TextStyle(
      //       color: Colors.white,
      //     ),
      //   ),
      //   backgroundColor: Colors.purple.shade300,
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text(
                "Weekly Schedule",
                style: TextStyle(
                  color: Colors.white,
                  // fontSize: 50,
                ),
              ),
              background: Image.asset(
                appBarImage,
                fit: BoxFit.cover,
              ),
            ),
            pinned: true,
            // snap: true,
            // floating: true,
            expandedHeight: 200,
            centerTitle: true,
            title: const Text(
              "Weekly Schedule",
              style: TextStyle(
                color: Colors.white,
                // fontSize: 50,
              ),
            ),
            backgroundColor: Colors.purple.shade300,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: weekSchedule.length,
              (context, index) {
                return Card(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 200,
                          height: 200,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              DecoratedBox(
                                position: DecorationPosition.foreground,
                                decoration: BoxDecoration(
                                    gradient: RadialGradient(colors: [
                                  Colors.grey.shade800,
                                  Colors.transparent,
                                ])),
                                child: Image.asset(
                                  weekSchedule[index]['image'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Center(
                                child: Text(
                                  weekSchedule[index]['dayDate'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              weekSchedule[index]['day'],
                              style: const TextStyle(
                                fontSize: 50,
                              ),
                            ),
                            Text(
                              weekSchedule[index]['daySchedule'],
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          weekSchedule[index]['lectureTimes'],
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// child: ListTile(
//                 leading: Text(
//                   weekSchedule[index]['dayDate'],
//                   style: const TextStyle(
//                     fontSize: 30,
//                   ),
//                 ),
//                 title: Text(
//                   weekSchedule[index]['day'],
//                   style: const TextStyle(
//                     fontSize: 50,
//                   ),
//                 ),
//                 subtitle: Text(
//                   weekSchedule[index]['daySchedule'],
//                   style: const TextStyle(
//                     fontSize: 20,
//                   ),
//                 ),
//                 trailing: Text(
//                   weekSchedule[index]['lectureTimes'],
//                   style: const TextStyle(
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
class GirdPage extends StatelessWidget {
  const GirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: weekSchedule.length,
      itemBuilder: (context, index) {
        return Card(
          child: Image.asset(weekSchedule[index]['image']),
        );
      },
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        mainAxisExtent: 500,
      ),
      // children: [
      //   Card(
      //     child: Image.asset(weekSchedule[0]['image']),
      //   ),
      //   Card(
      //     child: Image.asset(weekSchedule[0]['image']),
      //   ),
      //   Card(
      //     child: Image.asset(weekSchedule[0]['image']),
      //   ),
      //   Card(
      //     child: Image.asset(weekSchedule[0]['image']),
      //   ),
      // ],
    );
  }
}
