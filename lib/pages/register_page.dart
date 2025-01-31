import 'package:flutter/material.dart';
import 'package:socialmedia/components/my_button.dart';
import 'package:socialmedia/components/my_input_box.dart';
import 'package:socialmedia/services/auth/auth_service.dart';

class RegisterPage extends StatelessWidget {
  void Function()? toggleRegistered;

  RegisterPage({super.key, required this.toggleRegistered});

  @override
  Widget build(BuildContext context) {
    //controllers
    final TextEditingController emailController = TextEditingController();
    final TextEditingController pwController = TextEditingController();
    final TextEditingController confirmPwController = TextEditingController();

    //signIn function
    void signUp(BuildContext context) async {
      //get auth service
      AuthService authService = AuthService();

      //signIn
      try {
        if (pwController.text != confirmPwController.text) {
          return showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Passwords do not match"),
            ),
          );
        } else {
          await authService.register(emailController.text, pwController.text);
        }
      } catch (e) {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //logo
                Icon(Icons.person, size: 100),

                SizedBox(
                  height: 25,
                ),

                //name
                Text("S O C I A L", style: TextStyle(fontSize: 30)),

                SizedBox(
                  height: 25,
                ),

                //email
                MyInputBox(
                  controller: emailController,
                  obscureText: false,
                  hintText: "Email",
                ),

                SizedBox(
                  height: 10,
                ),

                //password
                MyInputBox(
                  controller: pwController,
                  obscureText: true,
                  hintText: "Password",
                ),
                SizedBox(
                  height: 10,
                ),
                MyInputBox(
                  controller: confirmPwController,
                  obscureText: true,
                  hintText: "Confirm Password",
                ),

                SizedBox(
                  height: 10,
                ),

                //sign in button
                MyButton(
                  text: "Sign Up",
                  onTap: () => signUp(context),
                ),
                SizedBox(
                  height: 25,
                ),

                //register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already registered?"),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: toggleRegistered,
                      child: Text(
                        "Sign In",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
