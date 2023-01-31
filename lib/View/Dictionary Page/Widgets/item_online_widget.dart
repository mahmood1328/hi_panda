import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../Models/dictioary_model.dart';

class ItemOnlineWidget extends StatefulWidget {
  final Translate translate;
  const ItemOnlineWidget({Key? key, required this.translate}) : super(key: key);

  @override
  State<ItemOnlineWidget> createState() => _ItemOnlineWidgetState();
}

class _ItemOnlineWidgetState extends State<ItemOnlineWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool play = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Card(
        color: ColorsApp.white,
        surfaceTintColor: Colors.grey,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        semanticContainer: true,
        clipBehavior: Clip.hardEdge,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  AudioWidget.network(
                    play: play,
                    child: GestureDetector(
                      onTap: () async {
                        setState(() {
                          play = !play;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          "${ConstAddress.image}audio.png",
                          color:play ? ColorsApp.primary: ColorsApp.iconTextField.withOpacity(0.4),
                        ),
                      ),
                    ),
                    // child: TextButton(
                    //     child: Text(
                    //       play ? "pause" : "play",style: TextStyle(color: Colors.black),
                    //     ),
                    //     onPressed: () {
                    //       setState(() {
                    //         play = !play;
                    //       });
                    //     }
                    // ),
                    onReadyToPlay: (duration) {
                      //onReadyToPlay
                    },
                    onFinished: (){
                      setState(() {
                        play = !play;
                      });
                    },
                    onPositionChanged: (current, duration) {
                      //onPositionChanged
                    },
                    url: widget.translate.pronounceVoiceUrl,
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth/1.5,
                    child: Text(
                      widget.translate.text,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          fontFamily: "IranSANS",
                          color: ColorsApp.black.withOpacity(0.5)),
                      textAlign: TextAlign.end,maxLines: 3,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.translate.descript,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                        fontFamily: "IranSANS",
                        color: ColorsApp.black.withOpacity(0.5)),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    " : توضیحات",
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.normal,
                        fontFamily: "IranSANS",
                        color: ColorsApp.black.withOpacity(0.8)),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
