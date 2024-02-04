import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:assignment_app/config/themes/theme.dart';
import 'package:assignment_app/pages/music_library/music_library.dart';
import 'package:assignment_app/pages/temple_history/temple_history.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  AssetsAudioPlayer.setupNotificationsOpenAction((notification) {
    return true;
  });
  runApp(const MyApp());
}

bool darkThemeMode = false;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ziti Assignment"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  Get.changeTheme(
                    Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
                  );
                });
              },
              icon: Icon(Get.isDarkMode ? Icons.dark_mode : Icons.sunny))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TempleHistory()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: const Text(
                  "Temple History",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            FilledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MusicLibrary()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: const Text(
                  "Music Library",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
