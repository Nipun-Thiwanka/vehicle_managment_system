import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vehicle_managment_system/Vehicle_modal.dart';
import 'package:vehicle_managment_system/search.dart';
import 'package:vehicle_managment_system/vehicle_list.dart';


class ModalPage extends StatefulWidget {
  ModalPage({Key? key}) : super(key: key);
  @override
  _ModalPageState createState() => new _ModalPageState();
}
class _ModalPageState extends State<ModalPage> {
  @override
  Widget build(BuildContext context) {

    List<String> modalList = Vehicle.getVehicleModalList();
    Firebase.initializeApp();
    final Stream<QuerySnapshot> _vehicleStream = FirebaseFirestore.instance
        .collection('vehicles').snapshots(includeMetadataChanges: true);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar:  AppBar(
            elevation: 5.0,
            title:   TextButton(
              child: const Text(
                  "Enter vehicle number to search .. ",
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: 15
                  ))
              , onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  CloudFirestoreSearch()),
              );
            },
            ),
            backgroundColor: Colors.white70,
            actions:  [
              IconButton(
                icon:(const Icon(Icons.search)),
                color: Colors.black38,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  CloudFirestoreSearch()),
                  );
                },
              ),
            ],
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
                top: Radius.circular(15),
              ),
            )
        ),
        body: Padding(
          padding: const EdgeInsets.only(
              top: 8, bottom: 8, left: 4, right: 4),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(blurRadius: 6.0, color: Colors.blueGrey)
              ],
              color: Colors.blueAccent.withOpacity(0.8),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(15),
                top: Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                children: List.generate(modalList.length, (index) {
                  return TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  VehicleListPage(fromPage: 'modal',fromWhere: modalList[index].toString())),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(10),
                            top: Radius.circular(10),
                          ),
                          color: Colors.white70,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 10),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceEvenly,
                              children: [
                                Center(child: Text(modalList[index])),
                                const Padding(
                                  padding: EdgeInsets.only(top: 6, bottom: 6),
                                  child: Center(
                                      child: Icon(Icons.electric_car, size: 40,)),
                                ),

                                Center(child:
                                StreamBuilder<QuerySnapshot>(
                                  stream: _vehicleStream,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.hasError) {
                                      return Text('Something went wrong');
                                    }

                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Text("Loading...");
                                    }
                                    int Count = 0;
                                    snapshot.data!.docs.map((
                                        DocumentSnapshot document) {
                                      Map<String, dynamic> data = document
                                          .data()! as Map<String, dynamic>;
                                      if (data['modal'] ==
                                          modalList[index]) {
                                        Count++;
                                      }
                                    }).toList();
                                    return Center(
                                        child: Text(
                                            'Vehicles : ' + Count.toString())
                                    );
                                  },
                                )
                                ),
                                Center(child:
                                StreamBuilder<QuerySnapshot>(
                                  stream: _vehicleStream,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.hasError) {
                                      return Text('Something went wrong');
                                    }

                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Text("Loading...");
                                    }
                                    int runningCount = 0;
                                    snapshot.data!.docs.map((
                                        DocumentSnapshot document) {
                                      Map<String, dynamic> data = document
                                          .data()! as Map<String, dynamic>;
                                      if (data['state'] == 'Running' &&
                                          data['modal'] ==
                                              modalList[index]) {
                                        runningCount++;
                                      }
                                    }).toList();
                                    return Center(
                                        child:
                                        Text('Running : ' +
                                            runningCount.toString(),
                                          style: TextStyle(
                                              color: Colors.green),)
                                    );
                                  },
                                )),
                                Center(child:
                                StreamBuilder<QuerySnapshot>(
                                  stream: _vehicleStream,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.hasError) {
                                      return Text('Something went wrong');
                                    }

                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Text("Loading...");
                                    }
                                    int idealCount = 0;
                                    snapshot.data!.docs.map((
                                        DocumentSnapshot document) {
                                      Map<String, dynamic> data = document
                                          .data()! as Map<String, dynamic>;
                                      if (data['state'] == 'Ideal' &&
                                          data['modal'] ==
                                              modalList[index]) {
                                        idealCount++;
                                      }
                                    }).toList();
                                    return Center(
                                        child:
                                        Text(
                                          'Ideal : ' + idealCount.toString(),
                                          style: const TextStyle(
                                              color: Colors.orange),));
                                  },
                                )),
                                Center(child:
                                StreamBuilder<QuerySnapshot>(
                                  stream: _vehicleStream,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.hasError) {
                                      return Text('Something went wrong');
                                    }

                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Text("Loading...");
                                    }
                                    int repairCount = 0;
                                    snapshot.data!.docs.map((
                                        DocumentSnapshot document) {
                                      Map<String, dynamic> data = document
                                          .data()! as Map<String, dynamic>;
                                      if (data['state'] == 'Rapier' &&
                                          data['modal'] ==
                                              modalList[index]) {
                                        repairCount++;
                                      }
                                    }).toList();
                                    return Center(
                                        child:
                                        Text('Rapier : ' +
                                            repairCount.toString(),
                                          style: const TextStyle(
                                              color: Colors.red),)
                                    );
                                  },
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
                ),
              ),
            ),
          ),
        ),
      ));
  }
}


class MySearchDelegate extends SearchDelegate {
  List<String> searchResult = [
    '1213',
    '2e432',
    '3qweqw',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) =>
      [
        IconButton(onPressed: () {
          query.isEmpty ? close(context, null) : query = '';
        },
          icon: const Icon(Icons.clear),
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) =>
      IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) =>
      Center(
        child: Text(
          query,
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResult.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
          },
        );
      },);
  }
}