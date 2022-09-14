import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vehicle_managment_system/Vehicle_modal.dart';
import 'package:vehicle_managment_system/dashboard.dart';

class AddVehiclePage extends StatefulWidget {
  AddVehiclePage({Key? key}) : super(key: key);
  @override
  _AddVehiclePageState createState() {
    return _AddVehiclePageState();
  }
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _divisions = [
    'Badulla',
    'Ampara',
    'Anuradhapura',
    'Batticaloa',
    'Colombo',
    'Galle',
    'Gampaha',
    'Hambantota',
    'Jaffna',
    'Kalutara',
    'Kandy',
    'Kegalle',
    'Kilinochchi',
    'Kurunegala',
    'Mannar',
    'Matale',
    'Matara',
    'Moneragala',
    'Mullaitivu',
    'Nuwara Eliya',
    'Polonnaruwa',
    'Puttalam',
    'Ratnapura',
    'Trincomalee',
    'Vavuniya'
  ];
  List<String> _state = ['Running', 'Ideal', 'Rapier'];
  List<String> _types = Vehicle.getVehicleTypeList();
  List<String> _modals = Vehicle.getVehicleModalList();
  String _selectedLocation = 'Please choose a location';
  String _VehicleNumber = '';
  String _DepartmentNumber = '';
  String _RegistrationNumber = '';
  String _Division = '';
  String _Modal = '';
  String _Type = '';
  String _State = '';
  String _OParatorName = '';
  String _OparatingWeight = '';
  String _Consumption = '';
  String _Remark = '';

  @override
  Widget build(BuildContext context) {
    // Initialize FlutterFire
    future:
    Firebase.initializeApp();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0.3),
        title: const Center(
          child: Text(
            'Add new vehicle',
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          boxShadow: const [
            BoxShadow(
              blurRadius: 1.0,
              color: Colors.black,
            )
          ],
          color: Colors.blue.withOpacity(0.3),
        ),
        child: Form(
          key: _formKey,
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        fillColor: Colors.white,
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        labelText: 'Vehicle number',
                        labelStyle: const TextStyle(color: Colors.white),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter vehicle number';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _VehicleNumber = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        fillColor: Colors.white,
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        labelText: 'Department number ',
                        labelStyle: const TextStyle(color: Colors.white),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter department number';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _DepartmentNumber = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        fillColor: Colors.white,
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        labelText: 'Registration number ',
                        labelStyle: const TextStyle(color: Colors.white),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter registration number';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _RegistrationNumber = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: screenWidth,
                      child: DropdownButton<String>(
                          items: _divisions.map((String val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: new Text(val),
                            );
                          }).toList(),
                          hint: const Text(
                            "Please choose a division",
                            style: TextStyle(color: Colors.white),
                          ),
                          onChanged: (newVal) {
                            _selectedLocation = newVal.toString();
                            setState(() {
                              _Division = newVal.toString();
                            });
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: screenWidth,
                      child: DropdownButton<String>(
                          items: _modals.map((String val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: new Text(val),
                            );
                          }).toList(),
                          hint: const Text(
                            "Please choose a vehicle modal",
                            style: TextStyle(color: Colors.white),
                          ),
                          onChanged: (newVal) {
                            _selectedLocation = newVal.toString();
                            setState(() {
                              _Modal = newVal.toString();
                            });
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: screenWidth,
                      child: DropdownButton<String>(
                          items: _types.map((String val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: new Text(val),
                            );
                          }).toList(),
                          hint: const Text(
                            "Please choose a vehicle type ",
                            style: TextStyle(color: Colors.white),
                          ),
                          onChanged: (newVal) {
                            _selectedLocation = newVal.toString();
                            setState(() {
                              _Type = newVal.toString();
                            });
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: screenWidth,
                      child: DropdownButton<String>(
                          items: _state.map((String val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: new Text(val),
                            );
                          }).toList(),
                          hint: const Text(
                            "Please choose a vehicle state ",
                            style: TextStyle(color: Colors.white),
                          ),
                          onChanged: (newVal) {
                            _selectedLocation = newVal.toString();
                            setState(() {
                              _State = newVal.toString();
                            });
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        fillColor: Colors.white,
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        labelText: 'Operator Name',
                        labelStyle: const TextStyle(color: Colors.white),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter operator Name :';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _OParatorName = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        fillColor: Colors.white,
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        labelText: 'Operating weight',
                        labelStyle: const TextStyle(color: Colors.white),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter operating weight :';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _OparatingWeight = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        fillColor: Colors.white,
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        labelText: 'Consumption',
                        labelStyle: const TextStyle(color: Colors.white),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter consumption :';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _Consumption = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      minLines: 1, //Normal textInputField will be displayed
                      maxLines:
                          5, // when user presses enter it will adapt to it
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        fillColor: Colors.white,
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        labelText: 'Remark',
                        labelStyle: const TextStyle(color: Colors.white),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Remark :';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _Remark = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: SizedBox(
                      width: screenWidth,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            SaveVehicle(
                                vehicleNumber: _VehicleNumber,
                                departmentNumber: _DepartmentNumber,
                                registrationNumber: _RegistrationNumber,
                                division: _Division,
                                modal: _Modal,
                                type: _Type,
                                state: _State,
                                oparatorName: _OParatorName,
                                oparationWeight: _OparatingWeight,
                                consumption: _Consumption,
                                remark: _Remark);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminPage()),
                            );
                          }
                        },
                        child: const Text('Save'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

Future SaveVehicle(
    {required String vehicleNumber,
    required String departmentNumber,
    required String registrationNumber,
    required String division,
    required String modal,
    required String type,
    required String state,
    required String oparatorName,
    required String oparationWeight,
    required String consumption,
    required String remark}) async {
  final docVehicle = FirebaseFirestore.instance.collection('vehicles').doc();
  final json = {
    'id': docVehicle.id,
    'vehicleNumber': vehicleNumber,
    'departmentNumber': departmentNumber,
    'registrationNumber': registrationNumber,
    'division': division,
    'modal': modal,
    'type': type,
    'state': state,
    'oparatorName': oparatorName,
    'oparationWeight': oparationWeight,
    'consumption': consumption,
    'remark': remark,
  };

  //write data to firebase
  await docVehicle.set(json);
}
