import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List<Widget> screens = [
    const ProfileWidget(),
    const LikeWidget(),
    const NewsPaperWidget(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: NavigationBar(
          indicatorColor: Colors.lime,
          selectedIndex: currentIndex,
          onDestinationSelected: (index) {
            currentIndex = index;
            setState(() {});
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.newspaper),
              label: "News",
            ),
            NavigationDestination(
              icon: Icon(Icons.heart_broken),
              label: "Likes",
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Colors.lime,
          title: const Text("MyApp"),
        ),
        body: screens[currentIndex],
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Profile",
              style: TextStyle(fontSize: 35),
            ),
          ),
          Icon(Icons.person, size: 60),
          Text(
            "Max Mustermann",
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }
}

class LikeWidget extends StatelessWidget {
  const LikeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Likes",
              style: TextStyle(fontSize: 40),
            ),
          ),
          Text(
            "Hier findest du deine gelikten Nachrichten.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 23),
          ),
        ],
      ),
    );
  }
}

class NewsPaperWidget extends StatelessWidget {
  const NewsPaperWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("News",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          Icon(Icons.newspaper, size: 50),
        ],
      ),
    );
  }
}
