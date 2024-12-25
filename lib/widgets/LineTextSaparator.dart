import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Padding buildLineSeparator(ThemeData themeData, BuildContext context, String textSeparator) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10), // فاصله‌های دلخواه
    child: Row(
      children: [
        // متن اصلی
        Text(
          textSeparator,
          style: themeData.textTheme.labelLarge!.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
        // فاصله بین متن و خط
        SizedBox(width: 10),
        // خط و محتوای سمت راست
        Expanded(
          child: Row(
            children: [
              // خط
              Expanded(
                child: Container(
                  height: 1, // ارتفاع خط
                  color: Colors.grey, // رنگ خط
                ),
              ),
              // فاصله بین خط و متن "همه"
              SizedBox(width: 10),
              // متن "همه" و آیکون
              Text("همه"),
              SizedBox(width: 5),
              const Icon(Icons.arrow_forward_ios_rounded, size: 15),
            ],
          ),
        ),
      ],
    ),
  );
}
