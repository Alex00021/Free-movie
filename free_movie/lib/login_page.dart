import 'dart:async';
import 'package:flutter/material.dart';
import 'common/show_toast.dart';
import 'index_page.dart';

/**
 *@program: free_movie
 *@description:
 *@author: Alex.LingJiaHua
 *@create: 2022-08-22
 */

/// 登录页面
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  ///是否可点击获取验证码按钮
  bool isButtonEnable = true;

  ///账号及验证码各设置一个监听控制器
  final phoneController = TextEditingController();
  final codeController = TextEditingController();

  ///GlobalKey全局标识
  final GlobalKey<FormState> verificationCodeKey = GlobalKey<FormState>();
  final GlobalKey<FormState> phoneNumberKey = GlobalKey<FormState>();

  ///账号
  String? phoneNumber;

  ///短信验证码
  String? verificationCode;

  String getCodeText = "获取验证码";

  ///倒计时总秒数
  int count = 61;

  ///设置计时器
  Timer? countDownTimer;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
      resizeToAvoidBottomInset: false,
    );
  }


  Widget getBody() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 100,),

              const SizedBox(height: 120),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(1, 1),
                              blurRadius: 10,
                              spreadRadius: 1
                          )
                        ]
                    ),
                  ),
                  Positioned(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Form( //Form表单校验验证码输入
                            key: phoneNumberKey,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            child: TextFormField(
                              //当Form表单调用保存方法Save时，回调的函数
                              onSaved: (val) {
                                phoneNumber = val;
                              },
                              validator: (val) {
                                return val!.length < 9
                                    ? "无效的手机号"
                                    : null;
                              },
                              autofocus: false,
                              autocorrect: false,
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              enabled: true,
                              decoration: InputDecoration(
                                //背景颜色，必须结合filled: true,才有效
                                fillColor: Colors.grey[50],
                                filled: true,
                                //初始状态的输入框样式
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 0.9),
                                ),
                                prefixIcon:
                                const Icon(Icons.account_circle),
                                labelText: "账号",
                                labelStyle: const TextStyle(fontSize: 15, color: Colors.black),
                                //编辑状态下的输入框样式
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade50),
                                ),
                                //不可编辑状态下的输入框样式
                                disabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade50),
                                ),
                                //报错状态下的输入框样式
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 0.8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade400),
                                ),
                                floatingLabelBehavior:
                                FloatingLabelBehavior.auto,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              child: Form( //Form表单校验验证码输入
                                  key: verificationCodeKey,
                                  autovalidateMode: AutovalidateMode
                                      .onUserInteraction,
                                  child: TextFormField(
                                    onSaved: (val) {
                                      verificationCode = val;
                                    },
                                    validator: (val) {
                                      if (phoneNumber?.length ==
                                          11) {
                                        return val!.length < 4
                                            ? "验证码错误"
                                            : null;
                                      } else {
                                        return null;
                                      }
                                    },
                                    autofocus: false,
                                    autocorrect: false,
                                    controller: codeController,
                                    keyboardType:
                                    TextInputType.phone,
                                    enabled: true,
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey[50],
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(
                                            30),
                                        borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 0.9),
                                      ),
                                      prefixIcon: const Icon(Icons.lock),
                                      labelText: "验证码",
                                      labelStyle: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black),
                                      enabledBorder:
                                      OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(
                                            30),
                                        borderSide: BorderSide(
                                            color: Colors
                                                .grey.shade50),
                                      ),
                                      disabledBorder:
                                      OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(
                                            30),
                                        borderSide: BorderSide(
                                            color: Colors
                                                .grey.shade50),
                                      ),
                                      errorBorder:
                                      OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(
                                            30),
                                        borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 0.8),
                                      ),
                                      focusedBorder:
                                      OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(
                                            30),
                                        borderSide: BorderSide(
                                            color: Colors
                                                .grey.shade400),
                                      ),
                                      floatingLabelBehavior:
                                      FloatingLabelBehavior
                                          .auto,
                                    ),
                                  )),
                            ),
                            Positioned(
                              right: 18,
                              top: 6,
                              child:  FlatButton(
                                disabledTextColor: Colors.grey,
                                splashColor: Colors.transparent,
                                highlightColor:
                                Colors.transparent,
                                onPressed: () {
                                  setState(() {
                                    //需捕抓一次手机号输入是否满足要求，ture则发送验证码，反之return
                                    var phoneNumKey = phoneNumberKey.currentState;
                                    if (phoneNumKey!.validate()) {
                                      phoneNumKey.save();
                                      if (phoneNumber?.length == 9) {
                                        if (isButtonEnable && phoneController.text.trim() == "123456789") {
                                          isButtonEnable = false;
                                          getVerificationCode();
                                          return null;
                                        } else {
                                          return ShowToast.show("该手机号尚未入驻平台");
                                        }
                                      } else {
                                        return ShowToast.show("请先输入手机号");
                                      }
                                    }
                                  });
                                },
                                padding: const EdgeInsets.only(top: 0),
                                textColor: count < 61
                                    ? Colors.grey
                                    : Colors.black,
                                child: Text(getCodeText, style: const TextStyle(fontSize: 13)),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        FlatButton(
                            minWidth: 108,
                            height: 40,
                            shape: const StadiumBorder(),
                            color: Colors.blueGrey,
                            onPressed: () {
                              onLogin();
                            },
                            child: const Text("登录", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
                      ],
                    ),
                  )
                ],
              )
            ])
    );
  }

  /// 获取短信验证码
  getVerificationCode() async {
    //取消倒计时
    countDownTimer?.cancel();
    countDownTimer = null;
    countDownTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      count--;
      setState(() {
        if ((count == 0)) {
          //倒计时结束取消定时器
          countDownTimer?.cancel();
          isButtonEnable = true;

          //重置倒计时间
          count = 61;

          //再次恢复获取验证码按钮
          getCodeText = "获取验证码";
        } else {
          isButtonEnable = false;

          //更新倒计时内秒数
          getCodeText = "    ${count}s";
        }
      });
    });
  }


  /// 登录
  onLogin() {
    if(phoneController.text.trim() == "123456789" && codeController.text == "123456" && isButtonEnable == false) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const IndexPage()));
    }

  }

}
