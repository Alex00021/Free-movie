import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/common.dart';

/**
 *@program: free_movie
 *@description:
 *@author: Alex.LingJiaHua
 *@create: 2022-08-22
 */

class SelectPlayPage extends StatefulWidget {
  const SelectPlayPage({Key? key}) : super(key: key);

  @override
  State<SelectPlayPage> createState() => _SelectPlayPageState();
}

class _SelectPlayPageState extends State<SelectPlayPage> {
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
