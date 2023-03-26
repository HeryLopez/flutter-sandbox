import 'package:flutter/material.dart';
import 'package:personal_site_template/infoblock.dart';
import 'package:personal_site_template/photo.dart';

import 'contact.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 390,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Contact(
                          messageText: "Do you have any idea to work together?",
                          contactButtonText: "Contact me 👋",
                          onContactPressed: () {
                            print("Contact");
                          },
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            InfoBlock(title: "2+", body: "Years Experience"),
                            SizedBox(width: 16),
                            InfoBlock(title: "2+", body: "Years Experience"),
                            SizedBox(width: 16),
                            InfoBlock(title: "2+", body: "Years Experience"),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Photo()
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  InfoBlock(title: "2+", body: "Years Experience"),
                  SizedBox(width: 16),
                  InfoBlock(title: "2+", body: "Years Experience"),
                  SizedBox(width: 16),
                  InfoBlock(title: "2+", body: "Years Experience"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
