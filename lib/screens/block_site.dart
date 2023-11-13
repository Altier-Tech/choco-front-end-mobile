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
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _blockSite,
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