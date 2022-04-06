import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';
import 'requestPage.dart';

void main() {
  runApp(const MyApp());
}

int estWaitTime = 10;

final List rides = [
  ['Opus Hall', 'Pryzbyla', 4],
  ['Pryzbyla', 'Dufour Center', 6],
  ['Gibbons Hall', 'St. Vincent Chapel', 2],
  ['Brookland Metro', 'Opus Hall', 5],
  ['Opus Hall', 'Pryzbyla', 4],
  ['Pryzbyla', 'Dufour Center', 6],
];

class DriverPage extends StatefulWidget {
  const DriverPage({Key? key}) : super(key: key);

  @override
  State<DriverPage> createState() => _DriverPageState();
}

class _DriverPageState extends State<DriverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Colors.red[900],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 11),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: SizedBox(
                height: 50,
                child: Image.asset('lib/icons/cua.png'),
              ),
            ),
            const Text(
              'Campus Shuttle',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Times',
                fontSize: 26,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Rides:',
              style: TextStyle(
                fontFamily: 'Times',
                fontSize: 32,
                color: Colors.blueGrey.shade900,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: rides.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Ride(
                  pickup: rides[index][0],
                  dropoff: rides[index][1],
                  passenger: rides[index][2],
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Ride extends StatefulWidget {
  final String pickup;
  final String dropoff;
  final int passenger;
  final int index;

  Ride({
    required this.pickup,
    required this.dropoff,
    required this.passenger,
    required this.index,
  });

  @override
  State<Ride> createState() => _RideState();
}

class _RideState extends State<Ride> {
  final int waitTime = estWaitTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7.0, left: 8, right: 8),
      child: TextButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => ViewRide(
                  pickup: widget.pickup,
                  dropoff: widget.dropoff,
                  passenger: widget.passenger,
                  index: widget.index));
        },
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey.shade500,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          height: 65,
          width: 500,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(
                      (widget.index + 1).toString(),
                      style: TextStyle(
                        fontFamily: 'Times',
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 12),
                    child: VerticalDivider(
                      color: Colors.grey[400],
                      thickness: 2,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Pickup:',
                        style: TextStyle(
                          fontFamily: 'Times',
                          fontSize: 15,
                          color: Colors.blueGrey.shade900,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Drop-off:',
                        style: TextStyle(
                          fontFamily: 'Times',
                          fontSize: 15,
                          color: Colors.blueGrey.shade900,
                        ),
                      ),
                      SizedBox(height: 2),
                    ],
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.pickup,
                        style: TextStyle(
                          fontFamily: 'Times',
                          fontSize: 15,
                          color: Colors.red.shade900,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        widget.dropoff,
                        style: TextStyle(
                          fontFamily: 'Times',
                          fontSize: 15,
                          color: Colors.red.shade900,
                        ),
                      ),
                      SizedBox(height: 2),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey[400],
                  size: 35,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ViewRide extends StatefulWidget {
  final String pickup;
  final String dropoff;
  final int passenger;
  final int index;

  ViewRide({
    required this.pickup,
    required this.dropoff,
    required this.passenger,
    required this.index,
  });

  @override
  State<ViewRide> createState() => _ViewRideState();
}

class _ViewRideState extends State<ViewRide> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.all(10),
      backgroundColor: Colors.transparent,
      content: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.blueGrey.shade900,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        height: 500,
        width: 500,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BackButton(),
                ),
                SizedBox(width: 70),
                Text(
                  'RIDE ' + (widget.index + 1).toString() + ':',
                  style: TextStyle(
                    fontFamily: 'Times',
                    fontSize: 22,
                    color: Colors.red.shade900,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pickup:',
                          style: TextStyle(
                            fontFamily: 'Times',
                            fontSize: 18,
                            color: Colors.blueGrey.shade900,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Drop-off:',
                          style: TextStyle(
                            fontFamily: 'Times',
                            fontSize: 18,
                            color: Colors.blueGrey.shade900,
                          ),
                        ),
                        SizedBox(height: 2),
                      ],
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.pickup,
                          style: TextStyle(
                            fontFamily: 'Times',
                            fontSize: 18,
                            color: Colors.red.shade900,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          widget.dropoff,
                          style: TextStyle(
                            fontFamily: 'Times',
                            fontSize: 18,
                            color: Colors.red.shade900,
                          ),
                        ),
                        SizedBox(height: 2),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 35),
                  child: Column(
                    children: [
                      SizedBox(height: 7),
                      SizedBox(
                          height: 28,
                          child: Image.asset('lib/icons/person.png')
                      ),
                      Text(
                        widget.passenger.toString(),
                        style: TextStyle(
                          fontFamily: 'Times',
                          fontSize: 18,
                          color: Colors.red.shade900,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 70),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                border: Border.all(
                  color: Colors.grey.shade400,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(
                    'Estimated Wait Time:',
                    style: TextStyle(
                      fontFamily: 'Times',
                      fontSize: 18,
                      color: Colors.blueGrey[900],
                    ),
                  ),
                  Text(
                    estWaitTime.toString() + ' min',
                    style: TextStyle(
                      fontFamily: 'Times',
                      fontSize: 30,
                      color: Colors.red.shade900,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // The line below forces the theme to iOS.
        platform: TargetPlatform.iOS,
      ),
      initialRoute: '/requestPage',
      routes: {
        '/requestPage': (context) => const HomePage(),
        '/confirmCancel': (context) => const RequestSentPage(),
        '/driver': (context) => const DriverPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
