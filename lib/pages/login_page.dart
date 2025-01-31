import 'package:flutter/material.dart';
import 'package:socialmedia/components/my_button.dart';
import 'package:socialmedia/components/my_input_box.dart';
import 'package:socialmedia/services/auth/auth_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    //controllers
    final TextEditingController emailController = TextEditingController();
    final TextEditingController pwController = TextEditingController();

    //signIn function
    void signIn(BuildContext context) async {
      //get auth service
      AuthService authService = AuthService();

      //signIn
      try {
        await authService.signIn(emailController.text, pwController.text);
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
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
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

              //reset password
              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text("Forgot Password?"),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 10,
              ),

              //sign in button
              MyButton(
                text: "Sign In",
                onTap: () => signIn(context),
              ),
              SizedBox(
                height: 25,
              ),

              //register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      //navigate to register page
                    },
                    child: Text(
                      "Register here",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
