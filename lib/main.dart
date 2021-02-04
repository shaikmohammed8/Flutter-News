import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_new_app/screens/savedscreen/SavedScreen.dart';
import 'package:get/get.dart';
import './screens/aboutscreen/about_screen.dart';

import './screens/newsscreen/news_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.white));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 72.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            headline6: TextStyle(fontSize: 25.0, color: Colors.black),
            bodyText2: TextStyle(fontSize: 14.0),
          ),
          primaryColor: Colors.white),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> screens = [NewsScreen(), SavedScreen(), AboutScreen()];

  var title = "Flutter News";
  var selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {},
            icon: Image.asset("assets/images/menu.png"),
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search_outlined,
                  color: Colors.black,
                ),
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch());
                })
          ],
          centerTitle: true,
          title: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        body: Stack(children: [
          IndexedStack(index: selectedItem, children: screens),
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              elevation: 15,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              margin: EdgeInsets.only(bottom: 20, right: 30, left: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: BottomNavigationBar(
                  elevation: 0,
                  currentIndex: selectedItem,
                  unselectedItemColor: Colors.white,
                  unselectedIconTheme: Theme.of(context)
                      .iconTheme
                      .copyWith(size: 22, color: Colors.white),
                  selectedIconTheme: Theme.of(context)
                      .iconTheme
                      .copyWith(color: Colors.white, size: 30),
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  backgroundColor: Colors.black,
                  items: [
                    BottomNavigationBarItem(
                        icon: Image.asset("assets/images/home.png"),
                        activeIcon:
                            Image.asset("assets/images/home_outline.png"),
                        label: ""),
                    BottomNavigationBarItem(
                        icon: Image.asset("assets/images/like_outline.png"),
                        activeIcon: Image.asset("assets/images/like.png"),
                        label: ""),
                    BottomNavigationBarItem(
                        icon: Image.asset("assets/images/settings_outline.png"),
                        activeIcon: Image.asset("assets/images/settings.png"),
                        label: "")
                  ],
                  onTap: (index) {
                    setState(() {
                      print(index);
                      switch (index) {
                        case 1:
                          title = "Favorites";
                          break;
                        case 2:
                          title = "About";
                          break;
                        default:
                          title = "Flutter News";
                      }
                      selectedItem = index;
                    });
                  },
                ),
              ),
            ),
          ),
        ]));
  }
}

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [Icon(Icons.clear)];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Get.back();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text("data");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Text("");
  }
}
