import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago; //timeago plugin
import 'package:share_plus/share_plus.dart'; //share plus plugin

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

share(BuildContext context, Map _contacts) {
  Share.share(
    '${_contacts['user']} - ${_contacts['phone']}',
    subject: 'Share Contact',
  );
}

class _MyAppState extends State<MyApp> {
  //list of contacts
  final List<Map> _contacts = <Map>[
    {
      "user": "Chan Saw Lin",
      "phone": "0152131113",
      "check-in": "2020-06-30 16:10:05",
    },
    {
      "user": "Lee Saw Loy",
      "phone": "0161231346",
      "check-in": "2020-07-11 15:39:59",
    },
    {
      "user": "Khaw Tong Lin",
      "phone": "0158398109",
      "check-in": "2022-05-23 08:10:18",
    },
    {
      "user": "Lim Kok Lin",
      "phone": "0168279101",
      "check-in": "2020-08-19 11:11:35",
    },
    {
      "user": "Low Jun Wei",
      "phone": "0112731912",
      "check-in": "2020-08-15 13:00:05",
    },
    {
      "user": "Yong Weng Kai",
      "phone": "0172332743",
      "check-in": "2020-07-31 18:10:11",
    },
    {
      "user": "Jayden Lee",
      "phone": "0191236439",
      "check-in": "2020-08-22 08:10:38",
    },
    {
      "user": "Kong Kah Yan",
      "phone": "0111931233",
      "check-in": "2020-07-11 12:00:00",
    },
    {
      "user": "Jasmine Lau",
      "phone": "0162879190",
      "check-in": "2020-08-01 12:10:05",
    },
  ];

  @override
  Widget build(BuildContext context) {
    //sorting contacts by check-in time
    _contacts.sort((a, b) {
      return DateTime.parse(b["check-in"])
          .compareTo(DateTime.parse(a["check-in"]));
    });

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Contacts List'),
        ),
        body: ListView(
          children: _contacts.map((Map contact) {
            return ListTile(
              leading: CircleAvatar(
                child: Text(contact["user"][0]),
              ),
              title: Text(contact["user"]),
              subtitle: Text(contact["phone"]),
              trailing: Text(timeago.format(DateTime.parse(contact["check-in"]),
                  locale: 'en')),
              onTap: () {
                share(context, contact);
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
