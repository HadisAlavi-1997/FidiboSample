import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart'; // برای استفاده از آیکون‌ها

class Button extends StatefulWidget {
  final double verticalSize;
  final double horizontalSize;
  final String? lable;
  final Icon icon;

  Button({
    required this.horizontalSize,
    required this.verticalSize,
    required this.icon,
    this.lable,
  });

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<Button> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final themeData=Theme.of(context);
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: Container(
        width: widget.horizontalSize, // عرض ثابت دکمه
        height: widget.verticalSize, // ارتفاع ثابت دکمه
        child: ElevatedButton(
          onPressed: () {
            print("Button Pressed");
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.white,//وقتی موس میره روش به این رنگ در بیاد

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(
                color: _isHovered ? Color(0xC302A5BA) :Colors.grey ,
                width: 0.5,
              ),
            ),
             padding: EdgeInsets.zero, // حذف پدینگ اضافی
          ),
          child: widget.lable != null
              ? Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.icon,
              SizedBox(width: 8), // فاصله بین آیکون و متن
              Text(widget.lable!,style:themeData.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 16),),
            ],
          )
              : Center(
            child: widget.icon, // آیکون دقیقاً وسط دکمه قرار می‌گیرد
          ),
        ),
      ),
    );
  }
}

