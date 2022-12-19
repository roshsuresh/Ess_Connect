import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map> availableHobbies = [
    {"name": "Foobball", "isChecked": false, "isEnabled": false},
    {"name": "Baseball", "isChecked": false, "isEnabled": false},
    {"name": "Video Games", "isChecked": false, "isEnabled": false},
    {"name": "Readding Books", "isChecked": false, "isEnabled": false},
    {"name": "Surfling The Internet", "isChecked": false, "isEnabled": false}
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Choose your hobbies:',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              Column(
                  children: availableHobbies.map((hobby) {
                return CheckboxListTile(
                    value: hobby["isChecked"],
                    title: Text(hobby["name"]),
                    onChanged: (newValue) {
                      setState(() {
                        if (hobby["isEnabled"] == false) {
                          hobby["isChecked"] = newValue;
                        }
                      });
                    });
              }).toList()),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              Wrap(
                children: availableHobbies.map((hobby) {
                  if (hobby["isChecked"] == true) {
                    return Card(
                      elevation: 3,
                      color: Colors.amber,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(hobby["name"]),
                      ),
                    );
                  }

                  return Container();
                }).toList(),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
