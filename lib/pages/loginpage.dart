import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _mykey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_mykey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, "/homepage");
      setState(() {
        changeButton = false;
      });
    }
  }

  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Form(
        key: _mykey,
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_image.png",
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Hello $name",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter Username", labelText: "Username"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username can't be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter Password", labelText: "Password"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password can't be empty";
                      } else if (value.length < 6) {
                        return "Password must contain atleast 6 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Material(
                      color: Colors.deepPurple,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 8),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          height: 50,
                          width: changeButton ? 50 : 150,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  textScaleFactor: 1.2,
                                ),
                        ),
                      )
                      // ElevatedButton(
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, "/homepage");
                      //   },
                      //   child: Text("SignIn"),
                      //   style: TextButton.styleFrom(minimumSize: Size(130, 50)),
                      // ),
                      )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
