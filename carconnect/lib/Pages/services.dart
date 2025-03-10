import "package:carconnect/Constants/getloc.dart";
import "package:carconnect/Pages/request.dart";
import "package:carconnect/Pages/rides.dart";
import "package:carconnect/models/models.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:google_fonts/google_fonts.dart";

class Services extends StatefulWidget {
  final User user;
  const Services({super.key, required this.user});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  User? user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation().then((value) {
      lat = value.latitude;
      long = value.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 70,
                child: Text(
                  "Welcome  ${widget.user.name}",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.acme(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontSize: 30)),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white70,
                    ),
                    child: const Text("Get A Ride"),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Rides(
                                user: widget.user,
                              )));
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Center(
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white70,
                    ),
                    child: const Text("Give A Ride"),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              AvailableRides(user: widget.user)));
                    },
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
