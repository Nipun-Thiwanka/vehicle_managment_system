import 'package:flutter/material.dart';
import 'vehicle.dart';
import 'type.dart';
import 'modal.dart';
import 'division.dart';
import 'login.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// void main() {
//   runApp(new MyApp());
// }
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Department Of Irrigation',
      theme: ThemeData(scaffoldBackgroundColor: Colors.blueAccent),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              'Vehicle management system',
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Vehicle', icon: Icon(Icons.abc)),
                Tab(text: 'Division', icon: Icon(Icons.public)),
                Tab(text: 'Modal', icon: Icon(Icons.electric_car)),
                Tab(text: 'Type', icon: Icon(Icons.agriculture)),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 172, 22, 74),
                        Color.fromARGB(255, 121, 20, 55)
                      ],
                    )),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.person,
                              size: 15,
                              color: Colors.white,
                            ),
                            Text(" Log in",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                          ],
                        ))),
              ),
            ],
            backgroundColor: Colors.transparent,
            elevation: 0.1,
          ),
          body: Container(
            child: TabBarView(
              children: [
                const Center(child: VehiclePage()),
                const Center(child: DivisionPage()),
                Center(child: ModalPage()),
                Center(child: TypePage()),
              ],
            ),
          )));
}
