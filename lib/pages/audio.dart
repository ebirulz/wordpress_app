import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'model/Musics.dart';
import 'audio_details.dart';
import 'model/broadcast.dart';


class Audio extends StatefulWidget {
  const Audio({Key? key}) : super(key: key);

  @override
  _AudioState createState() => _AudioState();
}

class _AudioState extends State<Audio> {

  late List musics;

  @override
  void initState() {
    musics = getList();
    super.initState();
    _fetchPosts();
  }

  _fetchPosts() async {
    try {
      var url = Uri.parse('https://byapp.o3interactive.ng/json/audio.json');
      Response response = await get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        List audios = jsonDecode(response.body)["data"];
        return audios;
      }
    } catch (e) {}
    return null;
  }


  List getList() {
    return [
      Musics(
          title: " Sen. Douye Diri Sworn In As Bayelsa Governor",
          singer: "Bayelsa State",
          url: "https://byapp.o3interactive.ng/mp3/DiriDouyeSwornInAsBayelsaGovernor.mp3",
          image:
          "https://byapp.o3interactive.ng/mp3/Governor-image.png"),
      Musics(
        title: "Governor Douye Diri of Bayelsa State Speech on Convid-19",
        singer: "Bayelsa State",
        url: "https://byapp.o3interactive.ng/mp3/GovernorDouyeDiriConvid-19.mp3",
        image:
        "https://byapp.o3interactive.ng/mp3/Event3.jpg",
      ),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0XFF2b194d),
        appBar: AppBar(
          toolbarHeight: 200,
          backgroundColor: Color(0xFF3E2B63),
          centerTitle: true,
          title: Row(
            children: [
              Container(
                height: 300,
                width: 250,
                /*decoration:BoxDecoration(
                image: DecorationImage(image: CachedNetworkImageProvider(widget.categoryThumbnail!))
              ),*/
                child: Image(image: AssetImage("assets/categories/AudioBroadcast.png")),
              ),
              VerticalDivider(),
              // Text(
              //   widget.categoryName!,
              //   textAlign: TextAlign.start,
              // )
            ],
          ),
        ),
        body: Stack(children: [

          Column(children: [
            Expanded(
              child: FutureBuilder(
                future: _fetchPosts(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.none) {
                    return Container();
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      Audios audio = Audios.fromJson(snapshot.data[index]);
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AudioDetails( audio: audio,)),
                            );
                          },
                        child: Padding(
                          padding: EdgeInsets.only(left: 15, right: 15,top: 15,),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF3E2B63),
                              //border: Border.all(color: Colors.grey.shade500),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5.0) //                 <--- border radius here
                              ),
                            ),
                            child: Row(
                              children: [
                                Stack(children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      //color: Color(0XFF2b194d)
                                    ),
                                    height: 80.0,
                                    width: 80.0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image(image: AssetImage("assets/6.png"), fit: BoxFit.cover),
                                    ),
                                  ),

                                ]),
                                SizedBox(width: 16.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        audio.title.toString(),
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: Colors.white60,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 17.0,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(height: 8.0),

                                    ],
                                  ),
                                ),
                                //Spacer(),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white.withOpacity(0.6),
                                  size: 22.0,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },

                  );
                },
              ),
            ),
            //divided into two parts
            //one which consists of list of songs
            /*Expanded(
              child: ListView.builder(
                  itemCount: getList().length,
                  itemBuilder: (context, index) => customListView(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AudioDetails(mMusic: musics[index])),
                      );
                    },
                    title: musics[index].title,
                    singer: musics[index].singer,
                    image: musics[index].image,
                  )),
            ),*/
          ]),
        ]));
  }
}
