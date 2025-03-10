import 'package:carconnect/Constants/auth_api.dart';
import 'package:carconnect/Pages/booked.dart';
import 'package:carconnect/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class RequestContainer extends StatefulWidget {
  final User user;
  final String userlocation;
  final String userDestination;
  final String username;
  final String contact_number;
  const RequestContainer({
    super.key,
    required this.user,
    required this.userlocation,
    required this.userDestination,
    required this.username,
    required this.contact_number,
  });

  @override
  State<RequestContainer> createState() => _RequestContainerState();
}

class _RequestContainerState extends State<RequestContainer> {
  late String userlocation;
  late String userDestination;
  late String contact_number;
  late String username;
  User? user;

  Future<void> hookUser(String username, int pk) async {
    final url = Uri.parse("$api/api/hookUser/");
    Map body = {
      "username": username,
      "rider": (pk).toString(),
    };
    var res = await http.post(url, body: body);
    print(res.body);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Confirmation(
              user: widget.user,
              contact_number: widget.contact_number,
              username: widget.username,
            )));
  }

  @override
  void initState() {
    super.initState();
    // Initialize the fields with the values passed from the widget
    userlocation = widget.userlocation;
    userDestination = widget.userDestination;
    user = widget.user;
    username = widget.username;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('User: $username'),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Start Location : $userlocation',
                    softWrap: true,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 300,
                    child: Text(
                      'Destination : $userDestination',
                      overflow: TextOverflow.clip,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              ElevatedButton(
                child: const Text('Book This Ride'),
                onPressed: () => {hookUser(username, widget.user.id!)},
              )
            ],
          ),
        ),
      ),
    );
  }
}
