import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

// Color 1 #5B44DA
// Color 2 #7B71F6

const pink = Color(0xFF5B44DA);
const lightPink = Color(0xFF7B71F6);
const posts = [
  {
    'userImage': 'assets/1.jpeg',
    'username': 'Adrian Schultz',
    'title': 'Cleaning And Organizing Your Computer',
    'description':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus aliquam quam id facilisis tempor. Aenean quis gravida justo.',
    'id': 1,
    'time': '2 minutes ago',
    'bookmarked': true
  },
  {
    'userImage': 'assets/2.jpg',
    'username': 'Mario Mitchell',
    'title': 'Choosing The Best Audio Player Software For Your Computer',
    'description':
        'Nunc sed cursus dolor, eu dictum ipsum. Aenean luctus consectetur eros nec tincidunt. Sed at velit finibus nisi pellentesque tempor.',
    'id': 2,
    'time': '1 hour ago',
    'bookmarked': false
  },
  {
    'userImage': 'assets/3.jpeg',
    'username': 'Steve Mann',
    'title': 'Thousands Now Remove Adware Removal Who Never Thought They Could',
    'description': '',
    'id': 3,
    'time': '20 minutes ago',
    'bookmarked': false
  }
];

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'News app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 100.0),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: pink,
              offset: Offset(0, 2.0),
              blurRadius: 20.0,
            )
          ]),
          child: GradientAppBar(
            title: Text("Home"),
            backgroundColorStart: pink,
            backgroundColorEnd: lightPink,
            centerTitle: false,
            elevation: 0.0,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {},
              )
            ],
            bottom: TabBar(
              isScrollable: true,
              controller: controller,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: new BubbleTabIndicator(
                indicatorHeight: 25.0,
                indicatorColor: Colors.white,
                tabBarIndicatorSize: TabBarIndicatorSize.tab,
              ),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              tabs: <Widget>[
                Tab(
                  text: "For you",
                ),
                Tab(
                  text: "Trendings",
                ),
                Tab(
                  text: "Populars",
                ),
                Tab(
                  text: "Best publishers",
                ),
              ],
              onTap: (int val) {},
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          MainPage(),
          OtherTabPage(
            title: "Trendings",
          ),
          OtherTabPage(
            title: "Populars",
          ),
          OtherTabPage(
            title: "Best publishers",
          )
        ],
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(0, 2.0),
                        blurRadius: 20.0,
                      )
                    ]),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.black,
                                backgroundImage:
                                    AssetImage(posts[index]['userImage']),
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    posts[index]['username'],
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    posts[index]['time'],
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        posts[index]['bookmarked']
                            ? Icon(
                                Icons.bookmark,
                                size: 32.0,
                                color: Colors.blue,
                              )
                            : Icon(
                                Icons.bookmark_border,
                                size: 32.0,
                                color: Colors.black54,
                              )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      posts[index]['title'],
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.w500),
                    ),
                    posts[index]['description'] == ''
                        ? Container(
                            width: 0,
                            height: 0,
                          )
                        : Column(
                            children: <Widget>[
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                posts[index]['description'],
                                style: TextStyle(color: Colors.black54),
                              )
                            ],
                          )
                  ],
                ),
              );
            },
            itemCount: posts.length,
          ),
        ),
      ],
    );
  }
}

class OtherTabPage extends StatelessWidget {
  final String title;
  const OtherTabPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(title),
      ),
    );
  }
}
