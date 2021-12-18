import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:honeyDo/theme/custom_theme.dart';

import 'screens/homepage.dart';



Future<void> main() async {
 // await AtEnv.load();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

//Future<AtClientPreference> loadAtClientPreference() async {

  // var dir = await getApplicationSupportDirectory();
  // return AtClientPreference()
  //   ..rootDomain = AtEnv.rootDomain
  //   ..namespace = AtEnv.appNamespace
  //   ..hiveStoragePath = dir.path
  //   ..commitLogPath = dir.path
  //   ..isLocalStoreRequired = true
  // // TODO set the rest of your AtClientPreference here
  //     ;
//}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

int auth_success = 0;

class _MyAppState extends State<MyApp> {
  // * load the AtClientPreference in the background
 // Future<AtClientPreference> futurePreference = loadAtClientPreference();
  //AtClientPreference? atClientPreference;

 // final AtSignLogger _logger = AtSignLogger(AtEnv.appNamespace);




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // * The onboarding screen (first screen)
      title: "honeyDo",

      home: Scaffold(
        appBar: AppBar(
          title: const Text('MyApp'),
        ),
        body: Builder(
          builder: (context) =>
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /*ElevatedButton(
                    onPressed: () async {
                      var preference = await futurePreference;
                      setState(() {
                        atClientPreference = preference;
                      });
                      Onboarding(
                        context: context,
                        atClientPreference: atClientPreference!,
                        domain: AtEnv.rootDomain,
                        rootEnvironment: AtEnv.rootEnvironment,
                        appAPIKey: AtEnv.appApiKey,
                        onboard: (value, atsign) {
                          _logger.finer('Successfully onboarded $atsign');
                        },
                        onError: (error) {
                          _logger.severe('Onboarding throws $error error');
                        },
                        nextScreen: Homepage(),
                      );
                    },
                    child: const Text('Onboard an @sign'),
                  ),
 this is to hide the atsign stuff since its not part of the project anymore*/
                  ElevatedButton(
                    onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>homepage()));
                  },
                    child: const Text("Use Local Storage"),
              ),
                ],
              ),
              ),
        ),

              );
  }
}