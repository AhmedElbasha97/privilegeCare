import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/dector_detailed_screen/widget/full_screen_widget.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/widgets/loader.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoPlayer;
  const VideoPlayerWidget({Key? key, required this.videoPlayer}) : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {

  late VideoPlayerController _videoPlayerController;
  String timePlay = "0:0";
  Timer? timer;
  bool showReplayIcon = false;
  bool showController = false;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => renewTimeText());
    _videoPlayerController =
    VideoPlayerController.network(widget.videoPlayer)

      ..addListener(() {
        checkVideo();
      })

      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
      });

  }

  void checkVideo(){
    if (!_videoPlayerController.value.isPlaying &&_videoPlayerController.value.isInitialized &&
        (_videoPlayerController.value.duration ==_videoPlayerController.value.position)) { //checking the duration and position every time

      showReplayIcon = true;
      setState(() {

      });
    }

  }
  @override
  void dispose() {
    _videoPlayerController.dispose();
    timer?.cancel();
    super.dispose();
  }
   showingController(){
     showController = true;
     setState(() {

     });
     Future.delayed(const Duration(seconds: 10), () {

       showController = false;

       setState(() {
         // Here you can write your code for open new view
       });

     });
   }
  renewTimeText()async{
    var time = await _videoPlayerController.position;
    timePlay = "${time?.inMinutes}:${time?.inSeconds}";
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 7.0),
    child: SizedBox(
    child: DecoratedBox(
    decoration: const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(20)),
    boxShadow: [
    BoxShadow(
    offset: Offset(0, 2),
    blurRadius: 6,
    color: Colors.black12,
    ),
    ],
    ),
    child:Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          _videoPlayerController.value.isInitialized
              ?InkWell(
            onTap: (){
              showingController();
            },
                child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
                  child: AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController)),
                ),
              )
              : Padding(
    padding:  const EdgeInsets.all(5),
      child: Container(
          decoration: const BoxDecoration(
              borderRadius:
              BorderRadius.all(Radius.circular(15))
          ),
          child: Loader(width: MediaQuery.of(context).size.width,height: 150.0)),
    ),
          showController?Positioned(
            top: 10,
              left: 10,
              child: InkWell(
                onTap: (){
                  Get.to(()=>FullScreenVideoPlayerWidget(videoPlayer: widget.videoPlayer,));
                },
                child: Container(
                  height: Get.height*0.07,
                  width: Get.width*0.13,
                  decoration:  BoxDecoration(
                    color: Colors.black.withOpacity(0.50),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 6,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.fullscreen,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              )):SizedBox(),
          showController?Positioned(
              bottom: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: Get.width*0.9,
                  decoration:  BoxDecoration(
                    color: Colors.black.withOpacity(0.50),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 6,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Row(
                      children: [  IconButton(onPressed: (){
                        showingController();
                        _videoPlayerController.seekTo(Duration(
                            seconds: _videoPlayerController.value.position.inSeconds - 10));
                      }, icon: const Icon(Icons.fast_forward,color: kWhiteColor,)),
                        IconButton(onPressed: (){
                          if(_videoPlayerController.value.isPlaying){
                            _videoPlayerController.pause();
                            showingController();
                            setState(() {

                            });
                          }else{
                            _videoPlayerController.play();
                            showingController();
                            setState(() {

                            });
                          }
                        }, icon: _videoPlayerController.value.isPlaying?const Icon(Icons.pause,color: kWhiteColor,):const Icon(Icons.play_arrow,color: kWhiteColor,)),
                        IconButton(onPressed: (){
                          showingController();
                          _videoPlayerController.seekTo(Duration(
                              seconds: _videoPlayerController.value.position.inSeconds + 10));
                        }, icon: const Icon(Icons.fast_rewind,color: kWhiteColor,)),

                        Container(
                          width: Get.width*0.2,
                          height: 10,
                          child:ClipRRect(
                            borderRadius: BorderRadius.circular(3.0),
                            child: VideoProgressIndicator(

                              _videoPlayerController,
                              allowScrubbing: true,
                              colors:  VideoProgressColors(

                                  backgroundColor: kGrayColor.withOpacity(0.5),
                                  bufferedColor:kGrayColor.withOpacity(0.5),
                                  playedColor: kWhiteColor),
                            ),
                          ),
                        ),
                        IconButton(onPressed: (){
                          if(_videoPlayerController.value.volume == 0.0){
                            _videoPlayerController.setVolume(50);
                            showingController();
                            setState(() {

                            });
                          }else{
                            _videoPlayerController.setVolume(0);
                            showingController();
                            setState(() {

                            });
                          }
                        }, icon: _videoPlayerController.value.volume == 0.0?const Icon(Icons.volume_mute,color: kWhiteColor,):const Icon(Icons.volume_up,color: kWhiteColor,)),
                        Text(
                            "${_videoPlayerController.value.duration.inMinutes}:${_videoPlayerController.value.duration.inSeconds}",
                            style:const TextStyle(color: kWhiteColor,fontWeight: FontWeight.bold,fontSize: 18)

                        ),
                        const Text(
                            "/",
                            style:TextStyle(color: kWhiteColor,fontWeight: FontWeight.bold,fontSize: 18)

                        ),
                        Text(
                            timePlay,
                            style:const TextStyle(color: kWhiteColor,fontWeight: FontWeight.bold,fontSize: 18)

                        ),
                      ],
                    ),
                  ),
                ),
              )):const SizedBox(),
          showReplayIcon?InkWell(
            onTap: (){
              showReplayIcon = false;
            setState(() {

            });
              _videoPlayerController.seekTo(Duration.zero);
              _videoPlayerController.play();

            },
            child: Center(
              child: AspectRatio(
                aspectRatio:  _videoPlayerController.value.aspectRatio,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: Get.height*0.1,
                        width: Get.width*0.2,
                        decoration:  BoxDecoration(
                          color: Colors.black.withOpacity(0.50),
                          borderRadius: const BorderRadius.all(Radius.circular(25)),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 2),
                              blurRadius: 6,
                              color: Colors.black12,
                            ),
                          ],
                        ),
                      child: const Icon(
                        Icons.replay,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ):const SizedBox(),
        ],
      ),
    )
    )));
  }
}
