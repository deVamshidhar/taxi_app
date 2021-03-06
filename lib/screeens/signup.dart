import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi_app/controllers/authentications.dart';
import 'package:taxi_app/misc.dart';
import 'package:taxi_app/screeens/home_screen.dart';
import 'package:taxi_app/screeens/login.dart';
import 'package:taxi_app/widgets/custom_logo_button.dart';
import 'package:taxi_app/widgets/custom_text_field.dart';

class SignUp extends StatelessWidget {
  final emailController = TextEditingController();
  final password1Controller = TextEditingController();
  final password2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Align(
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView(
            shrinkWrap: true,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Icon(
                  Icons.pin_drop_rounded,
                  size: 100,
                  color: Colors.indigo[900],
                ),
              ),
              Center(
                child: Text(
                  "Fijo Taxi",
                  style: GoogleFonts.lato(
                      color: Colors.indigo[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Create your account",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
              CustomTextField(
                header: "Email",
                controller: emailController,
              ),
              CustomTextField(
                header: "Password",
                controller: password1Controller,
              ),
              CustomTextField(
                header: "Confirm Password",
                controller: password2Controller,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        child: RaisedButton(
                            onPressed: () async {
                              //  authentications.signup("vamsubala@gmail.com","vamsi199");
                              // It will print signed suceessfully and uid is balabla
                              print("email ${emailController.text}");
                              print("password ${password1Controller.text}");
                              // int res = Authentications().signup(emailC, password)
                              int res = await Authentications().signup(
                                  emailController.text.trim(),
                                  password1Controller.text.trim());
                              if (res == 0) {
                                Navigator.push(
                                  (context),
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ),
                                );
                              } else {
                                print('res is $res');
                              }
                            },
                            child: Text("Sign Up",
                                style:
                                    GoogleFonts.lato(color: Colors.grey[100])),
                            color: Colors.indigo[900]),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "- Or Sign up with -",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Row(
                  children: [
                    const CustomLogoButton(
                        icon: LineAwesomeIcons.google_logo, color: Colors.red),
                    CustomLogoButton(
                      icon: LineAwesomeIcons.facebook,
                      color: Colors.blue[900],
                    ),
                    const CustomLogoButton(
                      icon: LineAwesomeIcons.twitter,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement((context),
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Already a member?  ",
                      style: TextStyle(color: Colors.grey),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Sign in",
                          style: TextStyle(
                              fontSize: 17,
                              decoration: TextDecoration.underline,
                              color: Colors.indigo),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
