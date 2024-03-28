import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

class AppPermissions {
  static getStoragePermission() async {
    PermissionStatus status = await Permission.storage.status;
    debugPrint("STORAGE STATUS:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.storage.request();
      debugPrint("STORAGE STATUS AFTER ASK:$status");
    }
  }

  static getCameraPermission() async {
    PermissionStatus status = await Permission.camera.status;
    debugPrint("CAMERA STATUS:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.camera.request();
      debugPrint("CAMERA STATUS AFTER ASK:$status");
    }
  }

  static getLocationPermission() async {
    PermissionStatus status = await Permission.location.status;
    debugPrint("LOCATION STATUS:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.location.request();
      debugPrint("LOCATION STATUS AFTER ASK:$status");
    }
  }

  static getContactsPermission() async {
    PermissionStatus status = await Permission.contacts.status;
    debugPrint("CONTACT STATUS:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.contacts.request();
      debugPrint("CONTACT STATUS AFTER ASK:$status");
    }
  }

  static getSmsPermission() async {
    PermissionStatus status = await Permission.sms.status;
    debugPrint("SMS STATUS:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.sms.request();
      debugPrint("SMS STATUS AFTER ASK:$status");
    }
  }
  static getAudioPermission() async {
    PermissionStatus status = await Permission.audio.status;
    debugPrint("Audi STATUS:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.audio.request();
      debugPrint("AUDIO STATUS AFTER ASK:$status");
    }
  }
  static getBluetoothPermission() async {
    PermissionStatus status = await Permission.bluetooth.status;
    debugPrint("bluetooth STATUS:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.bluetooth.request();
      debugPrint("bluetooth STATUS AFTER ASK:$status");
    }
  }
  static getMediaLOcationPermission() async {
    PermissionStatus status = await Permission.accessMediaLocation.status;
    debugPrint("accessMediaLocation STATUS:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.accessMediaLocation.request();
      debugPrint("accessMediaLocation STATUS AFTER ASK:$status");
    }
  }
  static getMicrophonePermission() async {
    PermissionStatus status = await Permission.microphone.status;
    debugPrint("microphone STATUS:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.microphone.request();
      debugPrint("microphone STATUS AFTER ASK:$status");
    }
  }
  static getNearbyWiFIPermission() async {
    PermissionStatus status = await Permission.nearbyWifiDevices.status;
    debugPrint("nearbyWifiDevices STATUS:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.nearbyWifiDevices.request();
      debugPrint("nearbyWifiDevices STATUS AFTER ASK:$status");
    }
  }
  static getSomePermissions() async {
    List<Permission> permissions = [
      Permission.notification,
      Permission.phone,
      Permission.speech,
      Permission.videos,
      Permission.reminders,
    ];
    Map<Permission, PermissionStatus> somePermissionsResults =
    await permissions.request();

    debugPrint(
        "NOTIFICATION STATUS AFTER ASK:${somePermissionsResults[Permission.notification]}");
    debugPrint(
        "SMS STATUS AFTER ASK:${somePermissionsResults[Permission.sms]}");
    debugPrint(
        " SPEECH AFTER ASK:${somePermissionsResults[Permission.speech]}");
    debugPrint(
        " SPEECH AFTER ASK:${somePermissionsResults[Permission.videos]}");
    debugPrint(
        " SPEECH AFTER ASK:${somePermissionsResults[Permission.reminders]}");
  }
}