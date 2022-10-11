import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/common.dart';

/**
 *@program: free_movie
 *@description:
 *@author: Alex.LingJiaHua
 *@create: 2022-08-22
 */

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
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

              ],
            ),
          ),
        ),
      ),
    );
  }
}
