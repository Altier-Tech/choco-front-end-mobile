import 'package:flutter/material.dart';

class SiteBlockerScreen extends StatefulWidget {
  @override
  _SiteBlockerScreenState createState() => _SiteBlockerScreenState();
}

class _SiteBlockerScreenState extends State<SiteBlockerScreen> {
  TextEditingController _webAddressController = TextEditingController();
  List<String> blockedSites = [];

  void _blockSite() {
    String webAddress = _webAddressController.text.trim();
    if (webAddress.isNotEmpty && !blockedSites.contains(webAddress)) {
      setState(() {
        blockedSites.add(webAddress);
        _webAddressController.clear();
      });
    }
  }

  void _deleteSite(int index) {
    setState(() {
      blockedSites.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Site Blocker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _webAddressController,
                    decoration: InputDecoration(
                      hintText: 'Enter web address',
                      filled: true, // Set to true to enable background color
                      fillColor: Colors.grey[200], // Set your desired background color
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20), // Set border radius
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _blockSite,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Set your desired button background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Set button border radius
                    ),
                    minimumSize: Size(120, 60), // Set your desired button height
                  ),
                  child: Text('Block'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Blocked Sites:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: blockedSites.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(blockedSites[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteSite(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}