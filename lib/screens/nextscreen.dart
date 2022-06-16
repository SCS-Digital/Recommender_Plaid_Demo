import 'package:another_flushbar/flushbar.dart';
import 'package:recommender_example/helper/basehelper.dart';
import 'package:recommender_example/utils/colors.dart';
import 'package:recommender_example/utils/custombutton.dart';
import 'package:recommender_example/utils/customtextfield.dart';
import 'package:recommender_example/utils/route.dart';
import 'package:recommender_example/utils/styles.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class NextScreen extends StatefulWidget {
  var userId;
  NextScreen({@required this.userId});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NextScreen();
  }
}

class _NextScreen extends State<NextScreen> {
  var width, height;
  bool validate = false;
  TextEditingController user = TextEditingController(text: "cust-kzfl6x1y");
  TextEditingController password = TextEditingController(text: "asd123");
  String message =
      "Congratulation, you have been pre-qualified! We've collected and analyzed your information and will pass it on to your lender. ";
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff062636),
        leading: GestureDetector(
          onTap: () {
            AppRoutes.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: mainColor,
          ),
        ),
        title: Text(
          "Gracias!",
          style: headingStyle.copyWith(
              fontSize: 18, fontWeight: FontWeight.w600, color: mainColor),
        ),
        centerTitle: true,
      ),
      body: Container(
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
                  gradient: LinearGradient(colors: [
                    mainColor,
                    mainColor,
                    mainColor1,
                    mainColor1,
                    mainColor2
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                // color: mainColor,
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * .02),
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
                          width: MediaQuery.of(context).size.width * .35,
                          height: MediaQuery.of(context).size.height * .18,
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
                            //AppRoutes.makeFirst(context, MyHomePage(title: ""));
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * .06,
                            width: MediaQuery.of(context).size.width * .25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width * .02),
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget heading(title) {
    return Padding(
      padding: EdgeInsets.only(bottom: height * .00),
      child: Row(
        children: [
          SizedBox(
            width: width * .03,
          ),
          Text(
            "$title*",
            style: headingStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
