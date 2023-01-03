import 'package:days_ago/days_ago.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<DateTime> _listOfDate = List.generate(
      100,
      (index) => DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day - index,
            DateTime.now().hour,
            DateTime.now().minute,
            DateTime.now().second,
            DateTime.now().millisecond,
            DateTime.now().microsecond,
          ));
  List<ExampleModel> exampleList = [];
  @override
  void initState() {
    super.initState();
    exampleList = List.generate(
        _listOfDate.length,
        (index) => ExampleModel(
            message: "Message recived on ${_listOfDate[index]}",
            receiveTime: _listOfDate[index]));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: ListView(
            children: List.generate(
                exampleList.length,
                (index) => Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade200,
                      ),
                      child: ListTile(
                        title: Text(
                          exampleList[index].message,
                          style: const TextStyle(color: Colors.black),
                        ),
                        trailing: Text(
                            DaysAgo(exampleList[index].receiveTime).getString),
                      ),
                    ))),
      ),
    );
  }
}

class ExampleModel {
  String message;
  DateTime receiveTime;
  ExampleModel({
    required this.message,
    required this.receiveTime,
  });
}
