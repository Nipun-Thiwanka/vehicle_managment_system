import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vehicle_managment_system/Vehicle_modal.dart';
import 'package:vehicle_managment_system/dashboard.dart';

class EditVehiclePage extends StatefulWidget {
  final Vehicle vehicle;
  EditVehiclePage({Key? key, required this.vehicle}) : super(key: key);
  @override
  _EditVehiclePageState createState() {
    return _EditVehiclePageState(vehicle);
  }
}

class _EditVehiclePageState extends State<EditVehiclePage> {
  final Vehicle vehicle;
  _EditVehiclePageState(this.vehicle);

  final _formKey = GlobalKey<FormState>();
  List<String> _divisions = [
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
            'Edit vehicle details',
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
                      initialValue: vehicle.vehicleNumber,
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
                      initialValue: vehicle.departmentNumber,
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
                      initialValue: vehicle.registrationNumber,
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
                          value: vehicle.division,
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
                          value: vehicle.modal,
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
                          value: vehicle.type,
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
                          value: vehicle.state,
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
                      initialValue: vehicle.oparatorName,
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
                      initialValue: vehicle.oparatingWeight,
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
                      initialValue: vehicle.consumption,
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
                      initialValue: vehicle.remark,
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
                            Vehicle data = Vehicle(
                                vehicleNumber: _VehicleNumber == ""
                                    ? vehicle.vehicleNumber
                                    : _VehicleNumber,
                                departmentNumber: _DepartmentNumber == ""
                                    ? vehicle.departmentNumber
                                    : _DepartmentNumber,
                                registrationNumber: _RegistrationNumber == ""
                                    ? vehicle.registrationNumber
                                    : _RegistrationNumber,
                                division: _Division == ""
                                    ? vehicle.division
                                    : _Division,
                                modal: _Modal == "" ? vehicle.modal : _Modal,
                                type: _Type == "" ? vehicle.type : _Type,
                                state: _State == "" ? vehicle.state : _State,
                                oparatorName: _OParatorName == ""
                                    ? vehicle.oparatorName
                                    : _OParatorName,
                                oparatingWeight: _OparatingWeight == ""
                                    ? vehicle.oparatingWeight
                                    : _OparatingWeight,
                                consumption: _Consumption == ""
                                    ? vehicle.consumption
                                    : _Consumption,
                                remark: _Remark == ""
                                    ? vehicle.departmentNumber
                                    : _Remark,
                                id: vehicle.id);
                            updateUser(data);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminPage()),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Success ')),
                          );
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

Future<void> updateUser(Vehicle vehicle) {
  CollectionReference users = FirebaseFirestore.instance.collection('vehicles');
  final json = {
    'id': vehicle.id,
    'vehicleNumber': vehicle.vehicleNumber,
    'departmentNumber': vehicle.departmentNumber,
    'registrationNumber': vehicle.registrationNumber,
    'division': vehicle.division,
    'modal': vehicle.modal,
    'type': vehicle.type,
    'state': vehicle.state,
    'oparatorName': vehicle.oparatorName,
    'oparationWeight': vehicle.oparatingWeight,
    'consumption': vehicle.consumption,
    'remark': vehicle.remark,
  };
  return users
      .doc(vehicle.id)
      .update(json)
      .then((value) => print("User Updated"))
      .catchError((error) => print("Failed to update user: $error"));
}
