import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:info/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  Map<String,dynamic> device ={};
  String brand = '';
  String deviceName = '';
  String model = '';
  String hardware = '';
  String host = '';
  bool isPhysicalDevice = false;



  @override
  void initState() {
    super.initState();
    init();
    Future.delayed(Duration(seconds: 5)).then((value) {
      return init();
    });
  }

  Future init()async{
    final data = await deviceInfoPlugin.androidInfo;
      device = data.data;
      brand = data.brand;
      deviceName = data.device;
      model = data.model;
      hardware = data.hardware;
      host = data.host;
      isPhysicalDevice = data.isPhysicalDevice;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// #App Bar
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Device Info'),
      ),

      /// #Body
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                /// #B
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Brend:'),
                    Text(brand),
                  ],
                ),
                /// #D
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Device Name:'),
                    Text(deviceName),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Display:'),
                    Text("${device['display']}"),
                  ],
                ),
                /// #H
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Hardware:'),
                    Text(hardware),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Host:'),
                    Text(host),
                  ],
                ),
                /// #I
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('IsPhysicalDevice:'),
                    Text("$isPhysicalDevice"),
                  ],
                ),
                /// #M
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Model:'),
                    Text(model),
                  ],
                ),
                /// #P
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Product:'),
                    Text("${device['product']}"??''),
                  ],
                ),
                /// #R
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Release:'),
                    Text("${device['version']['release']}"??''),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Resolution:'),
                    Text("${device['displayMetrics']['widthPx']} x ${device['displayMetrics']['heightPx']}" ?? ''),
                  ],
                ),
                /// #S
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Sdk version:'),
                    Text("${device['version']['sdkInt']}"??''),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('SerialNumber:'),
                    Text("${device['serialNumber']}"??''),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('SupportedAbis:'),
                    Text("${device['supportedAbis']}"??''),
                  ],
                ),
                /// #T
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Type:'),
                    Text("${device['type']}" ?? ''),
                  ],
                ),

              ],
            ),
          )
      ),
    );
  }
}
