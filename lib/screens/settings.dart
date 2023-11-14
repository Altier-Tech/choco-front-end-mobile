import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool darkMode = false;
  bool blockPopups = true;
  double textSize = 16.0;
  List<double> textSizeOptions = [12.0, 16.0, 20.0, 24.0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Browser Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              title: Text('Dark Mode'),
              value: darkMode,
              onChanged: (value) {
                setState(() {
                  darkMode = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Block Pop-ups'),
              value: blockPopups,
              onChanged: (value) {
                setState(() {
                  blockPopups = value;
                });
              },
            ),
            Row(
              children: [
                Text('Text Size:'),
                SizedBox(width: 10),
                DropdownButton<double>(
                  value: textSize,
                  onChanged: (value) {
                    setState(() {
                      textSize = value!;
                    });
                  },
                  items: textSizeOptions.map((double size) {
                    return DropdownMenuItem<double>(
                      value: size,
                      child: Text('$size'),
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
