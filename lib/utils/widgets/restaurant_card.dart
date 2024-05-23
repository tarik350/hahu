import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hahu/constants/app_colors.dart';

class ResturantCard extends StatefulWidget {
  final String title;
  final double rating;
  final String avarageCookingTime;
  final int subscriptionStarterPrice;
  final String imageLink;

  const ResturantCard(
      {super.key,
      required this.title,
      required this.imageLink,
      required this.rating,
      required this.avarageCookingTime,
      required this.subscriptionStarterPrice});

  @override
  State<ResturantCard> createState() => _ResturantCardState();
}

class _ResturantCardState extends State<ResturantCard> {
  final _pageController = PageController();
  final List<Widget> pages = [
    Image.network(
      "https://img.freepik.com/free-photo/exploding-burger-with-vegetables-melted-cheese-black-background-generative-ai_157027-1734.jpg?size=626&ext=jpg&ga=GA1.1.2082370165.1716336000&semt=sph",
      fit: BoxFit.cover,
    ),
    Image.network(
      "https://img.freepik.com/free-psd/food-menu-delicious-pizza-web-banner-template_106176-419.jpg",
      fit: BoxFit.cover,
    ),
    Image.network(
      "https://img.freepik.com/premium-photo/lasagna-basil-banner-free-space-text-mockup-fast-food-top-view-empty-professional-phonography_997345-18900.jpg",
      fit: BoxFit.cover,
    ),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("parent clicked");
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurStyle: BlurStyle.inner,
              color: Colors.black.withOpacity(.04),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 5), // Position the shadow
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100.h,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(
                      5,
                    ),
                    topLeft: Radius.circular(5)),
                child: Stack(
                  children: [
                    PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      scrollDirection: Axis.horizontal,
                      children: pages,
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (_currentIndex != 0) {
                                  _pageController.animateToPage(
                                      _currentIndex - 1,
                                      duration:
                                          const Duration(milliseconds: 100),
                                      curve: Curves.bounceInOut);
                                }
                              },
                              child: Container(
                                width: 40.w,
                                height: 40.w,
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(.5),
                                    borderRadius: BorderRadius.circular(100)),
                                child: const Icon(
                                  Icons.arrow_back_ios_sharp,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (_currentIndex != pages.length - 1) {
                                  _pageController.animateToPage(
                                      _currentIndex + 1,
                                      duration:
                                          const Duration(milliseconds: 100),
                                      curve: Curves.bounceInOut);
                                }
                              },
                              child: Container(
                                width: 40.w,
                                height: 40.w,
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(.5),
                                    borderRadius: BorderRadius.circular(100)),
                                child: const Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5.h),
                      height: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(pages.length, (index) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            margin: const EdgeInsets.all(2),
                            width: 8.w,
                            height: 8.w,
                            decoration: BoxDecoration(
                                color: _currentIndex == index
                                    ? Colors.pinkAccent
                                    : Colors.grey.withOpacity(.8),
                                borderRadius: BorderRadius.circular(100)),
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),
              // child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (context, index) {
              //       return ClipRRect(
              //         borderRadius: const BorderRadius.only(
              //             topRight: Radius.circular(5),
              //             topLeft: Radius.circular(5)),
              //         child: Image.network(
              //           imageLink,
              //           height: 100,
              //           width: double.infinity,
              //           fit: BoxFit.cover,
              //         ),
              //       );
              //     }),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26.sp,
                        fontFamily: "Raleway"),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 28.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.h, vertical: 4.h),
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            Text(
                              widget.rating.toString(),
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.lightGrey),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20.r,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 4.h,
                      ),
                      Container(
                        height: 28.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.h, vertical: 4.h),
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Row(
                            children: [
                              Icon(
                                Icons.punch_clock_outlined,
                                color: Colors.pink,
                                size: 15.r,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                widget.avarageCookingTime,
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.lightGrey),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Container(
                        height: 28.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.h, vertical: 4.h),
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "2.4 KM",
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: AppColors.lightGrey),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 4.h,
                      ),
                      Container(
                        height: 28.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.h, vertical: 4.h),
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.car_crash,
                              color: Colors.pink,
                              size: 15.r,
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              "12min",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.lightGrey),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Subscription starting from ",
                        style: TextStyle(
                            color: AppColors.lightGrey,
                            fontStyle: FontStyle.italic,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        "${widget.subscriptionStarterPrice} birr",
                        style: TextStyle(
                            color: Colors.pinkAccent,
                            fontSize: 10.sp,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     print("subscribe");
                  //   },
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 30, vertical: 4),
                  //     decoration: BoxDecoration(
                  //         // border:
                  //         // Border.all(width: 1, color: Colors.pinkAccent),
                  //         color: Colors.pinkAccent,
                  //         borderRadius: BorderRadius.circular(5)),
                  //     child: const Text(
                  //       "Subscirbe",
                  //       style: TextStyle(
                  //           color: Colors.white, fontWeight: FontWeight.w500),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
