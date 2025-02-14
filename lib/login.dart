import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shecodes/components/button.dart';
import 'package:shecodes/costomer-home-page.dart';
import 'package:shecodes/signup.dart';
import 'package:shecodes/theme/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool hidePassword = true;
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController pwcontroller = TextEditingController();
  final TextEditingController fullnamecontroller = TextEditingController();
  final TextEditingController phonenumbercontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void togglePassword() {
      setState(() {
        hidePassword = !hidePassword;
      });
    }

    void login(BuildContext context) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => MissionsScreenCons()));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Image.asset("assets/images/Ramy-Logo.png",
                  width: 130, height: 102.78),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Back to",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.text,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(width: 5),
                            Text("Work? ",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.red,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(width: 5),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Let’s Make Merchandising ",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.text,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Smarter! ",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.red,
                                    fontWeight: FontWeight.bold)),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 8),
                          child: Text('Email',
                              style: TextStyle(
                                  color: AppColors.red,
                                  fontSize: 14,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w500)),
                        ),
                        SizedBox(
                          height: 50,
                          width: 350,
                          child: TextFormField(
                            controller: emailcontroller,
                            validator: (value) {
                              if (!RegExp(
                                      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                  .hasMatch(value!)) {
                                return 'wrong email format';
                              }
                              if (value.isEmpty) {
                                return "Email is required";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(12),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: "Enter your email",
                                hintStyle: const TextStyle(
                                    color: AppColors.placeholder, fontSize: 15),
                                prefixIcon: const Icon(
                                  Icons.email_outlined,
                                  color: AppColors.placeholder,
                                )),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 8),
                          child: Text('Password',
                              style: TextStyle(
                                  color: AppColors.red,
                                  fontSize: 14,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w500)),
                        ),
                        SizedBox(
                          height: 50,
                          width: 350,
                          child: TextFormField(
                            controller: pwcontroller,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "password is required";
                              }
                              return null;
                            },
                            obscureText: hidePassword,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(12),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: "Enter your password",
                                hintStyle: const TextStyle(
                                    color: AppColors.placeholder, fontSize: 15),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      togglePassword();
                                    },
                                    icon: Icon(
                                      hidePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: AppColors.placeholder,
                                    )),
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                  color: AppColors.placeholder,
                                )),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  const Text("Did not have an account?",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.text,
                      )),
                  const SizedBox(width: 5),
                  GestureDetector(
                      onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const signUp()))
                          },
                      child: const Text("Sign up",
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.red,
                          )))
                ],
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 30),
              Button(
                buttonText: "login",
                onTap: () => login(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
