import 'package:firstapplication/config/global.params.dart';
import 'package:flutter/material.dart';

import '../menu/drawer.widget.dart';

class ParameterPage extends StatefulWidget {
  @override
  State<ParameterPage> createState() => _ParameterPageState();
}

class _ParameterPageState extends State<ParameterPage> {
  String mode = "Day"; // Initialize mode as "Day"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Parameter"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Mode",
              style: TextStyle(fontSize: 22),
            ),
          ),
          Column(
            children: [
              ListTile(
                title: const Text("Day"),
                leading: Radio<String>(
                  value: "Day",
                  groupValue: mode,
                  onChanged: (value) {
                    setState(() {
                      mode = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text("Night"),
                leading: Radio<String>(
                  value: "Night",
                  groupValue: mode,
                  onChanged: (value) {
                    setState(() {
                      mode = value!;
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () {
                    _onSaveMode();
                  },
                  child: Text(
                    'Enregistrer',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _onSaveMode() async {
    GlobalParams.themeActuel.setMode(mode);
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    GlobalParams.themeActuel.addListener(() {
      setState(() {});
    });
  }
}
