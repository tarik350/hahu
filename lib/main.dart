import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hahu/constants/app_colors.dart';
import 'package:hahu/utils/widgets/restaurant_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ScreenUtilInit(
          designSize: Size(360, 800),
          minTextAdapt: true,
          splitScreenMode: true,
          child: MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.home),
                      Text(
                        "Home",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22.sp),
                      )
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(100)),
                    width: 28.w,
                    height: 28.w,
                  )
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    constraints:
                        const BoxConstraints(minWidth: 100, maxWidth: 160),
                    decoration: BoxDecoration(border: Border.all(width: 1)),
                    child: const Row(
                      children: [
                        Icon(Icons.arrow_drop_down_circle),
                        Text("Near by Resturant"),
                      ],
                    ),
                  ),
                  const Icon(Icons.filter_alt)
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return const ResturantCard(
                        imageLink:
                            "https://img.freepik.com/free-photo/exploding-burger-with-vegetables-melted-cheese-black-background-generative-ai_157027-1734.jpg?size=626&ext=jpg&ga=GA1.1.2082370165.1716336000&semt=sph",
                        title: 'Burger King',
                        subscriptionStarterPrice: 1299,
                        rating: 3.6,
                        avarageCookingTime: "25 - 30 min",
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
