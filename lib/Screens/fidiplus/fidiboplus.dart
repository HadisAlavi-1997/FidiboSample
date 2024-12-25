import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/HeaderDesktup.dart';

class FidiPlusPage extends StatefulWidget {
  const FidiPlusPage({super.key});

  @override
  State<FidiPlusPage> createState() => _FidiPlusPageState();
}

class _FidiPlusPageState extends State<FidiPlusPage> {
  @override
  Widget build(BuildContext context) {


    int selectedIndex = 5; // ایندکس صفحه جاری

    void onSelectedTap(int index) {
      setState(() {
        selectedIndex = index; // بروزرسانی ایندکس صفحه جاری
      });
    }

    final TextEditingController _searchControllerDesctup = TextEditingController();
    return Scaffold(
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
      ]
    )
    );
  }
}
