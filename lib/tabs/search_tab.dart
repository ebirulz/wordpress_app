import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:wordpress_app/blocs/category_bloc.dart';
import 'package:wordpress_app/config/wp_config.dart';
import 'package:wordpress_app/models/category.dart';
import 'package:wordpress_app/pages/category_based_articles.dart';
import 'package:wordpress_app/pages/search.dart';
import 'package:wordpress_app/utils/cached_image_with_dark.dart';
import 'package:wordpress_app/utils/loading_card.dart';
import 'package:wordpress_app/utils/next_screen.dart';
import 'package:wordpress_app/utils/vertical_line.dart';
import 'package:easy_localization/easy_localization.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final d = context.watch<CategoryBloc>().categoryData;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: RefreshIndicator(
        onRefresh: () async => await context.read<CategoryBloc>().fetchData(),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 230,
              toolbarHeight: 0,
              elevation: 0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF3E2B63),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'search',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ).tr(),
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                              left: 20, right: 20, bottom: 30, top: 20),
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: [
                              Icon(
                                AntDesign.search1,
                                color: Colors.grey[600],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'search for contents',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[600]),
                              ).tr(),
                            ],
                          ),
                        ),
                        onTap: () => nextScreen(context, SearchPage()),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          verticalLine(context, 20),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'categories',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ).tr(),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.only(
                              top: 5, bottom: 20, left: 0, right: 0),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                  childAspectRatio: 1.3),
                          itemCount: d.isEmpty ? 10 : d.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (d.length == 0)
                              return LoadingCard(
                                height: null,
                              );

                            return _CategoryItem(
                              d: d[index],
                            );
                          },
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _CategoryItem extends StatelessWidget {
  final Category d;
  const _CategoryItem({Key? key, required this.d}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final String _heroTag = 'category${d.id}';
    final String _thumbnail = WpConfig.categoryImages.keys.contains(d.id)
        ? WpConfig.categoryImages[d.id]
        : WpConfig.randomCategoryThumbnail;

    return InkWell(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: Color(0XFF3E2B63),
              border: Border(
                bottom: BorderSide( //                   <--- left side
                  color: Colors.grey,
                  //width: 3.0,
                ),
                top: BorderSide( //                    <--- top side
                  color: Colors.grey,
                  //width: 3.0,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${d.name!.toUpperCase()}",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      onTap: () {
        nextScreen(
            context,
            CategoryBasedArticles(
              categoryName: d.name,
              categoryId: d.id,
              categoryImage: _thumbnail,
              heroTag: _heroTag,
            ));
      },
    );
  }
}
