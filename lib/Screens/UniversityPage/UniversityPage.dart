import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/HeaderDesktup.dart';

class UniversityPage extends StatefulWidget {
  const UniversityPage({super.key});

  @override
  State<UniversityPage> createState() => _UniversityPageState();
}

class _UniversityPageState extends State<UniversityPage> {
  @override
  Widget build(BuildContext context) {

    int selectedIndex = 4; // ایندکس صفحه جاری

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
