import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:free_movie/common/common.dart';
import 'package:free_movie/common/show_toast.dart';

/**
 *@program: free_movie
 *@description:
 *@author: Alex.LingJiaHua
 *@create: 2022-08-22
 */

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  FlutterBlue flutterBlue = FlutterBlue.instance;
  bool isBleOn = false;

  @override
  void initState() {
    super.initState();
    flutterBlue.state.listen((state){
      if(state == BluetoothState.on){
        print("蓝牙状态为开启");
        isBleOn = true;
      }else if(state == BluetoothState.off){
        print("蓝牙状态为关闭");
        isBleOn = false;
        ShowToast.show("手机蓝牙未打开，请打开后再扫描设备");
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: kScreenWidth,
        height: kScreenHeight,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
               FlatButton(
                 color: Colors.grey,
                 minWidth: 200,
                   height: 60,
                   onPressed: (){},
                   child: Text("开始连接", style: TextStyle(
                     color: Colors.black87, fontSize: 23, fontWeight: FontWeight.bold
                   ),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
