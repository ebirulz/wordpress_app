import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:wordpress_app/blocs/settings_bloc.dart';
import 'package:wordpress_app/config/config.dart';
import 'package:wordpress_app/config/wp_config.dart';
import 'package:wordpress_app/pages/category_based_articles.dart';
import 'package:wordpress_app/services/app_service.dart';
import 'package:wordpress_app/utils/next_screen.dart';
import '../blocs/category_bloc.dart';
import '../models/category.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final d = context.watch<CategoryBloc>().categoryData;
    return Container(
      width: double.infinity,
        child: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 260,
                  width: double.infinity,
                  color: Color(0XFF2b194d),
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          //margin: EdgeInsets.only(bottom: 3),
                          child: Image(
                              height: 188,
                              width: 154,
                              fit: BoxFit.contain,
                              image: AssetImage('assets/App_Logo_3.png')),
                        ),
                      ],
                    ),
                  )),
              Container(
                height: 15,
                decoration: BoxDecoration(
                  color: Color(0XFF2b194d)
                )
              ),
              Container(
                decoration: BoxDecoration(color: Color(0XFF281E3A),
                  border: Border(
                    bottom: BorderSide( //                   <--- left side
                      color: Colors.white,
                      //width: 3.0,
                    ),
                    top: BorderSide( //                    <--- top side
                      color: Colors.white,
                      //width: 3.0,
                    ),
                  ),
                ),
                //padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    ListTile(
                      isThreeLine: false,
                      contentPadding: EdgeInsets.only(left: 20),
                      horizontalTitleGap: 5,
                      title: Text(
                        'PROSPERITY POST',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ).tr(),
                      onTap: () {
                        Navigator.pop(context);
                        nextScreen(
                            context,
                            CategoryBasedArticles(
                                categoryImage: "assets/categories/TheProsperityPost.png",
                                categoryName: "Prosperity Post",
                                categoryId: 42)
                        );
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(color: Color(0XFF2b194d),

                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(bottom: 30),
                    itemCount: d.length,
                    separatorBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                        height: 1,
                        color: Colors.grey,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      final String _thumbnail =
                      WpConfig.categoryImages.keys.contains(d[index].id)
                          ? WpConfig.categoryImages[d[index].id]
                          : WpConfig.randomCategoryThumbnail;

                      //subcategories removed from the category list
                      // if (d[index].parent != 0) {
                      //   return Container();
                      // }
                      return ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          nextScreen(
                              context,
                              CategoryBasedArticles(
                                  categoryImage: _thumbnail,
                                  categoryName: d[index].name,
                                  categoryId: d[index].id));
                        },
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        ),
                        title: Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            d[index].name!,
                            style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

            ],
          ),
        )
    );
  }
}
