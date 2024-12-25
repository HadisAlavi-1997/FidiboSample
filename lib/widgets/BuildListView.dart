import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/data.dart';

class ScrollableListView extends StatefulWidget {
  final List<ListOption> listOption;
  final ThemeData themeData;

  const ScrollableListView({
    Key? key,
    required this.listOption,
    required this.themeData,
  }) : super(key: key);

  @override
  _ScrollableListViewState createState() => _ScrollableListViewState();
}

class _ScrollableListViewState extends State<ScrollableListView> {
  late final ScrollController _scrollController;
  bool _canScrollLeft = false;
  bool _canScrollRight = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_updateScrollButtons);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateScrollButtons);
    _scrollController.dispose();
    super.dispose();
  }

  void _updateScrollButtons() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;

    setState(() {
      _canScrollLeft =
          currentScroll > 0; // وقتی اسکرول بیشتر از 0 باشد، دکمه چپ فعال است
      _canScrollRight = currentScroll <
          maxScroll; // وقتی اسکرول کمتر از انتها باشد، دکمه راست فعال است
    });
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 200,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 200,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 10, 30),
      child: Row(
        children: [
          if (isDesktop && _canScrollLeft)
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: _scrollLeft,
            ),
          Expanded(
            child: Container(
              height: 80,
              child: _buildListViewContent(
                widget.listOption,
                widget.themeData,
                _scrollController,
                isDesktop,
              ),
            ),
          ),
          if (isDesktop && _canScrollRight)
            IconButton(
              icon: Icon(Icons.arrow_forward_ios_rounded),
              onPressed: _scrollRight,
            ),
        ],
      ),
    );
  }

  ListView _buildListViewContent(List<ListOption> listOption,
      ThemeData themeData, ScrollController controller, bool isDesktop) {
    return ListView.builder(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: listOption.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
          child: Container(
            height: isDesktop ? 30 : 80,
            width: isDesktop ? 200 : 80,
            decoration: BoxDecoration(
              color: isDesktop ? Colors.white : themeData.colorScheme.surface,
              borderRadius: BorderRadius.circular(isDesktop ? 10 : 3),
            ),
            child: isDesktop
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(listOption[index].icons,
                          width: 25, height: 25),
                      SizedBox(width: 10),
                      Text(
                        listOption[index].title,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(listOption[index].icons,
                          width: 25, height: 25),
                      Text(listOption[index].title),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
