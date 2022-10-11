import 'dart:async';
import 'package:flutter/material.dart';
import 'package:free_movie/login_page.dart';


/**
 *@program: free_movie
 *@description:
 *@author: Alex.LingJiaHua
 *@create: 2022-08-22
 */

class AdPage extends StatefulWidget {
  const AdPage({Key? key}) : super(key: key);

  @override
  State<AdPage> createState() => _AdPageState();
}

class _AdPageState extends State<AdPage> {

  late Timer _timer;
  int count = 6;

  @override
  void initState() {
    super.initState();
    startTime();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment(1.0, -1.0), // 右上角对齐
        children: [
          ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Image.asset("assets/images/Ad_image.jpg",//广告图
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 30.0, 10.0, 0.0),
            child: FlatButton(
              color: Color.fromRGBO(0, 0, 0, 0.3),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Text(
                "$count 跳过",
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
              onPressed: () {
                navigationPage();
              },
            ),
          )
        ],
      ),
    );
  }


  void startTime() async {
    //设置启动图生效时间
    var _duration = new Duration(seconds: 1);
    Timer(_duration, () {
      // 空等1秒之后再计时
      _timer = Timer.periodic(const Duration(milliseconds: 1000), (v) {
        count--;
        if (count == 0) {
          navigationPage();
        } else {
          setState(() {});
        }
      });
      // return _timer;
    });
  }

  void navigationPage() {
    _timer.cancel();
    Navigator.of(context).pushReplacement(PageRouteBuilder(
        pageBuilder: (cxt,ani1,ani2){
          return FadeTransition(
              opacity: ani1,
              child: const LoginPage());
        }
    ));
  }
}


