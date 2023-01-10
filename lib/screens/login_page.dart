import 'package:deliveryapp/widget/custom_btn.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:deliveryapp/widget/custom_input.dart';
import 'package:deliveryapp/screens/register_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  top: 24.0,
                ),
                child: Text("Feeling Hungry? \nLogin to the Account",
                textAlign: TextAlign.center,
                style: Constants.boldHeading,),
              ),
              Column(
                children: [
                  CustomInput(
                    hintText: "Email",
                  ),
                  CustomInput(
                    hintText: "Password",
                  ),
                  CustomBtn(
                    text: "Login",
                    onPressed: (){
                      print("Clicked the Login Button");
                    },
                    outlineBtn: false,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 8.0,
                ),
                child: CustomBtn(
                  text: "Create New Account",
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()
                        ),
                    );
                  },
                  outlineBtn: true,
                ),
              ),
            ],
          ),
        ),
      )
    );;
  }
}
