import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/" : (context) => HomePageSreen(),
        "story_screen" : (context) => Story_Screen(),

      },
    );
  }
}


class HomePageSreen extends StatefulWidget {
  const HomePageSreen({Key? key}) : super(key: key);

  @override
  State<HomePageSreen> createState() => _HomePageSreenState();
}

class _HomePageSreenState extends State<HomePageSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/imageLion.png"),
            fit: BoxFit.fill
          )
        ),
        child: Column(
          children: [
            SizedBox(height: 36,),
            SizedBox(
              height: 330,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 36,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 250,
                          width: 500,
                          child: Stack(
                            children: [
                              Container(
                                // height: 250,
                                // width: 500,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/lion_has_a_plan_min-1-1.png"), //"assets/images/background2.png"
                                        fit: BoxFit.fill
                                    ),
                                    borderRadius: BorderRadius.circular(24)
                                ),
                              ),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(24),
                                  onTap: () {
                                    Navigator.of(context).pushNamed("story_screen");
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12,),
                        Container(
                          width: 500,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(229, 226, 199, 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Белова Алла: Лев знает что делать",
                                  style: TextStyle(
                                      color: Color.fromRGBO(95, 79, 110, 1),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20),),

                              ],
                            ),
                          )
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<String> images = [
  "assets/images/lion_has_a_plan_min-1-1.png",
  "assets/images/lion_has_a_plan_min-2-1.png",
  "assets/images/lion_has_a_plan_min-3-1.png",
  "assets/images/lion_has_a_plan_min-4-1.png",
  "assets/images/lion_has_a_plan_min-5-1.png",
  "assets/images/lion_has_a_plan_min-6-1.png",
  "assets/images/lion_has_a_plan_min-7-1.png",
  "assets/images/lion_has_a_plan_min-8-1.png",
  "assets/images/lion_has_a_plan_min-9-1.png",
  "assets/images/lion_has_a_plan_min-10-1.png",
  "assets/images/lion_has_a_plan_min-11-1.png",
  "assets/images/lion_has_a_plan_min-12-1.png",
  "assets/images/lion_has_a_plan_min-13-1.png",
  "assets/images/lion_has_a_plan_min-14-1.png",
  "assets/images/lion_has_a_plan_min-15-1.png",
  "assets/images/lion_has_a_plan_min-16-1.png",
  "assets/images/lion_has_a_plan_min-17-1.png",
  "assets/images/lion_has_a_plan_min-18-1.png",
  "assets/images/lion_has_a_plan_min-19-1.png",
];


class Story_Screen extends StatefulWidget {
  const Story_Screen({Key? key}) : super(key: key);

  @override
  State<Story_Screen> createState() => _Story_ScreenState();
}

class _Story_ScreenState extends State<Story_Screen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _prewPage () {
    _pageController.previousPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease
    );
  }

  _nexePage () {
    _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease
    );
  }

  List<Widget> getList() {
    List<Widget> widgetList = [];
    for (var index = 0; index <images.length; index++) {
      widgetList.add(
        ListView(
          children: [
            Image(image: AssetImage(images[index]), fit: BoxFit.fitWidth,),
          ],
        ),
      );
    }
    return widgetList;
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: getList()
            ),
            Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                onTap: () {
                   Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.6),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
                      child: Text("Назад",style: TextStyle(color: Colors.black),),
                    ),
                  ),
                )
              )
            ),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: _prewPage,
                    child: Padding(
                      padding: EdgeInsets.all(48),
                      child: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.6),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Icon(Icons.arrow_back_outlined),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: _nexePage,
                    child: Padding(
                      padding: EdgeInsets.all(48),
                      child: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.6),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Icon(Icons.arrow_forward_outlined),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )
      )
    );
  }
}
