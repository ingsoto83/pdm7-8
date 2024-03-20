import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pdm7/basic_widgets.dart';
import 'package:pdm7/home_page_widget.dart';
import 'package:pdm7/image_widget.dart';
import 'package:pdm7/list_widget.dart';
import 'package:pdm7/place_widget.dart';

import 'firebase_options.dart';
import 'login_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      title: "DAM7",
      home: LoginPage()
    )
  );
}
