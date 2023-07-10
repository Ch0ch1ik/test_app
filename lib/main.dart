import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Questionnaire.dart';


Future<Questionnaire> fetchQuestionnaire() async {
  final response = await http.get(Uri.parse('http://ch0ch1ik.pythonanywhere.com/api/questionnaires/2/?format=json'));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Questionnaire.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Questionnaire> futureQuestionnaire;

  @override
  void initState() {
    super.initState();
    futureQuestionnaire = fetchQuestionnaire();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Questionnaire>(
            future: futureQuestionnaire,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var utf8Name = snapshot.data!.name!.runes.toList();
                var utf8Description = snapshot.data!.description!.runes.toList();
                return
                 Column(
                  children:  [
                    Text(utf8.decode(utf8Name)),
                    Text(utf8.decode(utf8Description)),
                    const Text('AAAAAAAA'),
                    const Expanded(
                      child: FittedBox(
                        child: FlutterLogo(),
                      ),
                    ),
                  ],
                );



              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}