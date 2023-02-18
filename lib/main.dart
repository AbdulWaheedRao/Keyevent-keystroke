import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Focus(
                onKey: (node, event) {
                  if (!event.isDigitbackpress()) {
                    return KeyEventResult.handled;
                  } else {
                    return KeyEventResult.ignored;
                  }
                },
                child: TextField())
          ],
        ),
      ),
    );
  }
}

extension keyfiltration on RawKeyEvent {
  bool isDigitkeyStroke() =>
      logicalKey.keyId >= LogicalKeyboardKey.digit0.keyId &&
      logicalKey.keyId <= LogicalKeyboardKey.digit9.keyId;
  bool isDigitbackpress() {
    return isDigitkeyStroke() ||
        logicalKey.keyId == LogicalKeyboardKey.backspace.keyId;
  }
}
