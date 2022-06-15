import 'dart:async';
import 'package:another_flushbar/flushbar.dart';
import 'package:credoapp_example/main.dart';
import 'package:credoapp_example/utils/colors.dart';
import 'package:credoapp_example/utils/route.dart';
import 'package:credoapp_example/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:plaid_flutter/plaid_flutter.dart';
/* 
import 'package:path_provider/path_provider.dart';
import 'package:credoapp_example/screens/nextscreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
 */

Future<void> showAlertDialog(context, data, message) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            backgroundColor: Colors.transparent,
            // shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.all(Radius.circular(15.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
                width: MediaQuery.of(context).size.width * .7,
                height: MediaQuery.of(context).size.height * .5,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: MediaQuery.of(context).size.width * .7,
                        height: MediaQuery.of(context).size.height * .5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * .04),
                          gradient: LinearGradient(
                              colors: [
                                mainColor,
                                mainColor,
                                mainColor1,
                                mainColor1,
                                mainColor2
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                        ),
                        // color: mainColor,
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * .02),
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .03,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    "$message",
                                    textAlign: TextAlign.center,
                                    maxLines: 4,
                                    style: headingStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .03,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "images/welldone.png",
                                  width:
                                      MediaQuery.of(context).size.width * .35,
                                  height:
                                      MediaQuery.of(context).size.height * .18,
                                  color: Colors.white,
                                  // fit: BoxFit.fill,
                                )
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .03,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // AppRoutes.makeFirst(
                                    //     context,
                                    //     MyHomePage(
                                    //       title: "",
                                    //     ));
                                    // print("my user id is: ${data['userid']}");
                                    // AppRoutes.push(context,
                                    //     NextScreen(userId: data['userid']));
                                    AppRoutes.makeFirst(context, MyHomePage());
                                  },
                                  child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .06,
                                      width: MediaQuery.of(context).size.width *
                                          .25,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .02),
                                          color: Colors.white),
                                      child: Center(
                                        child: Text(
                                          "OK",
                                          textAlign: TextAlign.center,
                                          style: headingStyle.copyWith(
                                              fontSize: 16, color: mainColor),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.topCenter,
                    //   child: Container(
                    //     width: MediaQuery.of(context).size.width * .25,
                    //     height: MediaQuery.of(context).size.height * .12,
                    //     decoration: BoxDecoration(
                    //         shape: BoxShape.circle,
                    //         image: DecorationImage(
                    //             image: AssetImage("images/qkplogo.jpeg"),
                    //             fit: BoxFit.contain),
                    //         color: mainColor),
                    //   ),
                    // ),
                  ],
                )),
          ));

//   showDialog<void>(
//     context: context,
//     barrierDismissible: true, // user must tap button!
//     builder: (BuildContext context) {
//       return CupertinoAlertDialog(
//         title: Text('Message'),
//         content: Text('$message!'),
//         actions: <Widget>[
//           CupertinoDialogAction(
//             child: Text('ok'),
//             onPressed: () {
//               Navigator.of(context).pop();
// //                Navigator.pushReplacement(
// //                  context,
// //                  new MaterialPageRoute(builder: (context) => MainScreen()),
// //                );
//             },
//           ),
//         ],
//       );
//     },
//   );
}

void toast(String text, BuildContext context) {
  Flushbar(
    message: "$text",
    flushbarPosition: FlushbarPosition.TOP,
    duration: Duration(seconds: 3),
    leftBarIndicatorColor: Colors.blue[300],
    onTap: (value) {
      // navigatorKey.currentState.push(MaterialPageRoute(
      //   builder: (_) => PendingOrderTracking(),

      // ));
    },
  )..show(context);
}

void setsharedpreferencedata(String token, email, password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("token", token);
  await prefs.setString("email", email);
  await prefs.setString("password", password);
}

Future<void> customDialog(context, message, email, mobileNo, offerCode) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text('Mobile Score Confirmation'),
        content: Text('$message!'),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text('Dismiss'),
            onPressed: () {
              Navigator.of(context).pop();

              // callFunction(context, email, mobileNo, offerCode);

//                Navigator.pushReplacement(
//                  context,
//                  new MaterialPageRoute(builder: (context) => MainScreen()),
//                );
            },
          ),
          CupertinoDialogAction(
            child: Text('OK'),
            onPressed: () {
              // Navigator.of(context, rootNavigator: true).pop();
              // Navigator.of(context).pop();
              EasyLoading.show();
              callFunction(context, email, mobileNo, offerCode);

//                Navigator.pushReplacement(
//                  context,
//                  new MaterialPageRoute(builder: (context) => MainScreen()),
//                );
            },
          ),
        ],
      );
    },
  );
}

/* 
Future<void> _deleteCacheDir() async {
  var tempDir = await getTemporaryDirectory();
  if (tempDir.existsSync()) {
    tempDir.deleteSync(recursive: true);
  }
}

Future<void> _deleteAppDir() async {
  var appDocDir = await getApplicationDocumentsDirectory();
  if (appDocDir.existsSync()) {
    appDocDir.deleteSync(recursive: true);
  }
}
 */
Future<void> callFunction(context, email, mobileNo, offerCode) async {
  EasyLoading.show();
  Map<String, dynamic> data = <String, dynamic>{
    'email': email,
    "offerCode": offerCode,
    "mobileNo": mobileNo,
  };
  print("data: $data");

  //late LegacyLinkConfiguration _publicKeyConfiguration;

  //call Plaid

/* resp = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  ); */

  try {
    LinkConfiguration configuration = LinkTokenConfiguration(
      token: "link-sandbox-07b9b2ce-bdfe-4f8b-b661-fe92f89f3621",
    );

    PlaidLink.onSuccess(_onSuccessCallback);
    PlaidLink.onEvent(_onEventCallback);
    PlaidLink.onExit(_onExitCallback);

    EasyLoading.dismiss();

    PlaidLink.open(configuration: configuration);
  } catch (value) {
    toast("${value}", context);
    EasyLoading.dismiss();
    print("${value}");
  }

  /* 
  const platform = const MethodChannel('flutter.native/helper');
  var sharedData =
      await platform.invokeMethod("changeColor", data).then((value) {
    print("hello worlds vales: $value");
    EasyLoading.dismiss();
    if (Platform.isIOS) {
      if (value.toString().contains("score")) {
        EasyLoading.dismiss();
        var data = json.decode(value);
        AppRoutes.push(
            context,
            NextScreen(
              userId: data['userid'],
            ));

        // AppRoutes.push(context, ShowData(data: data));
      } else {
        Flushbar(
          message: "${value.toString()}!",
          flushbarPosition: FlushbarPosition.TOP,
          duration: Duration(seconds: 3),
          leftBarIndicatorColor: Colors.blue[300],
          onTap: (value) {
            // navigatorKey.currentState.push(MaterialPageRoute(
            //   builder: (_) => PendingOrderTracking(),

            // ));
          },
        )..show(context);
      }
    } else {
      if (value.toString().contains("scoreid")) {
        EasyLoading.dismiss();
        var data = json.decode(value);
        AppRoutes.push(
            context,
            NextScreen(
              userId: data['userid'],
            ));

        // AppRoutes.push(context, ShowData(data: data));
      } else {
        Flushbar(
          message: "Something Went wrong!",
          flushbarPosition: FlushbarPosition.TOP,
          duration: Duration(seconds: 3),
          leftBarIndicatorColor: Colors.blue[300],
          onTap: (value) {
            // navigatorKey.currentState.push(MaterialPageRoute(
            //   builder: (_) => PendingOrderTracking(),

            // ));
          },
        )..show(context);
      }
    }
  }).catchError((onError) {
    EasyLoading.dismiss();
    _deleteCacheDir();
    _deleteAppDir();
    Flushbar(
      message: "${onError}!",
      flushbarPosition: FlushbarPosition.TOP,
      duration: Duration(seconds: 3),
      leftBarIndicatorColor: Colors.blue[300],
      onTap: (value) {
        // navigatorKey.currentState.push(MaterialPageRoute(
        //   builder: (_) => PendingOrderTracking(),

        // ));
      },
    )..show(context);
    print("after calling  error: $onError");
  });
  print("return data:: $sharedData");
   */
}

void _onSuccessCallback(String publicToken, LinkSuccessMetadata metadata) {
  print("onSuccess: $publicToken, metadata: ${metadata.description()}");
}

void _onEventCallback(String event, LinkEventMetadata metadata) {
  print("onEvent: $event, metadata: ${metadata.description()}");
}

void _onExitCallback(LinkError? error, LinkExitMetadata metadata) {
  print("onExit metadata: ${metadata.description()}");

  if (error != null) {
    print("onExit error: ${error.description()}");
  }
}

// Future<void> collectData(context, url, authKey, ref) async {
//   EasyLoading.show();
//   final result = await Credoappsdk.execute(url, authKey, "$ref").then((value) {
//     print("return result: ${value.isFailure}");
//     if (value.isFailure) {
//       EasyLoading.dismiss();

//       // showDialog(
//       //     context: context,
//       //     builder: (BuildContext context) => _buildPopupDialog(
//       //         context, "Result error: ${value.code} ${value.message}"));
//       Flushbar(
//         message: "Result error: ${value.code} ${value.message}",
//         flushbarPosition: FlushbarPosition.TOP,
//         duration: Duration(seconds: 3),
//         leftBarIndicatorColor: Colors.blue[300],
//         onTap: (value) {
//           // navigatorKey.currentState.push(MaterialPageRoute(
//           //   builder: (_) => PendingOrderTracking(),

//           // ));
//         },
//       )..show(context);
//     } else {
//       EasyLoading.dismiss();
//       // showDialog(
//       //     context: context,
//       //     builder: (BuildContext context) =>
//       //         _buildPopupDialog(context, "Result success"));
//       showAlertDialog(context,
//           "Congratulation, you have been pre-qualified! We've collected and analyzed your information and will pass it on to your information and will pass it on to your lender. ");
//     }
//   }).catchError((onError) {
//     EasyLoading.dismiss();
//     Flushbar(
//       message: "Result error: ${onError.code} ${onError.message}",
//       flushbarPosition: FlushbarPosition.TOP,
//       duration: Duration(seconds: 3),
//       leftBarIndicatorColor: Colors.blue[300],
//       onTap: (value) {
//         // navigatorKey.currentState.push(MaterialPageRoute(
//         //   builder: (_) => PendingOrderTracking(),

//         // ));
//       },
//     )..show(context);
//     print("error: $onError");
//   });
// }
