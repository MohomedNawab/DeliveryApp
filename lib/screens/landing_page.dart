import 'package:deliveryapp/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../constants.dart';
import 'login_page.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // if snapshot has error
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Error: ${snapshot.error}"),
            ),
          );
        }
        // Connection Initialized - Firebase App is running
        if (snapshot.connectionState == ConnectionState.done) {
          // StreamBuilder can check the login state live
          return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, streamSnapshot){
                // if streamSnapshot has error
                if (streamSnapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child: Text("Error: ${streamSnapshot.error}"),
                    ),
                  );
                }
                //Connection state active - Do the user login check inside the if statement
                if(streamSnapshot.connectionState == ConnectionState.active){

                  // Get the user
                  User? _user = streamSnapshot.data;

                  //if the user is null, we're not logged in
                  if(_user == null){
                    // user not logged in , head to login page
                    return LoginPage();
                  } else {
                    //The use is logged in, head to HomePage
                    return HomePage();
                  }
                }
                // checking the auth state - Loading
                return Scaffold(
                  body: Center(
                    child: Text("Checking Authentication...",
                      style: Constants.regularHeading,
                    ),
                  ),
                );
              });
        }
        // Connecting to Firebase - Loading
        return Scaffold(
          body: Center(
            child: Text("Initializing App...",
            style: Constants.regularHeading,
            ),
          ),
        );
      },
    );
  }
}
