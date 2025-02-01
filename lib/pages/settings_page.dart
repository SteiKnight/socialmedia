import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialmedia/themes/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("S E T T I N G S"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Dark Mode"),
                  CupertinoSwitch(
                      value: Provider.of<ThemeProvider>(
                        context,
                        listen: false,
                      ).isDarkMode,
                      onChanged: (value) {
                        Provider.of<ThemeProvider>(
                          context,
                          listen: false,
                        ).toggleTheme();
                      })
                ],
              ),
            ),
          ],
        ));
  }
}
