import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data.dart';

///////////////////////////////////////////////////////////////////////
class onboardingData{
  final String imageNameD;
  final String imageNameM;
  final String description;
  final String title;
  onboardingData(  {required this.title,required this.description,required this.imageNameD,required this.imageNameM,});

}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class AutoScrollingPageView{
 final String images;
 AutoScrollingPageView({required this.images});

}
///////////////////////////////////////////////////////
class caruselpik{
  final String images;
  caruselpik({required this.images});

}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class ListOption{
  final String title;
  final String icons;
  ListOption({required this.icons,
  required this.title});
}
//*************************************************************************************************
class ListBook{
  final String bookImage;
  final String title;
  final String nameauthor;
  final String price;
  final String priceold;
  final String likenumber;
  ListBook({required this.bookImage,required this.title,
    required this.price,required this.likenumber,
    required this.nameauthor,required this.priceold});
}
//**********************************************************************************************************
class MultipleBooks{
  final String bigImage;
  final String SmallImage1;
  final String SmallImage2;
  MultipleBooks(  {required this.bigImage,required this.SmallImage1,required this.SmallImage2});
}
//*************************************************************************************************************
class AppDatabase {

  static List<ListOption> get ListOptions {
    return [
      ListOption(icons: 'assets/Images/Icons/bookicon.png', title: 'کتاب متنی'),
      ListOption(
          icons: 'assets/Images/Icons/soundicon.png', title: 'کتاب صوتی'),
      ListOption(
          icons: 'assets/Images/Icons/serialsoty.png', title: 'سریال صوتی'),
      ListOption(icons: 'assets/Images/Icons/padcast.png', title: 'پادکست'),
      ListOption(icons: 'assets/Images/Icons/fidiplus.png', title: 'فیدی پلاس'),
      ListOption(
          icons: 'assets/Images/Icons/bookfree.png', title: 'کتاب رایگان'),
      ListOption(icons: 'assets/Images/Icons/articleicon.png', title: 'مجله'),
      ListOption(icons: 'assets/Images/Icons/Amozesh.png', title: 'آموزشی'),
    ];
  }
  //************************************************************
  static List<ListBook> get ListBooks{
    return [
      ListBook(bookImage: 'assets/Images/Book/book9.jpg',
        title: 'چگونه باهرکسی صحبت کنیم',
        price: "۱۵٫۰۰۰", likenumber: "۴.۱(۸۳۰۲)",
        nameauthor: 'لیل لوندز', priceold: "۳۰۰۰",),
      ListBook(bookImage: 'assets/Images/Book/book10.jpg',
        title: 'عادت های اتمی',
        price: "۱۵٫۰۰۰", likenumber: "۴۱(۸۳)",
        nameauthor: 'جیمزکلیر', priceold: "۴۰۰۰",),
      ListBook(bookImage: 'assets/Images/Book/book5.jpg',
        title: 'مرگ ایوان ایلیج',
        price: "۱۵٫۰۰۰", likenumber: "۴.۹(۸۳۲)",
        nameauthor: 'لئوتولستوی', priceold: "۳۰۰۰۰",),
      ListBook(bookImage: 'assets/Images/Book/book6.jpg',
        title: 'تاملاتی برای انسان فانی',
        price: "۱۵٫۰۰۰", likenumber: "۴۱(۳۰۲)",
        nameauthor: 'الیوربرکمن', priceold: "۳۰۰",),

      ListBook(bookImage: 'assets/Images/Book/book7.jpg',
        title: 'وقتی نیجه گریست',
        price: "۱۵٫۰۰۰", likenumber: "۳۴(۸۵۵)",
        nameauthor: 'اروین یالوم', priceold: "۳۰۰۰۰",),
      ListBook(bookImage: 'assets/Images/Book/book8.jpg',
        title: 'کار عمیق',
        price: "۱۵٫۰۰۰", likenumber: "۴.۱(۸۹۹۷)",
        nameauthor: 'اروین یالوم', priceold: "۳۵۵۰۰",),
      ListBook(bookImage: 'assets/Images/Book/book4.jpg',
        title: 'ثروتمند ترین مرد بابل',
        price: "۱۵٫۰۰۰", likenumber: "۴۹(۸۳۰۲)",
        nameauthor: 'اروین یالوم', priceold: "۳۶۶۰",),

    ];
  }

  ///////////////////////////////////////////////////////////
  static List<AutoScrollingPageView> get ScrollingPageView {
    return [
      AutoScrollingPageView(images: 'assets/Images/ScrollPage/photo1.jpg'),
      AutoScrollingPageView(images: 'assets/Images/ScrollPage/photo2.jpg'),
      AutoScrollingPageView(images: 'assets/Images/ScrollPage/photo3.jpg'),
      AutoScrollingPageView(images: 'assets/Images/ScrollPage/photo4.jpg'),
    ];
  }

//////////////////////////////////////////////////////////////////////////
  static List<onboardingData> get onboardingItems {
    return [
      onboardingData(title: "به سلیقه تو:کتاب صوتی و متنی یا پادکست؟ ",
        description: " کتاب صوتی میپسندی یا متنی؟ رمان می پسندی یا روانشناسی؟ همه چیزاینجا هست. انتخاب کن و کتابخانه دیجیتال خودت رو بساز. ",
        imageNameD: 'assets/Images/onboarding/onbord-D1.jpg',
        imageNameM: 'assets/Images/onboarding/onbord-M1.jpg',

      ),

      onboardingData(title: "در دستگاه دلخوهِ تو ",
        description: "موبایل یا کامپیوتر؟ فیدیبوک یا تبلت؟ همزمان میتوانی با ۳ دستگاه مختلف به کتابخانه‌ات سربزنی و مطالعه کنی.",
        imageNameD: 'assets/Images/onboarding/onbord-D2.jpg',
        imageNameM: 'assets/Images/onboarding/onbord-M2.jpg',

      ),

      onboardingData(title: "به شیوۀ تو: خریدن یا دسترسی مدت دار؟ ",
        description: " دوست داری چطور کتابخانه‌ات را پرکنی ؟ می‌توانی نسخه دیحیتال کتاب‌های دلخواهت را بخری یا بامشترک شدن در فیدی‌پلاس، در طول زمان اشتراک به کتاب‌های دلخواهت دسترسی داشته باشی.",
        imageNameD: 'assets/Images/onboarding/onbord-D3.jpg',
        imageNameM: 'assets/Images/onboarding/onbord-M3.jpg',

      ),
    ];
  }
  static List<caruselpik> get caruselpikcher{
    return [
      caruselpik(images: 'assets/Images/carusel/caruselpik3.jpg'),
      caruselpik(images: 'assets/Images/carusel/caruselpik1.jpg'),
      caruselpik(images: 'assets/Images/carusel/caruselpik2.jpg'),

      caruselpik(images: 'assets/Images/carusel/caruselpik4.jpg'),
    ];
  }
  static List<MultipleBooks> get MultipleImageBooks{
    return [
      MultipleBooks(bigImage: 'assets/Images/Book/book100.png', SmallImage1: 'assets/Images/Book/book1-1.jpg', SmallImage2: 'assets/Images/Book/book5.jpg'),
      MultipleBooks(bigImage: 'assets/Images/Book/book101.png', SmallImage1: 'assets/Images/Book/book2.jpg',SmallImage2: 'assets/Images/Book/book6.jpg'),
      MultipleBooks(bigImage: 'assets/Images/Book/book102.png', SmallImage1: 'assets/Images/Book/book3.jpg',SmallImage2: 'assets/Images/Book/book7.jpg'),
      MultipleBooks(bigImage: 'assets/Images/Book/book100.png', SmallImage1: 'assets/Images/Book/book1-1.jpg',SmallImage2: 'assets/Images/Book/book8.jpg'),
      MultipleBooks(bigImage: 'assets/Images/Book/book101.png', SmallImage1: 'assets/Images/Book/book2.jpg',SmallImage2: 'assets/Images/Book/book5.jpg'),
      MultipleBooks(bigImage: 'assets/Images/Book/book102.png', SmallImage1: 'assets/Images/Book/book3.jpg',SmallImage2: 'assets/Images/Book/book6.jpg'),
      MultipleBooks(bigImage: 'assets/Images/Book/book100.png', SmallImage1: 'assets/Images/Book/book1-1.jpg',SmallImage2: 'assets/Images/Book/book7.jpg'),
      MultipleBooks(bigImage: 'assets/Images/Book/book101.png', SmallImage1: 'assets/Images/Book/book2.jpg',SmallImage2: 'assets/Images/Book/book8.jpg'),
      MultipleBooks(bigImage: 'assets/Images/Book/book102.png', SmallImage1: 'assets/Images/Book/book3.jpg',SmallImage2: 'assets/Images/Book/book6.jpg'),
      MultipleBooks(bigImage: 'assets/Images/Book/book100.png', SmallImage1: 'assets/Images/Book/book1-1.jpg',SmallImage2: 'assets/Images/Book/book7.jpg'),
      MultipleBooks(bigImage: 'assets/Images/Book/book101.png', SmallImage1: 'assets/Images/Book/book2.jpg',SmallImage2: 'assets/Images/Book/book8.jpg'),
      MultipleBooks(bigImage: 'assets/Images/Book/book102.png', SmallImage1: 'assets/Images/Book/book3.jpg',SmallImage2: 'assets/Images/Book/book6.jpg'),
    ];
  }
}