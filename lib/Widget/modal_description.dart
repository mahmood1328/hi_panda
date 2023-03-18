import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../View/Verify/Controller/verify_controller.dart';
import '../utils/res/colors.dart';
import '../utils/size_config.dart';

class ModalDescription extends StatefulWidget {
  final String des;
  final String publishDate;
  final String writerName;
  final String logo;
  const ModalDescription({Key? key,required this.des,required this.writerName,required this.publishDate,required this.logo}) : super(key: key);


  @override
  _ModalDescriptionState createState() => _ModalDescriptionState();

}

class _ModalDescriptionState extends State<ModalDescription> {
  var box=GetStorage();
  var verifyController=Get.put(VerifyController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
        color: ColorsApp.white,
        child: SizedBox(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 15,top: 10,bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children:  [
                          Text(widget.publishDate , style:const TextStyle(fontSize: 8 , fontWeight: FontWeight.bold , color: ColorsApp.primaryLight2,fontFamily: "IranSANS"),),
                        ],
                      ),
                      const SizedBox(width: 8,),
                       Text(widget.writerName , style:const TextStyle(fontSize: 14 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextTitle,fontFamily: "IranSANS"),),
                      const SizedBox(width: 8,),
                       CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(widget.logo),
                      ),
                    ],
                  ),
                ),
                Container(alignment: Alignment.centerRight,
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight,
                  margin: const EdgeInsets.only(right: 30,top: 5,left: 30,bottom: 15),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Html(
                      data: widget.des,
                      tagsList: Html.tags..addAll(["bird", "flutter"]),
                      style: {
                        "body": Style(
                            textAlign: TextAlign.justify,fontFamily: "IranSANS",color: ColorsApp.colorTextNormal,fontSize: FontSize(12)
                        ),
                        "tr": Style(textAlign: TextAlign.justify,fontFamily: "IranSANS",
                          border:const Border(bottom: BorderSide(color: ColorsApp.colorTextNormal,)),
                        ),
                        "th": Style(
                          padding:const EdgeInsets.all(6),textAlign: TextAlign.justify,fontFamily: "IranSANS",
                          backgroundColor: ColorsApp.colorTextNormal,
                        ),
                        "td": Style(
                          padding:const EdgeInsets.all(6),textAlign: TextAlign.justify,fontFamily: "IranSANS",color: ColorsApp.colorTextNormal,
                          alignment: Alignment.topRight,
                        ),
                        'h5': Style( textOverflow: TextOverflow.ellipsis,textAlign: TextAlign.justify,fontFamily: "IranSANS",color: ColorsApp.colorTextNormal,),
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

}
