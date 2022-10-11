import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/common.dart';

/**
 *@program: free_movie
 *@description:
 *@author: Alex.LingJiaHua
 *@create: 2022-08-22
 */

class LiveStreamingPage extends StatefulWidget {
  const LiveStreamingPage({Key? key}) : super(key: key);

  @override
  State<LiveStreamingPage> createState() => _LiveStreamingPageState();
}

class _LiveStreamingPageState extends State<LiveStreamingPage> {
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
