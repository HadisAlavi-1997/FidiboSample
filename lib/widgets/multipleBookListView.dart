import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/data.dart';

class Multiplebooklistview extends StatefulWidget {
  final List<MultipleBooks> listOption;
  final ThemeData themeData;

  const Multiplebooklistview({
    Key? key,
    required this.listOption,
    required this.themeData,
  }) : super(key: key);

  @override
  _ScrollableListViewState createState() => _ScrollableListViewState();
}

class _ScrollableListViewState extends State<Multiplebooklistview> {
  late final ScrollController _ControllerScroll;
  bool _canScrollLeft = false;
  bool _canScrollRight = true;

  @override
  void initState() {
    super.initState();
    _ControllerScroll = ScrollController();
    _ControllerScroll.addListener(_updateScrollButtons);
  }

  @override
  void dispose() {
    _ControllerScroll.removeListener(_updateScrollButtons);
    _ControllerScroll.dispose();
    super.dispose();
  }

  void _updateScrollButtons() {
    final maxScroll = _ControllerScroll.position.maxScrollExtent;
    final currentScroll = _ControllerScroll.offset;

    setState(() {
      _canScrollLeft =
          currentScroll > 0; // وقتی اسکرول بیشتر از 0 باشد، دکمه چپ فعال است
      _canScrollRight = currentScroll <
          maxScroll; // وقتی اسکرول کمتر از انتها باشد، دکمه راست فعال است
    });
  }

  void _scrollRight() {
    _ControllerScroll.animateTo(
      _ControllerScroll.offset + 200,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _scrollLeft() {
    _ControllerScroll.animateTo(
      _ControllerScroll.offset - 200,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 10, 30),
      child: Stack(
        children: [
          // لیست اصلی
          Container(
            height: 400,
            width: double.infinity, // عرض متغیر برای تطابق با والد
            child: _buildListViewContent(
              widget.listOption,
              widget.themeData,
              _ControllerScroll,
              isDesktop,
            ),
          ),

          // دکمه سمت چپ
          if (isDesktop && _canScrollLeft)
            Positioned(
              left: 20, // قرارگیری در سمت چپ
              top: 150, // تنظیم موقعیت عمودی
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2)),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios), // آیکون سمت چپ
                  onPressed: _scrollLeft, // متد اسکرول به چپ
                ),
              ),
            ),

          // دکمه سمت راست
          if (isDesktop && _canScrollRight)
            Positioned(
              right: 20, // قرارگیری در سمت راست
              top: 150, // تنظیم موقعیت عمودی
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2)),
                child: IconButton(
                  icon: Icon(Icons.arrow_forward_ios_rounded), // آیکون سمت راست
                  onPressed: _scrollRight, // متد اسکرول به راست
                ),
              ),
            ),
        ],
      ),
    );
  }

  ListView _buildListViewContent(List<MultipleBooks> listOption,
      ThemeData themeData, ScrollController controller, bool isDesktop) {
    return ListView.builder(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: listOption.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                listOption[index].bigImage,
                width: 250,
                height: 300,
                fit: BoxFit.cover, // اطمینان از پر کردن فضا
              ),
              SizedBox(width: 10), // فاصله بین تصاویر
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    listOption[index].SmallImage1,
                    width: 100,
                    height: 147,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 6),
                  Image.asset(
                    listOption[index].SmallImage2,
                    width: 100,
                    height: 147,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
