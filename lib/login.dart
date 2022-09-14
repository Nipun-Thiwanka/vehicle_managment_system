import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:vehicle_managment_system/dashboard.dart';
import 'main.dart';
import 'addVehicle.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _text = TextEditingController();
  bool _validate = false;
  bool _isValidEmail = false;
  String _password = '';
  String _email = '';

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.withOpacity(0.3),
          title: const Center(
            child: Text(
              'Login',
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              left: 0,
              width: screenWidth,
              height: screenHeight / 2,
              child: Container(
                width: screenWidth,
                height: screenHeight / 2,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                        Colors.white,
                        BlendMode.exclusion,
                      ),
                      image: AssetImage("assets/images/login_background.png"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(
                  top: 15, bottom: 30, left: 15, right: 15),
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                      child: Text(
                    'Welcome back !',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('E-mail ',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: TextField(
                              decoration: InputDecoration(
                                  errorText: _validate
                                      ? 'Credintials are not matched.'
                                      : !_isValidEmail
                                          ? 'Enter valid email'
                                          : null,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  fillColor: Colors.white,
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0),
                                  ),
                                  labelText: 'E-mail',
                                  labelStyle:
                                      const TextStyle(color: Colors.white)),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15),
                              onChanged: (value) => {
                                    setState(() {
                                      _isValidEmail =
                                          EmailValidator.validate(value);
                                      _email = value;
                                    }),
                                  }),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text('Password',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  errorText: _validate
                                      ? 'Credintials are not matched.'
                                      : null,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.0),
                                  ),
                                  labelText: 'Password',
                                  labelStyle:
                                      const TextStyle(color: Colors.white)),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15),
                              onChanged: (value) => {
                                    setState(() {
                                      _password = value;
                                    }),
                                  }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            width: screenWidth,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 2,
                                primary: Colors.red, // background
                                onPrimary: Colors.white, // foreground
                              ),
                              onPressed: () {
                                setState(() {
                                  _text.text.isEmpty
                                      ? _validate = true
                                      : _validate = false;
                                });
                                if (_validate) {
                                  if (_password == 'admin' &&
                                      _email == 'admin@email.com') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AdminPage()),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Invalid e-mail or password !')),
                                    );
                                  }
                                }
                              },
                              child: const Text('Sign in'),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
