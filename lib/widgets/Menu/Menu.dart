import 'package:flutter/material.dart';
import '../../Screens/AudiobookPage/َAudiobook.dart';
import '../../Screens/EbookPage/EbookPage.dart';
import '../../Screens/HomeScreen/HomeScreen.dart';
import '../../Screens/MagazinePage/MagazinePage.dart';
import '../../Screens/UniversityPage/UniversityPage.dart';
import '../../Screens/fidiplus/fidiboplus.dart';

class Menu extends StatefulWidget {
  final Function(int index) onSelectedTap;
  final int selectedIndex; // این ایندکس صفحه فعلی است
  Menu({required this.onSelectedTap, required this.selectedIndex});

  @override
  _HoverMenuState createState() => _HoverMenuState();

}

class _HoverMenuState extends State<Menu> {
  String? _hoveredOption; // نگهداری گزینه‌ای که روی آن هاور شده
  OverlayEntry? _overlayEntry;
  final List<String> menuItems = [
    'خانه',
    'کتاب الکترونیک',
    'کتاب صوتی',
    'مجلات',
    'درسی و دانشگاهی',
    'فیدی پلاس'
  ];
  final List<String> audiobookItems = [
    'درام ',
    'فانتزی',
    'عاشقانه',
    'جنایی',
    'پلیسی',
    'طنز'
  ];

  void _showOverlay(BuildContext context, String option) {
    // تعیین محتوای متفاوت بر اساس گزینه منو
    Widget overlayContent;
    final overlay = Overlay.of(context);
    if (option == 'کتاب الکترونیک') {
      overlayContent = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('دسته‌های کتاب الکترونیک:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 10),
          Text('• داستان و رمان', style: TextStyle(fontSize: 14)),
          Text('• علمی و تخصصی', style: TextStyle(fontSize: 14)),
          Text('• تاریخ و سیاست', style: TextStyle(fontSize: 14)),
        ],
      );
    } else if (option == 'درسی و دانشگاهی') {
      overlayContent = Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(
                ' $option',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.menu_book_outlined,
                        color: Color(0xFF006666),
                      ),
                      Text('داستان و رمان خارجی'),
                      Icon(Icons.keyboard_arrow_left)
                    ],
                  ),
                  ...List.generate(
                    audiobookItems.length,
                    // تعداد تکرار برابر با طول لیست
                        (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: Text(
                        audiobookItems[index],
                        // خواندن مقدار از لیست
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.menu_book_outlined,
                        color: Color(0xFF006666),
                      ),
                      Text('داستان و رمان فارسی'),
                      Icon(Icons.keyboard_arrow_left)
                    ],
                  ),
                  ...List.generate(
                    audiobookItems.length,
                    // تعداد تکرار برابر با طول لیست
                        (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: Text(
                        audiobookItems[index],
                        // خواندن مقدار از لیست
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.psychology,
                        color: Color(0xFF006666),
                        size: 40,
                      ),
                      Icon(Icons.keyboard_arrow_left),
                      Text('روانشناسی'),
                    ],
                  ),
                  ...List.generate(
                    audiobookItems.length,
                    // تعداد تکرار برابر با طول لیست
                        (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: Text(
                        audiobookItems[index],
                        // خواندن مقدار از لیست
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    } else {
      overlayContent = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('محتوای پیش‌فرض برای $option:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      );
    }

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        right: 20,
        top: 140,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: overlayContent,
          ),
        ),
      ),
    );

    overlay.insert(_overlayEntry!);
  }


  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _onItemTap(String option, int index) {
    widget.onSelectedTap(index); // بروزرسانی selectedIndex
    Widget page;
    switch (option) {
      case 'خانه':
        page = Home();
        break;
      case 'کتاب الکترونیک':
        page = EbookPage();
        break;
      case 'کتاب صوتی':
        page = AudiobookPage();
        break;
      case 'مجلات':
        page = MagazinePage();
        break;
      case 'درسی و دانشگاهی':
        page = UniversityPage();
        break;
      case 'فیدی پلاس':
        page = FidiPlusPage();
        break;
      default:
        page = Home();
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final option = menuItems[index];
                bool isSelected = index == widget.selectedIndex; // بررسی آیا این آیتم انتخاب شده است یا خیر
                return MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      _hoveredOption = option;//   اون گذینه ای که انتخاب شده اینجا میره توی متغییر hoveredOption_
                    });
                  // onEnter: (_) {
                  //          context.read<MenuBloc>().add(MouseEnterEvent(option));

                    // شرط برای نمایش فقط دو گزینه خاص
                    if (option == 'کتاب الکترونیک' ||
                        option == 'درسی و دانشگاهی') {
                      _showOverlay(context, option);
                    }
                  },
                  onExit: (_) {
                    setState(() {
                      _hoveredOption = null;
                    });
                    _removeOverlay();
                  },

                  child: GestureDetector(
                    onTap: () {
                      _onItemTap(option, index); // ارسال ایندکس به تابع onTap
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            option,
                            style: TextStyle(
                              fontSize: 18,
                              color: isSelected ? Color(0xFF00A5BA) : Colors.black87, // تغییر رنگ انتخاب شده
                              fontWeight: _hoveredOption == option || isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: 5),
                          if (_hoveredOption == option || isSelected)
                            Container(
                              width: option.length * 10.0,
                              height: 3,
                              color: Color(0xFF00A5BA),
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

