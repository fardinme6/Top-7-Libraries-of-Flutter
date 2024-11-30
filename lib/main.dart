import 'package:flutter/material.dart';

void main() {
  runApp(LibrariesApp());
}

class LibrariesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Libraries',
      home: LibraryListScreen(),
    );
  }
}

class LibraryListScreen extends StatelessWidget {
  final List<Map<String, String>> libraries = [
    {
      'name': 'material',
      'description': 'import package:flutter/material.dart;',
      'usage': 'The core library for material design widgets and themes in Flutter. It includes prebuilt widgets such as Text, Button, AppBar, and Scaffold, which follow Material Design guidelines.'
    },
    {
      'name': 'cupertino',
      'description': 'import package:flutter/cupertino.dart;',
      'usage': 'Provides widgets that follow Apple"s Human Interface Guidelines (HIG) for iOS apps, including CupertinoPageScaffold, CupertinoButton, and other iOS-style widgets.'
    },
    {
      'name': 'services',
      'description': 'import package:flutter/services.dart;',
      'usage': 'Provides access to system-level services, including handling device orientation, keyboard input, and platform-specific services like vibration, clipboard, and more.'
    },
    {
      'name': 'widgets',
      'description': 'import package:flutter/widgets.dart;',
      'usage': 'Provides basic widgets for building Flutter applications. It includes foundational classes like StatelessWidget, StatefulWidget, Container, Row, Column, etc.'
    },
    {
      'name': 'provider',
      'description': 'import package:provider/provider.dart;',
      'usage': 'A popular state management library. This library allows you to easily manage and share application state across different parts of your app.'
    },
    {
      'name': 'animation',
      'description': 'import package:flutter/animation.dart;',
      'usage': 'Offers animation-related functionality, such as Tween, AnimationController, AnimatedBuilder, and other classes for building custom animations in Flutter.'
    },
    {
      'name': 'flutter_localizations',
      'description': 'import package:flutter_localizations/flutter_localizations.dart;',
      'usage': 'Supports internationalization and localization of your Flutter apps. This library provides support for different languages and regional formats, helping to make your app accessible globally.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Libraries App'),
      ),
      body: ListView.builder(
        itemCount: libraries.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.orange,
            child: ListTile(
              title: Text(libraries[index]['name']!),
              subtitle: Text(libraries[index]['description']!,style: TextStyle(color: Colors.blue,),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LibraryDetailScreen(library: libraries[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class LibraryDetailScreen extends StatelessWidget {
  final Map<String, String> library;

  LibraryDetailScreen({required this.library});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(library['name']!,style: TextStyle(color: Colors.black,),),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              library['description']!,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Usage:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.blue,),
            ),
            Text(library['usage']!),
          ],
        ),
      ),
    );
  }
}