import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:free_movie/view/home_page.dart';
import 'package:free_movie/view/live_streaming_page.dart';
import 'package:free_movie/view/my_page.dart';
import 'package:free_movie/view/select_play_page.dart';

/**
 *@program: free_movie
 *@description:
 *@author: Alex.LingJiaHua
 *@create: 2022-08-22
 */

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  ///bottomTab栏控制器
  late TabController bottomTabController;

  ///当前页面
  late int currentIndex;

  ///视图view
  final pageControllers = [
    // 首页
    const HomePage(),
    // 选播
    const SelectPlayPage(),
    // 直播
    const LiveStreamingPage(),
    // 我的 页
    const MyPage(),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }


  @override
  void dispose() {
    super.dispose();
  }


  ///@description: 切换页面
  ///@program: {int index}
  void changePage(int index) {
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }


  /// 底部导航图标
  final List<BottomNavigationBarItem> bottomNavItems = [
    // 首页
    const BottomNavigationBarItem(
        activeIcon: Icon(Icons.home),
        icon: Icon(Icons.home),
        label: "首页"),
    //
    const BottomNavigationBarItem(
        activeIcon: Icon(Icons.slideshow),
        icon: Icon(Icons.slideshow),
        label: "选播"),
    // 购物车页
    const BottomNavigationBarItem(
        activeIcon: Icon(Icons.skip_next),
        icon: Icon(Icons.skip_next),
        label: "直播"),
    // "我的"页
    const BottomNavigationBarItem(
        activeIcon: Icon(Icons.person),
        icon: Icon(Icons.person),
        label: "我的")
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.black,
          selectedFontSize: 12,
          unselectedFontSize: 10,
          items: bottomNavItems,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            changePage(index);
          }),
      body: pageControllers[currentIndex],
    );
  }
}