import 'package:flutter/material.dart';

import '../data/data.dart';
import '../gen/assets.gen.dart';

Padding buildLiskBook(BuildContext context) {
  final themeData = Theme.of(context);
  final listbooks = AppDatabase.ListBooks;
  final isDesktop = MediaQuery.of(context).size.width > 800;

  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 20, 10, 1),
    child: Container(
      height: isDesktop ? 400 : 270,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: listbooks.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
              child: Stack(
                children: [
                  Container(
                    width: isDesktop ? 220 : 135,
                    decoration: BoxDecoration(
                      color: themeData.colorScheme.surface,
                      borderRadius: BorderRadius.circular(isDesktop ? 10 : 3),
                    ),
                    child: Column(
                      mainAxisAlignment: isDesktop
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Positioned.fill(
                              left: 16,
                              top: 35,
                              right: 20,
                              bottom: 6,
                              child: Container(
                                decoration: const BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      blurRadius: 5, color: Color(0xaa0D253C))
                                ]),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(isDesktop ? 0 : 5,
                                  isDesktop ? 15 : 10, isDesktop ? 0 : 5, 8),
                              child: Image.asset(
                                listbooks[index].bookImage,
                                width: isDesktop?130:100,
                                height:isDesktop? 180:140,
                              ),
                            ),
                          ],
                        ),

                        // محتوا مخصوص موبایل
                        if (!isDesktop) ...[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                            child: Text(
                              listbooks[index].title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: themeData.textTheme.labelMedium!.copyWith(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Assets.images.icons.epub
                                  .image(width: 12, height: 12),
                              SizedBox(width: 3),
                              Text(
                                listbooks[index].nameauthor,
                                style: themeData.textTheme.labelSmall,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Assets.images.icons.star
                                  .image(width: 12, height: 12),
                              SizedBox(width: 3),
                              Text(
                                listbooks[index].likenumber,
                                style: themeData.textTheme.labelSmall!.copyWith(
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                listbooks[index].priceold,
                                style: themeData.textTheme.labelSmall!.copyWith(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 12,
                                  decoration: TextDecoration
                                      .lineThrough, // کشیدن خط روی متن
                                ),
                              ),
                              Text(listbooks[index].price,
                                  style:
                                      themeData.textTheme.labelSmall!.copyWith(
                                    color: Colors.black,
                                  )),
                              Text(
                                "ت",
                                style: themeData.textTheme.labelSmall!.copyWith(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          )
                        ],
                      ],
                    ),
                  ),
                  if (isDesktop)
                    Positioned(
                      bottom: 0,
                      child: Stack(children: [
                        Container(
                          width: 220,
                          height: 180,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                        ),
                       Padding(
                         padding: const EdgeInsets.fromLTRB(0, 10, 10, 5),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(
                               listbooks[index].title,
                               maxLines: 1,
                               style: themeData.textTheme.bodyLarge!.copyWith(
                                 color: Colors.black,
                               ),
                             ),
                             SizedBox(height: 10,),
                             Text(
                               listbooks[index].nameauthor,
                               style: themeData.textTheme.bodyMedium,
                             ),
                             SizedBox(height: 10,),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                              Icon(Icons.star,color: Colors.amber,),
                                 SizedBox(width: 3),
                                 Text(
                                   listbooks[index].likenumber,
                                   style: themeData.textTheme.labelSmall!.copyWith(
                                     fontWeight: FontWeight.w200,
                                   ),
                                 ),
                               ],
                             ),
                             SizedBox(height: 30),
                             Container(
                               height: 1, // ضخامت خط
                               color: Color(0x77c6cde1),
                                width: 200,
                               margin: EdgeInsets.symmetric(horizontal: 2), // فاصله از طرفین
                             ),

                             Padding(
                               padding: const EdgeInsets.fromLTRB(0, 20, 100, 5),
                               child: Row(

                                 children: [
                                   Text(listbooks[index].price,
                                       style:
                                       themeData.textTheme.labelSmall!.copyWith(
                                         color: Colors.black,
                                       )),
                                   Text(
                                     "تومان",
                                     style: themeData.textTheme.bodySmall!.copyWith(
                                       color:  Color(0xa90e0f15) ,
                                       fontSize: 14,
                                     ),
                                   )
                                 ],
                               ),
                             )

                           ],
                         ),
                       )

                      ]),
                    ),
                ],
              ));
        },
      ),
    ),
  );
}

// Padding buildLiskBook( BuildContext context) {
//   final themeData = Theme.of(context);
//   final listbooks = AppDatabase.ListBooks;
//   final isDesktop = MediaQuery.of(context).size.width > 600;
//   return Padding(
//     padding: const EdgeInsets.fromLTRB(0, 20, 10, 1),
//     child: Container(
//       height:isDesktop?400: 270,
//       child: ListView.builder(
//         physics: const BouncingScrollPhysics(),
//         scrollDirection: Axis.horizontal,
//         itemCount: listbooks.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
//             child: Container(
//               width:isDesktop?220: 135,
//               decoration: BoxDecoration(
//                 color: themeData.colorScheme.surface,
//                 borderRadius: BorderRadius.circular(isDesktop?10:3),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Stack(children: [
//                     Positioned.fill(
//                         left: 16,
//                         top: 35,
//                         right: 20,
//                         bottom: 6,
//                         child: Container(
//                           decoration: const BoxDecoration(boxShadow: [
//                             BoxShadow(blurRadius: 5, color: Color(0xaa0D253C))
//                           ]),
//                         )),
//                     Container(
//                       padding: EdgeInsets.fromLTRB(5, 10, 5, 8),
//                       child: Image.asset(listbooks[index].bookImage,
//                           width: 125, height: 150),
//                     ),
//
//
//                     if(isDesktop)
//                       Positioned(
//
//
//                           child: Container(
//                         width: 220,
//                         height: 180,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                             borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))
//                         ),
//                       ))
//
//                   ]),
//                   if(!isDesktop)
//                 Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
//                       child: Text(
//                         listbooks[index].title,
//                         overflow: TextOverflow.ellipsis,
//                         // برای نمایش نقطه چین
//                         maxLines: 1,
//                         // محدود کردن تعداد خطوط
//                         style: themeData.textTheme.labelMedium!
//                             .copyWith(color: Colors.black),
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Assets.images.icons.epub.image(width: 12, height: 12),
//                         SizedBox(
//                           width: 3,
//                         ),
//                         Text(
//                           listbooks[index].nameauthor,
//                           style: themeData.textTheme.labelSmall,
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Assets.images.icons.star.image(width: 12, height: 12),
//                         SizedBox(
//                           width: 3,
//                         ),
//                         Text(
//                           listbooks[index].likenumber,
//                           style: themeData.textTheme.labelSmall!
//                               .copyWith(fontWeight: FontWeight.w200),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           listbooks[index].priceold,
//                           style: themeData.textTheme.labelSmall!.copyWith(
//                             fontWeight: FontWeight.w200, fontSize: 12,
//                             decoration:
//                             TextDecoration.lineThrough, // کشیدن خط روی متن
//                           ),
//                         ),
//                         Text(listbooks[index].price,
//                             style: themeData.textTheme.labelSmall!.copyWith(
//                               color: Colors.black,
//                             )),
//                         Text(
//                           "ت",
//                           style: themeData.textTheme.labelSmall!
//                               .copyWith(color: Colors.black, fontSize: 16),
//                         )
//                       ],
//                     )
//                   ],
//                 )
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     ),
//   );
// }
