import 'package:flutter/material.dart';
import 'package:weather_app/Portfolio/main.dart';

import 'package:weather_app/Quiz_App/main.dart';
import 'home_page.dart';
import 'calculator_screen.dart';

class Apps extends StatelessWidget {
  const Apps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Apps"),
        backgroundColor: Colors.teal, // Set the app bar color
      ),
      body: Container(
        color: Colors.black, // Change this to your preferred background color
        child: ListView(
          children: [
            AppListItem(
              appName: "Quiz App",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              icon: Icons.question_answer,
              iconColor: Colors.blue, // Customize the icon color
            ),
            AppListItem(
              appName: "Weather App",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              icon: Icons.cloud,
              iconColor: Colors.orange, // Customize the icon color
            ),
            AppListItem(
              appName: "Calculator App",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalculatorScreen()),
                );
              },
              icon: Icons.calculate,
              iconColor: Colors.green, // Customize the icon color
            ),
            AppListItem(
              appName: "Portfolio",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PortfolioApp()), // Replace with the actual screen class
                );
              },
              icon: Icons.portrait,
              iconColor: Colors.purple, // Customize the icon color
            ),
          ],
        ),
      ),
    );
  }
}

class AppListItem extends StatelessWidget {
  final String appName;
  final Function onTap;
  final IconData icon;
  final Color iconColor;

  const AppListItem({
    required this.appName,
    required this.onTap,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[800], // Customize the card background color
      elevation: 4, // Add elevation for a subtle shadow
      margin: EdgeInsets.all(10), // Add margin for spacing
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor,
          child: Icon(
            icon,
            color: Colors.white, // Customize the icon color
          ),
        ),
        title: Text(
          appName,
          style: TextStyle(color: Colors.white), // Customize the text color
        ),
        onTap: () => onTap(),
      ),
    );
  }
}
