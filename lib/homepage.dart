import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'main.dart';
import 'requestPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

//HOMEPAGE
class _HomePageState extends State<HomePage> {
  String pickupValue = 'Opus Hall';
  String dropoffValue = 'Opus Hall';
  String passengers = '1';
  String _timeString = DateFormat('kk').format(DateTime.now()).toString();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(minutes: 15), (Timer t) => _getTime());
  }

  void _getTime() {
    final String formattedDateTime =
    DateFormat('kk').format(DateTime.now()).toString();
    setState(() {
      _timeString = formattedDateTime;
      print(_timeString);
    });
  }

  String _getTextGreeting() {
    int time = int.parse(_timeString);
    if(time > 17) {
      return 'Good Evening, Ben';
    }
    else if(time > 12) {
      return 'Good Afternoon, Ben';
    }
    else {
      return 'Good Morning, Ben';
    }
  }


  @override
  Widget build(BuildContext context) {
    return
      // WillPopScope(
      // onWillPop: () async => false,
      // child:
      Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 70,
          backgroundColor: Colors.red[900],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 3),
                child: Text(
                  _getTextGreeting(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.blueGrey.shade900,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.blueGrey.shade900,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 400,
                  width: 500,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                        child: Text(
                          'Request A Ride',
                          style: TextStyle(
                            fontFamily: 'Times',
                            fontSize: 32,
                            color: Colors.blueGrey.shade900,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 13),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Pickup Location:',
                              style: TextStyle(
                                fontFamily: 'Times',
                                fontSize: 18,
                                color: Colors.blueGrey.shade900,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                canvasColor: Colors.grey.shade300,
                              ),
                              child: Container(
                                height: 45,
                                width: 160,
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: pickupValue,
                                  icon: Icon(Icons.arrow_downward,
                                      size: 15, color: Colors.blueGrey.shade600),
                                  elevation: 16,
                                  style: TextStyle(
                                      color: Colors.blueGrey.shade600,
                                      fontSize: 16),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.blueGrey.shade600,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      pickupValue = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'Opus Hall',
                                    'Pryzbyla',
                                    'Brookland Metro',
                                    'Maloney Hall'
                                  ].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Drop-off Location:',
                              style: TextStyle(
                                fontFamily: 'Times',
                                fontSize: 18,
                                color: Colors.blueGrey.shade900,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                canvasColor: Colors.grey.shade300,
                              ),
                              child: Container(
                                height: 45,
                                width: 160,
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: dropoffValue,
                                  icon: Icon(Icons.arrow_downward,
                                      size: 15, color: Colors.blueGrey.shade600),
                                  elevation: 16,
                                  style: TextStyle(
                                      color: Colors.blueGrey.shade600,
                                      fontSize: 16),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.blueGrey.shade600,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropoffValue = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'Opus Hall',
                                    'Pryzbyla',
                                    'Brookland Metro',
                                    'Maloney Hall'
                                  ].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 52),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Passengers:',
                              style: TextStyle(
                                fontFamily: 'Times',
                                fontSize: 18,
                                color: Colors.blueGrey.shade900,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                canvasColor: Colors.grey.shade300,
                              ),
                              child: Container(
                                height: 45,
                                width: 160,
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: passengers,
                                  icon: Icon(Icons.arrow_downward,
                                      size: 15, color: Colors.blueGrey.shade600),
                                  elevation: 16,
                                  style: TextStyle(
                                      color: Colors.blueGrey.shade600,
                                      fontSize: 16),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.blueGrey.shade600,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      passengers = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    '1',
                                    '2',
                                    '3',
                                    '4',
                                    '5',
                                    '6',
                                    '7',
                                    '8',
                                    '9',
                                  ].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      TextButton(//REQUEST BUTTON
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 50, right: 50, top: 8, bottom: 8),
                          decoration: BoxDecoration(
                            color: Colors.red[100],
                            border: Border.all(
                              color: Colors.blueGrey.shade900,
                              width: 4,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            'Request',
                            style: TextStyle(
                              fontFamily: 'Times',
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Colors.blueGrey.shade900,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RequestSentPage()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.blueGrey.shade900,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 150,
                  width: 500,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 5),
                        child: Text(
                          'Current Estimated Wait Time:',
                          style: TextStyle(
                            fontFamily: 'Times',
                            fontSize: 27,
                            color: Colors.blueGrey.shade900,
                          ),
                        ),
                      ),
                      Text(
                        estWaitTime.toString() + ' min',
                        style: TextStyle(
                          fontFamily: 'Times',
                          fontSize: 40,
                          color: Colors.red.shade900,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Need special assistance?',
                              style: TextStyle(
                                fontFamily: 'Times',
                                fontSize: 22,
                                color: Colors.blueGrey.shade900,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Tap Here!',
                              style: TextStyle(
                                fontFamily: 'Times',
                                decoration: TextDecoration.underline,
                                fontSize: 22,
                                color: Colors.blue[800],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
              const Text(
                'Catholic University Office of Transportation and Parking Services',
                style: TextStyle(
                  fontFamily: 'Times',
                  fontSize: 14,
                ),
              ),
              Text(
                '202-552-7275',
                style: TextStyle(
                  fontFamily: 'Times',
                  fontSize: 15,
                  color: Colors.blue[800],
                ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width:12),
                  const Text(
                    'Driver? ',
                    style: TextStyle(
                      fontFamily: 'Times',
                      fontSize: 14,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const DriverPage())
                      );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: 'Times',
                        fontSize: 15,
                        color: Colors.blue[800],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
    );
  }
}