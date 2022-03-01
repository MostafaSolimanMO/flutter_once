import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_once/flutter_once.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String currentValue = 'Hello World';

  @override
  void initState() {
    Once.runOnce(
      'my-app-widget',
      callback: () => set('Once Started'),
    );
    super.initState();
  }

  void set(String newOnce) {
    setState(
      () {
        currentValue = newOnce + ' ${Random().nextInt(100)}';
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Once Made with ❤️'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OnceWidget.showOnEveryNewVersion(
                  builder: () {
                    return const Text('Hey, It new app version, Smile!');
                  },
                  fallback: () {
                    return const Text('Welcome back');
                  },
                ),
                OnceWidget.showOnce(
                  'onceWidget',
                  builder: () {
                    return const Text('Hey, I am the once widget');
                  },
                  fallback: () {
                    return const Text('I am not the one widget');
                  },
                ),
                OnceWidget.showEvery12Hours(
                  'every12Hours',
                  builder: () {
                    return const Text('Hey, I am the every12Hours widget');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
