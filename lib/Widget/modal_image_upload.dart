import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../utils/res/colors.dart';

class ModalImageUpload extends StatefulWidget {
  final Function callBackGallery;
  final Function callBackCamera;
  const ModalImageUpload({Key? key,required this.callBackGallery,required this.callBackCamera}) : super(key: key);


  @override
  _ModalImageUploadState createState() => _ModalImageUploadState();

}

class _ModalImageUploadState extends State<ModalImageUpload> {
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Material(
        color: ColorsApp.primary,
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    widget.callBackGallery();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(bottom: 0,top: 8),
                    width: 100,
                    height: 80,
                    decoration: BoxDecoration(
                      //color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.add_photo_alternate,color: Colors.white,size: 45),
                        Text("Add Gallery",style: TextStyle(fontSize: 12,color: Colors.white,fontFamily: "robot",fontWeight: FontWeight.normal),)
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    widget.callBackCamera();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(bottom: 0,top: 8),
                    width: 100,
                    height: 80,
                    decoration: BoxDecoration(
                      //color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.add_a_photo,color: Colors.white,size: 40,),
                        Text("Add Camera",style: TextStyle(fontSize: 12,color: Colors.white,fontFamily: "robot",fontWeight: FontWeight.normal),)
                      ],
                    ),
                  ),
                ),



              ],
            ),
          ),
        ));
  }

}