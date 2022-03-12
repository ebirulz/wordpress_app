import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'model/broadcast.dart';

class AudioDetails extends StatefulWidget {
  const AudioDetails({Key? key, required this.audio}) : super(key: key);

  final Audios audio;

  @override
  _AudioDetailsState createState() => _AudioDetailsState();
}

class _AudioDetailsState extends State<AudioDetails> {

  //8.Setting the player UI Data
  IconData btnIcon = Icons.play_arrow;
  var bgColor=  const Color(0XFF2b194d);
  var iconHoverColor = const Color(0xFF065BC3);

  Duration duration = new Duration();
  Duration position = new Duration();

  //9.Now add music player
  AudioPlayer audioPlayer = new AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  bool isPlaying = false;
  String currentSong = "";

  void playMusic(String url) async {
    if (isPlaying && currentSong != url) {
      audioPlayer.pause();
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          currentSong = url;
        });
      }
    } else if (!isPlaying) {
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          isPlaying = true;
          btnIcon = Icons.pause;
          //from now we hear song
        });
      }
    }
    //11
    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color(0XFF2b194d),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 450.0,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.audio.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [bgColor.withOpacity(0.4), bgColor],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 52.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color(0XFF2b194d).withOpacity(0.9),
                                child: IconButton(
                                  alignment: Alignment.center,
                                  icon: Icon(Icons.arrow_back_ios_sharp,
                                      size: 30, color: Colors.white),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(widget.audio.title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            widget.audio.date,
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 18.0),
                          ),
                          SizedBox(height: 16.0),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 22.0,
              ),
              Slider.adaptive(
                //change value after 11 step, and add min and max
                value: position.inSeconds.toDouble(),
                min: 0.0,
                max: duration.inSeconds.toDouble(),
                onChanged: (value) {},
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.fast_rewind,
                    color: Colors.white54,
                    size: 42.0,
                  ),
                  SizedBox(width: 32.0),
                  Container(
                    decoration: BoxDecoration(
                        color: iconHoverColor,
                        borderRadius: BorderRadius.circular(50.0)),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {
                            //10.lets Build the Pause button
                            playMusic(widget.audio.url);
                            if(isPlaying)
                            {
                              audioPlayer.pause();
                              setState(() {
                                btnIcon = Icons.play_arrow;
                                isPlaying = false;
                              });
                            }else{
                              audioPlayer.resume();
                              setState(() {
                                btnIcon = Icons.pause;
                                isPlaying = true;
                              });
                            }
                          },
                          iconSize: 42.0,
                          icon: Icon(btnIcon),
                          color: Colors.white,
                        )
                    ),
                  ),
                  SizedBox(width: 32.0),
                  Icon(
                    Icons.fast_forward,
                    color: Colors.white54,
                    size: 42.0,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
