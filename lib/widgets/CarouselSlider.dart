import 'package:flutter/cupertino.dart';

import '../Carusel/carousel_slider.dart';

CarouselSlider buildCarouselSlider(carusel) {
  return CarouselSlider.builder(
    itemCount: carusel.length,
    itemBuilder: (BuildContext context, int index, int realIndex) {
      return Container(
        margin: EdgeInsets.fromLTRB(4, 10, 10, 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            carusel[index].images,
            fit: BoxFit.cover,
            width: 150,
            height: 150,
          ),
        ),
      );
    },
    options: CarouselOptions(
        scrollDirection: Axis.horizontal,
        viewportFraction: 0.65,
        // تنظیم برای دسکتاپ (برای نمایش بزرگتر هر آیتم)
        aspectRatio: 2.5,
        // نسبت ابعاد برای دسکتاپ
        initialPage: 0,
        disableCenter: true,
        // این اگرtrue باشه enlargeStrategy کارخواهد کرد
        enableInfiniteScroll: false,
        // غیرفعال کردن اسکرول بی‌پایان
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        scrollPhysics: BouncingScrollPhysics()),
  );
}