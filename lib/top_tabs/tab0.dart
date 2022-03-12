import 'package:flutter/material.dart';
import 'package:wordpress_app/widgets/featured.dart';
import '../blocs/featured_bloc.dart';
import 'package:provider/provider.dart';
import '../pages/category_based_articles.dart';
import '../blocs/latest_articles_bloc.dart';
import '../blocs/popular_articles_bloc.dart';
import '../widgets/lattest_articles.dart';
import '../pages/audio.dart';

class Tab0 extends StatefulWidget {
  Tab0({Key? key, required this.scaffoldKey}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  _Tab0State createState() => _Tab0State();
}

class _Tab0State extends State<Tab0> {
  Future _onRefresh() async {
    context.read<FeaturedBloc>().saveDotIndex(0);
    context.read<FeaturedBloc>().fetchData();
    context.read<PopularArticlesBloc>().fetchData();
    context.read<LatestArticlesBloc>().onReload();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 5, top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 1,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CategoryBasedArticles(
                          categoryName: "Governor Diri", categoryId: 41, categoryImage: "assets/categories/GovDiriDouye.png",)));
                },
                child: Stack(
                  children: [
                    Column(
                      children: const [
                        CircleAvatar(
                          radius: 30,
                          child: Image(
                            image: AssetImage('assets/1.png'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "GOV.\nDOUYE DIRI",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  /*Navigator.pop(context);
                                nextScreen(
                                    context,
                                    CategoryBasedArticles(
                                        categoryName: "Press Release",
                                        categoryId: 2));*/
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CategoryBasedArticles(
                          categoryName: "Press Release", categoryId: 31, categoryImage: "assets/categories/PressRelease.png",)
                  )
                  );
                },
                child: Stack(
                  children: [
                    Column(
                      children: const [
                        CircleAvatar(
                          radius: 30,
                          child: Image(
                            image: AssetImage('assets/2.png'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "PRESS\nRELEASE",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    /*const Positioned(
                                    right: 0,
                                    top: 0,
                                    child: CircleAvatar(
                                      radius: 12,
                                      backgroundColor: Colors.red,
                                      // child: Icon(
                                      //   Icons.exposure_plus_1_rounded,
                                      //   color: Colors.white,
                                      //   size: 20,
                                      // ),
                                      child: Text(
                                        '3',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),*/
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CategoryBasedArticles(
                          categoryName: "Public Notice", categoryId: 32, categoryImage: "assets/categories/PublicNotice.png")));
                },
                child: Stack(
                  children: [
                    Column(
                      children: const [
                        CircleAvatar(
                          radius: 30,
                          child: Image(
                            image: AssetImage('assets/3.png'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "PUBLIC \n NOTICE",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    /*const Positioned(
                                    right: 0,
                                    top: 0,
                                    child: CircleAvatar(
                                      radius: 12,
                                      backgroundColor: Colors.red,
                                      child: Text(
                                        '1',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),*/
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CategoryBasedArticles(
                          categoryName: "Video Feeds", categoryId: 33, categoryImage: "assets/categories/VideoFeeds.png")));
                },
                child: Stack(
                  children: [
                    Column(
                      children: const [
                        CircleAvatar(
                          radius: 30,
                          child: Image(
                            image: AssetImage('assets/4.png'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "VIDEO\nFEEDS",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    /*const Positioned(
                                    right: 0,
                                    top: 0,
                                    child: CircleAvatar(
                                      radius: 12,
                                      backgroundColor: Colors.red,
                                      child: Text(
                                        '10',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),*/
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Audio();
                      },
                    ),
                  );
                },
                child: Stack(
                  children: [
                    Column(
                      children: const [
                        CircleAvatar(
                          radius: 30,
                          child: Image(
                            image: AssetImage('assets/5.png'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "AUDIO\nBROADCASTS",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    /*const Positioned(
                                    right: 0,
                                    top: 0,
                                    child: CircleAvatar(
                                      radius: 12,
                                      backgroundColor: Colors.red,
                                      child: Text(
                                        '1',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),*/
                  ],
                ),
              ),
              SizedBox(
                width: 1,
              ),
            ],
          ),
        ),
        Expanded(
          child: RefreshIndicator(
            backgroundColor: Color(0xFF007BA5),
            color: Colors.white,
            onRefresh: () async => _onRefresh(),
            child: SingleChildScrollView(
              key: PageStorageKey('key0'),
              padding: EdgeInsets.all(0),
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [


                  SizedBox(
                    height: 20,
                  ),
                  Featured(),
                  //PopularArticles(scaffoldKey: widget.scaffoldKey),
                  LattestArticles(scaffoldKey: widget.scaffoldKey),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}