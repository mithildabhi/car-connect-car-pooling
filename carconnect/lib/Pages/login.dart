import 'package:carconnect/Constants/auth_api.dart';
import 'package:carconnect/Pages/services.dart';
import 'package:carconnect/models/models.dart';
import 'package:carconnect/models/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // logIn(
  //     {String username = "",
  //     String password = "",
  //     required BuildContext context}) async {
  //   try {
  //     http.Response response = await http.post(Uri.parse("${api}api/signin/"),
  //         headers: <String, String>{
  //           'content-type': 'application/json; charset=utf-8'
  //         },
  //         body: jsonEncode(
  //             <String, dynamic>{'username': username, 'password': password}));
  //     if (response.statusCode == 201) {
  //     } else {
  //       print(response.statusCode);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 140,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                  "Please Enter You LogIn Details...",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.acme(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontSize: 30)),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              // UserName
              SizedBox(
                width: 300,
                child: TextField(
                  controller: usernameController,
                  obscureText: false,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: 'UserName',
                      hintStyle: TextStyle(
                          textBaseline: TextBaseline.alphabetic,
                          color: Color.fromARGB(255, 134, 85, 85))),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              // Password
              SizedBox(
                width: 300,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: 'Password',
                      hintStyle: TextStyle(
                          textBaseline: TextBaseline.alphabetic,
                          color: Color.fromARGB(255, 134, 85, 85))),
                ),
              ),
              // Button
              const SizedBox(
                height: 50,
              ),
              Container(
                width: 300,
                height: 45,
                padding: const EdgeInsets.only(left: 60),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: GestureDetector(
                  onTap: () async {
                    var authRes = await userAuth(usernameController.text,
                        passwordController.text, context);
                    if (authRes.runtimeType == String) {
                      // ignore: use_build_context_synchronously
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: Container(
                                alignment: Alignment.center,
                                height: 200,
                                width: 250,
                                decoration: const BoxDecoration(),
                                child: Text(authRes),
                              ),
                            );
                          });
                    } else if (authRes.runtimeType == User) {
                      User user = authRes;
                      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                      context.read<UserCubit>().emit(user);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Services(
                                user: user,
                              )));
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.account_circle,
                          color: Colors.black,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          'LogIn',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: GoogleFonts.nunito().fontFamily,
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
