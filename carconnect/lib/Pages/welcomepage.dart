import 'package:carconnect/Pages/login.dart';
import 'package:carconnect/Pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Container(
          // decoration: const BoxDecoration(
          //     gradient: LinearGradient(
          //   colors: [Colors.purple, Colors.blueAccent],
          //   begin: Alignment.bottomLeft,
          //   end: Alignment.topRight,
          //   stops: [0.4, 0.7],
          //   tileMode: TileMode.repeated,
          // )),
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 140,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    "Welcome To Car Connect",
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
                // Image
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "assets/images/hero.png",
                      width: 408,
                      height: 272,
                      fit: BoxFit.cover,
                      colorBlendMode: BlendMode.lighten,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                // LogIn
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    width: 300,
                    height: 45,
                    padding: const EdgeInsets.only(left: 60),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
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
                ),
                const SizedBox(
                  height: 30,
                ),
                // SignUp
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    width: 300,
                    height: 45,
                    padding: const EdgeInsets.only(left: 60),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SignUp(),
                          ),
                        );
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
                              'SignUp',
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
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
  }
}
