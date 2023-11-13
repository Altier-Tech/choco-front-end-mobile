import 'package:flutter/material.dart';

class IntelligentService extends StatelessWidget {
  const IntelligentService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Intelligent Service"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ContainerWithSwitch(text: "Dom Filtering"),
            SizedBox(height: 10),
            ContainerWithSwitch(text: "Dom Search Engine Alteration"),
          ],
        ),
      ),
    );
  }
}

class ContainerWithSwitch extends StatefulWidget {
  final String text;

  const ContainerWithSwitch({Key? key, required this.text}) : super(key: key);

  @override
  _ContainerWithSwitchState createState() => _ContainerWithSwitchState();
}

class _ContainerWithSwitchState extends State<ContainerWithSwitch> {
  bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        width: 350,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.text),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Switch(
                value: isSwitchOn,
                onChanged: (value) {
                  setState(() {
                    isSwitchOn = value;
                  });
                },
                activeColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
