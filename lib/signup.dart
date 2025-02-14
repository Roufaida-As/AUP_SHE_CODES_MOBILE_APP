// import 'dart:js'; // Removed incorrect import

import 'package:flutter/material.dart';
import 'package:shecodes/components/button.dart';
import 'package:shecodes/login.dart';
import 'package:shecodes/merchandiser-home-page.dart';
import 'package:shecodes/theme/colors.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
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

    return Scaffold(
      backgroundColor: AppColors.background,
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
                            Text("Sign Up",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.red,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(width: 5),
                            Text(" & Help Shape Smarter",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.text,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(width: 5),
                          ],
                        ),
                        Text("Shelves!",
                            style: TextStyle(
                                fontSize: 18,
                                color: AppColors.red,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
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
                          child: Text('Full name',
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
                            controller: fullnamecontroller,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Field is required";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(12),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: "Enter your name",
                                hintStyle: const TextStyle(
                                    color: AppColors.placeholder, fontSize: 15),
                                prefixIcon: const Icon(
                                  Icons.person_2_outlined,
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
                          child: Text('Phone number',
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
                            controller: phonenumbercontroller,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Field is required";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(12),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: "Enter your phone number",
                                hintStyle: const TextStyle(
                                    color: AppColors.placeholder, fontSize: 15),
                                prefixIcon: const Icon(
                                  Icons.phone_outlined,
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
                  const Text("Already have an account?",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.text,
                      )),
                  const SizedBox(width: 5),
                  //THE BUTTON IS NOT WORKING HERE
                  GestureDetector(
                      onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const LoginPage()))
                          },
                      child: const Text("Login",
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.red,
                          )))
                ],
              ),
              const SizedBox(height: 30),
              Button(
                buttonText: "Sign up",
                onTap: () =>
                    {register(context), print("User registered successfully")},
              )
            ],
          ),
        ),
      ),
    );
  }

  void register(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => MissionsScreen()));
  }
}
