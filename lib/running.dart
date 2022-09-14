import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vehicle_managment_system/Vehicle_modal.dart';
import 'package:vehicle_managment_system/search.dart';
import 'package:vehicle_managment_system/single_vehicle.dart';

class RunningVehiclePage extends StatefulWidget {
  final String fromPage;
  final String fromWhere;
  const RunningVehiclePage(
      {Key? key, required this.fromPage, required this.fromWhere})
      : super(key: key);
  @override
  _RunningVehiclePageState createState() =>
      new _RunningVehiclePageState(fromPage, fromWhere);
}

class _RunningVehiclePageState extends State<RunningVehiclePage> {
  final String fromPage;
  final String fromWhere;
  _RunningVehiclePageState(this.fromPage, this.fromWhere);

  @override
  Widget build(BuildContext context) {
    // Initialize FlutterFire
    Firebase.initializeApp();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
            elevation: 5.0,
            title: TextButton(
              child: const Text("Enter vehicle number to search .. ",
                  style: TextStyle(color: Colors.black38, fontSize: 15)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CloudFirestoreSearch()),
                );
              },
            ),
            backgroundColor: Colors.white70,
            actions: [
              IconButton(
                icon: (const Icon(Icons.search)),
                color: Colors.black38,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CloudFirestoreSearch()),
                  );
                },
              ),
            ],
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
                top: Radius.circular(15),
              ),
            )),
        body: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8, left: 4, right: 4),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(blurRadius: 6.0, color: Colors.blueGrey)],
              color: Colors.blueAccent.withOpacity(0.8),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(15),
                top: Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder<List<Vehicle>>(
                  stream: fromPage == 'division'
                      ? readVehicles(fromWhere)
                      : fromPage == 'modal'
                          ? readVehiclesModal(fromWhere)
                          : readVehiclesType(fromWhere),
                  builder: (context, snapShot) {
                    if (snapShot.error != null) {
                      return Text(
                          'Something went wrong ! ${snapShot.error.toString()}');
                    } else if (snapShot.hasData) {
                      final vehicles = snapShot.data;
                      if (fromPage == 'division') {
                        return GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 0.80,
                          children: vehicles!
                              .map((vehicle) => buildVehicle(vehicle, context))
                              .toList(),
                        );
                      } else if (fromPage == 'modal') {
                        return GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 0.80,
                          children: vehicles!
                              .map((vehicle) => buildVehicle(vehicle, context))
                              .toList(),
                        );
                      } else {
                        return GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 0.80,
                          children: vehicles!
                              .map((vehicle) => buildVehicle(vehicle, context))
                              .toList(),
                        );
                      }
                    } else {
                      return const Center(
                          child: CircularProgressIndicator.adaptive());
                    }
                  }),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildVehicle(Vehicle vehicle, BuildContext context) => TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SingleVehiclePage(id: vehicle.id)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10),
              top: Radius.circular(10),
            ),
            color: Colors.white70,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(vehicle.division),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: vehicle.type == "Backhoe Loader"
                      ? Image.asset('assets/images/backhoe_loader.png')
                      : vehicle.type == "Crawler Excavator"
                          ? Image.asset('assets/images/crawler_excavator.png')
                          : vehicle.type == "Motor Grader"
                              ? Image.asset('assets/images/motor_grader.png')
                              : vehicle.type == "Crawler Excavator Long arm"
                                  ? Image.asset(
                                      'assets/images/crawler_excavator_longarm.png')
                                  : vehicle.type ==
                                          "Crawler Excavator with barge"
                                      ? Image.asset(
                                          'assets/images/crawler_excavator_withbarge.png')
                                      : vehicle.type ==
                                              "Double Drum Vibrating Roller"
                                          ? Image.asset(
                                              'assets/images/double_drum _vibrating_roller.png')
                                          : vehicle.type == "Sheep foot Roller"
                                              ? Image.asset(
                                                  'assets/images/sheep_foot_roller.png')
                                              : vehicle.type ==
                                                      "Sheep foot Roller"
                                                  ? Image.asset(
                                                      'assets/images/sheep_foot_roller.png')
                                                  : vehicle.type ==
                                                          "Front End Loader"
                                                      ? Image.asset(
                                                          'assets/images/front_end_loader.png')
                                                      : vehicle.type ==
                                                              "Tractor"
                                                          ? Image.asset(
                                                              'assets/images/tractor.png')
                                                          : vehicle.type ==
                                                                  "Amblibious weed cutter"
                                                              ? Image.asset(
                                                                  'assets/images/amblibious_weedcutter.png')
                                                              : vehicle.type ==
                                                                      "Amblibious weed Harvester"
                                                                  ? Image.asset(
                                                                      'assets/images/amblibious eed_harvester.png')
                                                                  : null,
                ),
                Text(vehicle.vehicleNumber),
              ],
            ),
          ),
        ),
      ),
    );

Stream<List<Vehicle>> readVehicles(String fromWhere) =>
    FirebaseFirestore.instance
        .collection('vehicles')
        .where('state', isEqualTo: 'Running')
        .where('division', isEqualTo: fromWhere)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Vehicle.fromJson(doc.data())).toList());

Stream<List<Vehicle>> readVehiclesModal(fromWhere) => FirebaseFirestore.instance
    .collection('vehicles')
    .where('state', isEqualTo: 'Running')
    .where('modal', isEqualTo: fromWhere)
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Vehicle.fromJson(doc.data())).toList());

Stream<List<Vehicle>> readVehiclesType(fromWhere) => FirebaseFirestore.instance
    .collection('vehicles')
    .where('state', isEqualTo: 'Running')
    .where('type', isEqualTo: fromWhere)
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Vehicle.fromJson(doc.data())).toList());
