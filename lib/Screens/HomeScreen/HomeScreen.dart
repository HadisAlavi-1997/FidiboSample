import 'package:flutter/material.dart';
import '../../data/data.dart';
import '../../gen/assets.gen.dart';
import '../../widgets/AutoScrollingPage.dart';
import '../../widgets/BuildListView.dart';
import '../../widgets/CarouselSlider.dart';
import '../../widgets/HeaderDesktup.dart';
import '../../widgets/LineTextSaparator.dart';
import '../../widgets/buildListBook.dart';
import '../../widgets/multipleBookListView.dart';
import '../../widgets/textfild.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // بررسی عرض صفحه نمایش
          if (constraints.maxWidth > 800) {
            // اگر عرض صفحه بیشتر از 800 باشد، ویجت‌ها به صورت افقی نمایش داده می‌شوند
            return  DesktopScreen();
          } else {
            // اگر عرض صفحه کمتر از 800 باشد، ویجت‌ها به صورت عمودی نمایش داده می‌شوند
            return PhoneScreen();
          }
        },
      ),
     
    );
  }
}

//PhoneScreen__________________________________________________________________________________-
class PhoneScreen extends StatelessWidget {
  const PhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final listOption = AppDatabase.ListOptions;
    final listbooks = AppDatabase.ListBooks;
    final carusel = AppDatabase.caruselpikcher;

    TextEditingController _searchController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: themeData.colorScheme.surface,
            expandedHeight: 160.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: buildTextField(_searchController),
                  ),
                ],
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Assets.images.icons.fidibotext.image(width: 80, height: 80),
                Row(
                  children: [
                    InkWell(
                      child: Assets.images.icons.bageIcon
                          .image(width: 20, height: 20),
                      onTap: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Container(
                        width: 1,
                        height: 20,
                        color: Color(0xD8CFC7B0),
                      ),
                    ),
                    InkWell(
                      child: Assets.images.icons.userIcon2
                          .image(width: 20, height: 20),
                      onTap: () {},
                    )
                  ],
                ),
              ],
            ),
          ),
          // نمایش یکبار Test در CustomScrollView
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: AutoScrollingPage (carouselHeight: 220,),
            ),
          ),

          SliverToBoxAdapter(
            child: ScrollableListView(listOption:listOption, themeData: themeData,),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "پرفروش های الکترونیک",
                    style:
                        themeData.textTheme.titleMedium!.copyWith(fontSize: 20),
                  ),
                  Row(
                    children: [
                      Text(" همه",
                          style: themeData.textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Color(0xFF0E2FDD),
                          )),
                      Icon(
                        Icons.keyboard_arrow_left_sharp,
                        color: Color(0xFF0E2FDD),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: buildLiskBook( context)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 25, 10, 10),
              child: Text(
                "جدید ترین ها",
                style: themeData.textTheme.titleMedium!.copyWith(fontSize: 20),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: buildCarouselSlider(carusel),
          )
        ],
      ),
    );
  }




}


//DesktopScreen________________________________________________________________________
class DesktopScreen extends StatefulWidget {
  const DesktopScreen({super.key});

  @override
  State<DesktopScreen> createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen> {
  @override
  Widget build(BuildContext context) {



    int selectedIndex = 0; // ایندکس صفحه جاری

    void onSelectedTap(int index) {
      setState(() {
        selectedIndex = index; // بروزرسانی ایندکس صفحه جاری
      });
    }


    final themeData = Theme.of(context);
    final listOption = AppDatabase.ListOptions;
    final TextEditingController _searchControllerDesctup = TextEditingController();
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final isDesktop = width > 800;
    return Scaffold(
      backgroundColor: themeData.colorScheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 130.0,
            floating: false,
            pinned: true,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Header(searchController: _searchControllerDesctup, onSelectedTap: onSelectedTap, // ارسال ایندکس جدید
                selectedIndex: selectedIndex, // ارسال ایندکس فعلی),
            ),
          ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: isDesktop ? 0 : 20),
              child: AutoScrollingPage(carouselHeight: 320),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(100, 20, 100, 30),
              child: ScrollableListView(
                listOption: listOption,
                themeData: themeData,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: buildLineSeparator(
                  themeData, context, " محبوب های خواندنی شب چلّه")
          ),

          SliverToBoxAdapter(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(100, 20, 100, 30),
                  child: buildLiskBook(context))
          ),
          SliverToBoxAdapter(
              child: buildLineSeparator(
                  themeData, context, "مجموعه مثل ها و قصه ها")
          ),
          SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(100, 20, 100, 30),
                child: Multiplebooklistview(listOption:AppDatabase.MultipleImageBooks , themeData: themeData,),
              ),
          ),
        ],
      ),
    );
  }
}

