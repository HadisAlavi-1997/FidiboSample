import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../data/data.dart';
import '../../gen/assets.gen.dart';
import '../Auth/Auth.dart';
import '../HomeScreen/HomeScreen.dart';
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pagecontroller =PageController();
  int pageview=0;

  @override

  void initState(){
    print('pageview1:$pageview');
    _pagecontroller.addListener((){
      if(_pagecontroller.page!.round()!= pageview){
       setState(() {
         pageview=_pagecontroller.page!.round();
       });
       print('pageview2:$pageview');
      }
    });
    super.initState();


  }
  Widget build(BuildContext context) {

    final themeData = Theme.of(context);
    final width=MediaQuery.of(context).size.width;
    final onboardingData =AppDatabase.onboardingItems;
    return Scaffold(
      backgroundColor: Colors.white, // رنگ پس‌زمینه سفید برای کل صفحه
      body: SafeArea(

        child: Column(
         crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
                children:[
                  Padding(

                    padding: const EdgeInsets.all(3),
                    child: Text("Fidibo",style: themeData.textTheme.labelSmall,),

                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                    child: Assets.images.icons.fidiboIcon1.image(width: 16,height: 16),
                  ),



            ]),

            Align(
              alignment: Alignment.centerRight, // متن "رد کردن" را در سمت راست قرار می‌دهد
              child: Padding(
                padding: const EdgeInsets.only(right: 20), // کمی فاصله از حاشیه راست
                child: Text("رد کردن", style: themeData.textTheme.bodyLarge), // تغییر استایل به دلخواه
              ),
            ),
            Expanded(
              child: Center(
                child: PageView.builder(
                    itemCount: onboardingData.length,
                    controller: _pagecontroller,
                    itemBuilder:(context, index){

                     return Column(
                        children: [
                     SizedBox(height: 100,),
                     width>1024?Image.asset(onboardingData[index].imageNameD): Image.asset(onboardingData[index].imageNameM,width: 200,height: 200,),
                     Text(onboardingData[index].title, style: themeData.textTheme.titleLarge),
                     SizedBox(height: 20,),
                     Text(  onboardingData[index].description,
                     style: themeData.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700,color: themeData.colorScheme.onSurface)),

                        ],
                      );


                    }

                      ),

              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 30, 100),
              child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  // go to pub.dev and choose a model of effect
                  SmoothPageIndicator(controller: _pagecontroller, count: onboardingData.length,
                  effect: ExpandingDotsEffect(activeDotColor: Color(0xFF4AF6E2),
                  dotHeight: 8,
                  dotWidth: 8,
                  dotColor: themeData.colorScheme.primary.withOpacity(.1)),
                  ),
                  IconButton(onPressed: (){
                    if(pageview==onboardingData.length-1){
                      //onboardingData.length is 3
                      print("onboardingData.length:$onboardingData.length");
                      //استفاده ازpushReplacementیعنی فقط یکبار این  onboarding نمایش داده میشه
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Auth()));

                    }else {
                       _pagecontroller.animateToPage(pageview+1, duration: Duration(milliseconds: 500), curve: Curves.bounceInOut);
                       // in _pagecontroller : page=pageview+1
                      // _pagecontroller.page دراینحا یکی اضافه میشه به
                  }

                  },
                      icon: Icon( pageview==onboardingData.length-1?CupertinoIcons.checkmark_alt: CupertinoIcons.arrow_left ) ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
