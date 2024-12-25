import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../data/data.dart';

class AutoScrollingPage extends StatefulWidget {
  final double carouselHeight;
  AutoScrollingPage({required this.carouselHeight});
  @override
  _AutoScrollingPageState createState() => _AutoScrollingPageState();
}

class _AutoScrollingPageState extends State<AutoScrollingPage> {
  final PageController _controller = PageController();
  final pages = AppDatabase.ScrollingPageView;

  int _currentPage = 0;
  late Timer _timer;

  // تعداد صفحات

  @override
  void initState() {
    super.initState();
    // تایمر برای اسکرول خودکار
    _timer = Timer.periodic(Duration(seconds: 3), _autoScroll);
  }

  void _autoScroll(Timer timer) {
    if (_currentPage < pages.length - 1) {
      _currentPage++;
    } else {
      _currentPage = 0;
    }
    _controller.animateToPage(
      _currentPage,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // لغو تایمر هنگام نابود شدن ویجت
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned(


          child: SizedBox(
            height: widget.carouselHeight, // محدودیت ارتفاع برای صفحه‌
            width: width,
            child: PageView.builder(
              controller: _controller,
              itemCount: pages.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.white,

                  child: Image.asset(
                    pages[index].images,
                    fit: BoxFit.cover,//اندازه عکس هماهنگ با اندازه صفحه کل
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: width/2,
          child: SmoothPageIndicator(
            controller: _controller,
            count: pages.length,
            effect: ExpandingDotsEffect(
              activeDotColor: Color(0xFF010501),
              dotHeight: 6,
              dotWidth: 6,
            ),
            onDotClicked: (index) {},
          ),
        ),
      ],
    );
  }
}