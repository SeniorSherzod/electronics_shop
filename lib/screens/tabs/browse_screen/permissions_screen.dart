import 'package:electronics_shop/utils/extensions/extensions.dart';
import 'package:electronics_shop/utils/permissions_utils/permissions_utils.dart';
import 'package:electronics_shop/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/colors/colors.dart';

class PermissonsScreen extends StatefulWidget {
  const PermissonsScreen({super.key});

  @override
  State<PermissonsScreen> createState() => _PermissonsScreenState();
}

class _PermissonsScreenState extends State<PermissonsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark),
        elevation: 0,
        backgroundColor: AppColors.main,
        toolbarHeight: 120,
        title: Text("Permissions"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  AppPermissions.getStoragePermission();
                },style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Background color
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
        // You can add more styles as needed
      ),
                child:const ListTile(
                  title:Text("ask Permission to storage",),
                  trailing: Icon(Icons.storage),
                ),
              ),
              SizedBox(height: 15.h,),
              TextButton(
                onPressed: () {
                  AppPermissions.getCameraPermission();
                },style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Background color
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
                // You can add more styles as needed
              ),
                child:const ListTile(
                  title:Text("ask Permission to camera",),
                  trailing: Icon(Icons.camera_alt_sharp),
                ),
              ),
              SizedBox(height: 15.h,),
              TextButton(
                onPressed: () {
                  AppPermissions.getContactsPermission();
                },style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Background color
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
                // You can add more styles as needed
              ),
                child:const ListTile(
                  title:Text("ask Permission to cantact",),
                  trailing: Icon(Icons.contacts_sharp),
                ),
              ),
              SizedBox(height: 15.h,),
              TextButton(
                onPressed: () {
                  AppPermissions.getLocationPermission();
                },style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Background color
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
                // You can add more styles as needed
              ),
                child:const ListTile(
                  title:Text("ask Permission to location",),
                  trailing: Icon(Icons.location_pin),
                ),
              ),
              SizedBox(height: 15.h,),
              TextButton(
                onPressed: () {
                  AppPermissions.getAudioPermission();
                },style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Background color
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
                // You can add more styles as needed
              ),
                child:const ListTile(
                  title:Text("ask Permission to audio",),
                  trailing: Icon(Icons.audio_file_sharp),
                ),
              ),
              SizedBox(height: 15.h,),
              TextButton(
                onPressed: () {
                  AppPermissions.getSmsPermission();
                },style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Background color
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
                // You can add more styles as needed
              ),
                child:const ListTile(
                  title:Text("ask Permission to sms",),
                  trailing: Icon(Icons.sms),
                ),
              ),
              SizedBox(height: 15.h,),
              TextButton(
                onPressed: () {
                  AppPermissions.getBluetoothPermission();
                },style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Background color
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
                // You can add more styles as needed
              ),
                child:const ListTile(
                  title:Text("ask Permission to bluetooth",),
                  trailing: Icon(Icons.bluetooth),
                ),
              ),
              SizedBox(height: 15.h,),
              TextButton(
                onPressed: () {
                  AppPermissions.getMicrophonePermission();
                },style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Background color
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
                // You can add more styles as needed
              ),
                child:const ListTile(
                  title:Text("ask Permission to microphone",),
                  trailing: Icon(Icons.mic_rounded),
                ),
              ),
              SizedBox(height: 15.h,),
              TextButton(
                onPressed: () {
                  AppPermissions.getNearbyWiFIPermission();
                },style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Background color
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
                // You can add more styles as needed
              ),
                child:const ListTile(
                  title:Text("ask Permission to wifi",),
                  trailing: Icon(Icons.wifi),
                ),
              ),
              SizedBox(height: 15.h,),
              TextButton(
                onPressed: () {
                  AppPermissions.getMediaLOcationPermission();
                },style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Background color
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
                // You can add more styles as needed
              ),
                child:const ListTile(
                  title:Text("ask Permission to Medialocation",),
                  trailing: Icon(Icons.location_city_outlined),
                ),
              ),
              SizedBox(height: 15.h,),
              TextButton(
                onPressed: () {
                  AppPermissions.getSomePermissions();
                },style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Background color
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
                // You can add more styles as needed
              ),
                child:const ListTile(
                  title:Text("ask Permission to same permissions",),
                  trailing: Icon(Icons.more_horiz),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
