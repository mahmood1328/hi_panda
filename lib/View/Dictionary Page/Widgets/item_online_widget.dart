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
    return Card(
      elevation: 0,
      color: ColorsApp.white,
      surfaceTintColor: Colors.grey,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      semanticContainer: true,
      clipBehavior: Clip.hardEdge,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: SizeConfig.screenWidth/1.5,
              child: Text(
                widget.translate.text,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    fontFamily: "IranSANS",
                    color: ColorsApp.black.withOpacity(0.5)),
                textAlign: TextAlign.end,maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
