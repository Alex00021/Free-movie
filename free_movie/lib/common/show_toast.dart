/**
 *@program: free_movie
 *@description:
 *@author: Alex.LingJiaHua
 *@create: 2022-08-22
 */

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///弹出提示框
class ShowToast {
  static show(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey[400],
      fontSize: 16.0,
    );
  }
}