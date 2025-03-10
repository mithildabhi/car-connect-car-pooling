import 'dart:convert';

import 'package:carconnect/Constants/auth_api.dart';
import 'package:carconnect/Constants/getloc.dart';
import 'package:carconnect/models/models.dart';
import 'package:carconnect/models/request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class AvailableRides extends StatefulWidget {
  final User user;
  const AvailableRides({super.key, required this.user});

  @override
  // ignore: no_logic_in_create_state, unnecessary_this
  State<AvailableRides> createState() => _AvailableRidesState();
}

class _AvailableRidesState extends State<AvailableRides> {
  User? user;
  late String latitude;
  late String longitude;
  String locationMessage = "New available";
  List<Request> myreq = [];
  bool isLoading = true;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();

  Future<void> launchMapsDirections(destinationController) async {
    final String url =
        'https://www.mapquestapi.com/geocoding/v1/address?key=kBEVbZm3gsQjxw9AxkAwjUbICySUacls&location=${destinationController.text}';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      if (data['results'] != null && data['results'].isNotEmpty) {
        final locationData = data['results'][0]['locations'][0];

        // Retrieve latitude and longitude as strings
        latitude = locationData['latLng']['lat'].toString();
        longitude = locationData['latLng']['lng'].toString();

        setState(() {
          // Update the UI to display the latitude and longitude
        });
      } else {
        print('No location found');
      }
    } else {
      print(
          'Failed to geocode destination. Status code: ${response.statusCode}');
    }
    print("long : ${long.toString()}  lat : ${lat.toString()}");
    final urls = 'https://www.google.com/maps/dir/?api=1'
        '&origin=$lat,$long'
        '&destination=$latitude,$longitude';

    // ignore: deprecated_member_use
    if (await canLaunch(urls)) {
      // ignore: deprecated_member_use
      await launch(urls);
    } else {
      throw 'Could not launch $urls';
    }
  }

  Future<void> availARide() async {
    final url = Uri.parse("$api/api/createreq/");
    final response = await http.post(
      url,
      body: {
        'user': widget.user.username,
        'presenet_loc_longitude': long.toString(),
        'presenet_loc_latitude': lat.toString(),
        'destination_address': destinationController.text,
      },
    );

    if (response.statusCode == 200) {
      launchMapsDirections(destinationController);
      print('Request made successfully');
    } else {
      // Request failed
      print('Failed to make request. Status code: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    liveLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueGrey,
      body: SizedBox(
        width: double.infinity,
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
            const SizedBox(height: 40),
            SizedBox(
              child: Image.asset(
                "assets/images/give.jpg",
                width: 257,
                height: 257,
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.lighten,
              ),
            ),
            const SizedBox(
              height: 120,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                controller: destinationController,
                obscureText: false,
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    labelText: 'Destination Location',
                    hintStyle: TextStyle(
                        textBaseline: TextBaseline.alphabetic,
                        color: Color.fromARGB(255, 134, 85, 85))),
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            ElevatedButton(
              onPressed: availARide,
              child: const Text("Avail A Ride"),
            )
          ],
        )),
      ),
    );
  }
}
