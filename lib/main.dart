import 'package:auto_updater/auto_updater.dart';
import 'package:flutter/material.dart';

void main() async {
  // asdinqweio dqeow
  // Must add this line to ensure all necessary Flutter bindings are initialized.
  WidgetsFlutterBinding.ensureInitialized();

  // Set the feed URL to your appcast.xml hosted on GitHub
  //https://github.com/Assem9/updater_test/blob/main/windows_releases/appcast.xml
  String feedURL = 'https://raw.githubusercontent.com/Assem9/updater_test/main/windows_releases/appcast.xml';

  // Initialize the auto updater with the feed URL
  await autoUpdater.setFeedURL(feedURL);
  // Optionally, set a scheduled check interval (in seconds)
  // For example, check every hour: 3600 seconds
  await autoUpdater.setScheduledCheckInterval(3600);

  // Manually check for updates
  await autoUpdater.checkForUpdates();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Auto Updater Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              // Manually trigger the update check when the button is pressed
              await autoUpdater.checkForUpdates();
            },
            child: Text('Check for Updates'),
          ),
        ),
      ),
    );
  }
}
