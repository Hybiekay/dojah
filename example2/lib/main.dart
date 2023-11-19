import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dojah_kyc/flutter_dojah_kyc.dart';

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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
  final appId = "6000604fb87ea60035ef41bb"; //your application ID
  final publicKey = "prod_pk_7jspvKP2FMkjkSZx1qnbgiMWy"; //your public key

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
          child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: TextButton(
          child: const Text(
            'Verify NIN Now',
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
          onPressed: () {
            // final userData = {
            //   "first_name": "Michael",
            //   "last_name": "Folayan",
            //   "dob": "1998-05-16",
            //   "residence_country": "Nigeria"
            // };

            final configObj = {
              "debug": "true",
              // "mobile": true,22
              "otp": true,
              // "selfie": true,
              // "aml": false,
              "webhook": true,
              "review_process": "Automatic",
              "pages": [
                // { "page": "phone-number", "config": { "verification": true } },
                {
                  "page": "government-data",
                  "config": {
                    "bvn": true,
                    "nin": false,
                    "dl": false,
                    "mobile": false,
                    "otp": true,
                    "selfie": false
                  }
                },

                //{ "page": "user-data", "config": { "enabled": false } },
                //{ "page": "countries", "config": { "enabled": false } },

                // { "page": "business-data", "config": {"cac": true, "tin": true, "verification": true} },
                // { "page": "business-id" },

                // { "page": "selfie", "config": { "verification": true }},

                // {"page": "address"},
                // {
                //   "page": "id",
                //   "config": {"passport": false, "dl": true}
                // }
              ]
            };

            final metaData = {
              "user_id": "81828289191919193882",
            };

            const referenceId = "123456789012a";

            DojahKYC? _dojahKYC;

            ///Use your appId and publicKey
            _dojahKYC = DojahKYC(
              appId: appId,
              publicKey: publicKey,
              type: "custom",
              //userData: userData,
              metaData: metaData,
              config: configObj,
              // referenceId: referenceId
            );

            print(json.encode(configObj));
            print(json.encode(configObj));
            //print(userData);
            print(configObj);
            _dojahKYC.open(context,
                onSuccess: (result) => print(result),
                onClose: (close) => print('Widget Closed'),
                onError: (error) => print(error));
          },
        ),
      )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
