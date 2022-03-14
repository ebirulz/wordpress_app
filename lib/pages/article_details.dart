import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:share/share.dart';
import 'package:wordpress_app/blocs/ads_bloc.dart';
import 'package:wordpress_app/config/ad_config.dart';
import 'package:wordpress_app/models/constants.dart';
import 'package:wordpress_app/pages/comments_page.dart';
import 'package:wordpress_app/services/app_service.dart';
import 'package:wordpress_app/utils/next_screen.dart';
import 'package:wordpress_app/widgets/banner_ad.dart';
import 'package:wordpress_app/widgets/bookmark_icon.dart';
import 'package:wordpress_app/widgets/html_body.dart';
import 'package:wordpress_app/widgets/related_articles.dart';
import '../models/article.dart';
import '../utils/cached_image.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetails extends StatefulWidget {
  final String? tag;
  final Article? articleData;

  ArticleDetails({Key? key, this.tag, required this.articleData})
      : super(key: key);

  @override
  _ArticleDetailsState createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  double _rightPaddingValue = 140;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  Future _handleShare() async {
    Share.share(widget.articleData!.link!);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 0))
        .then((value) => context.read<AdsBloc>().showLoadedAds());
    Future.delayed(Duration(milliseconds: 100)).then((value) {
      setState(() {
        _rightPaddingValue = 10;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Article? article = widget.articleData;
    final bookmarkedList = Hive.box(Constants.bookmarkTag);

    return Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          bottom: true,
          top: false,
          maintainBottomViewPadding: true,
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      elevation: 0,
                      expandedHeight: 290,
                      systemOverlayStyle: SystemUiOverlayStyle.light,
                      flexibleSpace: FlexibleSpaceBar(
                          background: widget.tag == null
                              ? CustomCacheImage(
                                  imageUrl: article!.image, radius: 0.0)
                              : Hero(
                                  tag: widget.tag!,
                                  child: CustomCacheImage(
                                      imageUrl: article!.image, radius: 0.0),
                                )),
                      actions: <Widget>[
                        SizedBox(
                          width: 15,
                        ),
                        CircleAvatar(
                          radius: 17,
                          backgroundColor: Color(0XFF2b194d).withOpacity(0.9),
                          child: IconButton(
                            alignment: Alignment.center,
                            icon: Icon(Icons.arrow_back_ios_sharp,
                                size: 18, color: Colors.white),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        Spacer(),
                        CircleAvatar(
                          radius: 17,
                          backgroundColor: Color(0XFF2b194d).withOpacity(0.9),
                          child: IconButton(
                            icon: Icon(Icons.share,
                                size: 18, color: Colors.white),
                            onPressed: () => _handleShare(),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),

                      ],
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: <Widget>[
                                        Container(
                                            alignment: Alignment.center,
                                            //height: 30,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onBackground),
                                            child: AnimatedPadding(
                                              duration:
                                                  Duration(milliseconds: 1000),
                                              padding: EdgeInsets.only(
                                                  left: 10,
                                                  right: _rightPaddingValue,
                                                  top: 5,
                                                  bottom: 5),
                                              child: Text(
                                                article.category!,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            )),
                                        Spacer(),
                                        BookmarkIcon(
                                          bookmarkedList: bookmarkedList,
                                          article: article,
                                          iconSize: 22,
                                          scaffoldKey: scaffoldKey,
                                          iconColor: Colors.blueGrey,
                                          normalIconColor: Colors.white,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Row(
                                          children: [
                                            Icon(
                                              CupertinoIcons.time_solid,
                                              color: Colors.grey[400],
                                              size: 16,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              article.date!,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 8,
                                              backgroundImage:
                                              CachedNetworkImageProvider(
                                                  article.avatar!),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            TextButton(
                                                onPressed:(){
                                                  const url = 'https://bayelsastate.gov.ng/';
                                                  launchURL(url);
                                                },
                                                child: Text(
                                                  //'By ${article.author}',
                                                  'Source: Bayelsa State Government',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .secondary,
                                                      fontWeight: FontWeight.w600),
                                                ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      AppService.getNormalText(article.title!),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: -0.6,
                                          wordSpacing: 1),
                                    ),
                                    Divider(
                                      color: Colors.white,
                                      endIndent: 280,
                                      thickness: 2,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        TextButton.icon(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty
                                                    .resolveWith((states) =>
                                                        Color(0xFF007BA5)),
                                            shape: MaterialStateProperty
                                                .resolveWith((states) =>
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3))),
                                          ),
                                          icon: Icon(Icons.comment,
                                              color: Colors.white, size: 20),
                                          label: Text('comments',
                                                  style: TextStyle(
                                                      color: Colors.white))
                                              .tr(),
                                          onPressed: () => nextScreenPopup(
                                              context,
                                              CommentsPage(
                                                postId: article.id,
                                                categoryId: article.catId!,
                                              )),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              HtmlBody(
                                  content: article.content!,
                                  isVideoEnabled: true,
                                  isimageEnabled: true,
                                  isIframeVideoEnabled: true),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                          RelatedArticles(
                            postId: article.id,
                            catId: article.catId,
                            scaffoldKey: scaffoldKey,
                          ),
                          SizedBox(
                            height: 50,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // banner ads
              AdConfig.isAdsEnabled == true ? BannerAdWidget() : Container(),
            ],
          ),
        ));
  }
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
