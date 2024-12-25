import 'package:fidibo/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Navigation extends StatelessWidget {
  final Function(int index) onSelectedTap;
  final int selectedIndex;

  const Navigation(
      {Key? key,
        required this.onSelectedTap,
        required this.selectedIndex
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    const  colorfont=Color(0x9B100A0A);
    return Container(
      height: 80,
     decoration: BoxDecoration(

       color: themeData.colorScheme.surface,
     ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavigationItem(iconFileName: Icon(Ionicons.home_outline,color: colorfont,),
              activeIconFileName:Icon (Ionicons.home),
              title: 'خانه', onTap: () {
                onSelectedTap(homeIndex);
              },
              isActive: selectedIndex == homeIndex, ),
            //****************************
            BottomNavigationItem(iconFileName:Icon(Icons.panorama_horizontal_rounded,color: colorfont),
              activeIconFileName:Icon(Icons.panorama_horizontal_select,color:Colors.deepPurple),
              title: 'فیدی پلاس', onTap: () {
                onSelectedTap(fidiplusIndex);
              },
              isActive: selectedIndex == fidiplusIndex, ),
            BottomNavigationItem(iconFileName:Icon(Icons.category_outlined,color: colorfont),
              activeIconFileName:Icon(Icons.category),
              title: 'دسته ها', onTap: () {
                onSelectedTap(categoryIndex);
              },
              isActive: selectedIndex == categoryIndex, ),
            BottomNavigationItem(iconFileName:Icon(Ionicons.library_outline,color: colorfont),
              activeIconFileName:Icon(Ionicons.library),
              title: 'کتابخانةمن', onTap: () {
                onSelectedTap(LibraryIndex);
              },
              isActive: selectedIndex == LibraryIndex, ),

          ],
        ),
      ),
    );
  }
}
class BottomNavigationItem extends StatelessWidget {
  final Icon iconFileName;
  final Icon activeIconFileName;
  final String title;
  final bool isActive;
  final Function() onTap;

  const BottomNavigationItem(
      {Key? key,
        required this.iconFileName,
        required this.activeIconFileName,
        required this.title,
        required this.onTap,
        required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Expanded( // استفاده از Expanded به جای Flexible
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isActive?activeIconFileName:iconFileName  ,
            const SizedBox(
              height: 4,
            ),

            Text(
              title,
              style: themeData.textTheme.labelSmall!.apply(
                  color: isActive
                      ? Color(0x9B100A0A)
                      :  Colors.grey,
            ),
            )],
        ),
      ),
    );
  }
}