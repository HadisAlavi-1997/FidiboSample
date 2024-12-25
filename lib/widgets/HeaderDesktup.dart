import 'package:fidibo/widgets/textfild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../gen/assets.gen.dart';
import 'Button.dart';
import 'Menu/Menu.dart';

class Header extends StatelessWidget {
  final TextEditingController searchController;
  final Function(int index) onSelectedTap;
  final int selectedIndex;
  const Header({required this.searchController, required this.onSelectedTap, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    final isDesktop=MediaQuery.of(context).size.width>800;
    return Column(

      children: [
        Padding(
          padding:   EdgeInsets.fromLTRB(isDesktop?100:5, 0, isDesktop?100:5, 0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 20, 0),
                child: Assets.images.icons.fidiboDicon.image(width: 120, height: 80),
              ),
              Expanded(
                child: buildTextField(
                  searchController,
                  textFieldColor: Color(0xFFEFF2F4),
                  borderRadius: 10,
                ),
              ),
              _buildHeaderButtons(),
            ],
          ),
        ),
         Expanded(child: Menu(onSelectedTap:  onSelectedTap,
           selectedIndex:  selectedIndex,)),
      ],
    );
  }

  Widget _buildHeaderButtons() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
          child: Button(
            horizontalSize: 130,
            verticalSize: 50,
            icon: Icon(
              Ionicons.library_outline,
              color: Color(0xC302A5BA),
            ),
            lable: 'کتابخانه من',
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Button(
            horizontalSize: 160,
            verticalSize: 50,
            icon: Icon(
              Ionicons.person_outline,
              color: Color(0xC32A2C2C),
            ),
            lable: 'محدثه علوی',
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 15, 0),
          child: Button(
            horizontalSize: 50,
            verticalSize: 50,
            icon: Icon(
              Ionicons.bag_outline,
              color: Color(0xC32A2C2C),
            ),
          ),
        ),
      ],
    );
  }
}
