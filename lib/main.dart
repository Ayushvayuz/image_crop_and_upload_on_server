import 'package:flutter/material.dart';
import 'package:image_crop_and_upload_on_server/Api_Service/api_service.dart';
import 'package:image_crop_and_upload_on_server/Image_Picker/image_picker.dart';
import 'package:image_crop_and_upload_on_server/Screen/bottom_screen.dart';
import 'package:provider/provider.dart';

import 'Screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>ImagePick()),
      ChangeNotifierProvider(create: (_)=>BottomScreen()),
      ChangeNotifierProvider(create: (_)=>ApiService())
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  HomeScreen(),
      ),
    );
  }
}
