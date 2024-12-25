import 'package:fidibo/Screens/HomeScreen/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../gen/assets.gen.dart';
import '../../main.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final width = MediaQuery.of(context).size.width;
    final themeData = Theme.of(context);
    return Scaffold(
      backgroundColor:width > 1024 ?themeData.colorScheme.surface:   Colors.white,
      body: Column(
        children: [

           width>1024? Assets.images.icons.fidilogo.image(width: 120, height: 80): SizedBox.shrink(),
// SizedBox.shrink() یعنی هیچی نمایش نده
          Center(
            child: Container(
              width: 300,
              height: 600,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 50, 10, 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon( Icons.close,size: 25 ,  // اندازه آیکون
                            color: Color(0xD8504C42),),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PhoneScreen()),
                            );
                          },
                           // آیکون ضربدر
                            // رنگ آیکون
                        ),
                      ],
                    ),
                    Assets.images.icons.userIcon.image(width: 35, height: 35),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "شروع کاربا فیدیبو",
                      style: themeData.textTheme.titleLarge,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "باشمارۀ موبایل تان وارد شوید:",
                      style: themeData.textTheme.titleMedium!
                          .copyWith(color: themeData.colorScheme.onSurface),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 1, // عرض باریک خط
                              height: 30, // ارتفاع بلند خط
                              color: themeData.colorScheme.onSurface, // رنگ خط
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text('۹۸+'),
                            SizedBox(width: 3),
                            Assets.images.icons.iran.image(width: 40, height: 40),
                          ],
                        ),
                        labelText: 'شماره موبایل*',
                        hintText: '********9',
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFAEAEA8), width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF1C1C1C), width: 1.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => width<800? MainScreen():Home(),));

                      },
                      style: ButtonStyle(
                          // backgroundColor:t,
                          minimumSize: MaterialStateProperty.all(
                            Size(MediaQuery.of(context).size.width, 50),
                          ),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            style: themeData.textTheme.bodyLarge!.copyWith(
                              color: Color(0xD885806E),
                            ),
                            'ورود',
                          ),
                          Icon(
                            CupertinoIcons.arrow_left,
                            color: Color(0xD885806E),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 129,
                          height: 0.8,
                          color:Color(0xD8CFC7B0) ,
                        ),
                        SizedBox(width:4,),
                        Text("یا",style:themeData.textTheme.bodyMedium ,),
                        SizedBox(width: 4,),
                        Container(
                          width: 129,
                          height: 0.8,
                          color:Color(0xD8CFC7B0) ,
                        ),
                      ],
                    ),  SizedBox(
                  height: 20,
                ),
                    TextField(
                      decoration: InputDecoration(
                        suffixIcon: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Assets.images.icons.pakat
                                  .image(width: 20, height: 20),
                              SizedBox(
                                width: 5,
                              ),
                              Text("باایمیل",style: themeData.textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w900,color: Color(
                                  0xD822221C)),),

                            ],
                          ),
                        ),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFAEAEA8), width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFAEAEA8), width: 1.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        suffixIcon: Center(
                        child:   Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text("باحساب گوگل",
                                style: themeData.textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w900,color: Color(0xD822221C)),),

                              SizedBox(width: 5,),
                              Assets.images.icons.google.image(width: 20,height: 20)
                            ],
                          ),
                        ),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xFFAEAEA8), width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xFFAEAEA8), width: 1.0),
                        ),
                      ),
                    ),
                   SizedBox(height: 30,),


                    Row(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final url = 'https://www.google.com';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: Stack(
                            children:[ Text(
                              'قوانین استفاده',
                              style: TextStyle(color: Color(0xFF0E2FDD),

                                height: 2.0,  // تنظیم فاصله عمودی بین متن و خط زیرین

                              ),
                            ),
                              Positioned(
                                bottom:1, // اینجا فاصله بین خط و متن را تنظیم می‌کنیم
                                child: Container(
                                  width: 150, // طول خط
                                  height: .8, // ضخامت خط
                                  color:Color(0xFF0E2FDD), // رنگ خط
                                ),
                              ),
                ]
                          ),
                        ),

                        Text(" از فیدیبو را میپذیرم.", style: themeData.textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w900,color: Color(
                            0xFF000B00)), ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
