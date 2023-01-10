import 'package:deliveryapp/constants.dart';
import 'package:deliveryapp/widget/custom_btn.dart';
import 'package:deliveryapp/widget/custom_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});


  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //Build an alert dialog to display some errors
  Future<void> _alertDialogBuilder() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
      return AlertDialog(
        title: Text("Error"),
        content: Container (
          child: Text("Just Some Random text for now"),
        ),
        actions: [
          TextButton(
            child: Text("Close Dialog"),
            onPressed: () {
              Navigator.pop(context);
            }
          )
        ],
      );
    });
  }

  //Create a new user account
  Future<String?> _createAccount() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _registerEmail, password: _registerPassword);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return'The Password Provided is too weak.';
      } else if (e.code == "Email Already in Use") {
        return "The Account Already Exist for that Email.";
      }
      return e.message;
    } catch (e) {return e.toString();}

  }
}

  //Form Input Field Values
  String _registerEmail = "";
  String _registerPassword = "";

  // Focus Node for input fields
  FocusNode? _passwordFocusNode;

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode = FocusNode();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: Text("Need Tastey Foods? \n Create A New Account",
                    textAlign: TextAlign.center,
                    style: Constants.boldHeading,),
                ),
                Column(
                  children: [
                    CustomInput(
                      hintText: "Email",
                      onChanged: (value){
                        _registerEmail = value;
                      },
                      onSubmitted: (value){
                        _passwordFocusNode?.requestFocus();
                      },

                    ),
                    CustomInput(
                      hintText: "Password",
                      onChanged: (value){
                        _registerPassword = value;
                      },
                      focusNode: _passwordFocusNode,
                      isPasswordField: true,
                    ),
                    CustomBtn(
                      text: "Register",
                      onPressed: (){
                        _alertDialogBuilder();
                        }, outlineBtn: false
                    )

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8.0,
                  ),
                  child: CustomBtn(
                    text: "Back to Login",
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    outlineBtn: true,
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}


