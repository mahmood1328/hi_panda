import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/res/colors.dart';
import '../Models/Responses/consult_info_model.dart';
import '../View/Consult/Components/item_request.dart';
import '../View/Consult/Controller/consult_controller.dart';
import '../utils/const.dart';
import '../utils/size_config.dart';

class ModalRequests extends StatefulWidget {
 final List<DetailShow> detailShow;
  const ModalRequests({Key? key,required this.detailShow}) : super(key: key);


  @override
  _ModalRequestsState createState() => _ModalRequestsState();

}

class _ModalRequestsState extends State<ModalRequests> {

 var consultController =Get.put(ConsultController());
  @override
  Widget build(BuildContext context) {
    return Material(
        color: ColorsApp.white,
        child: SafeArea(
          top: false,
          child: Container(
            margin: const EdgeInsets.only(top: 20,right: 30,left: 30),
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight/1.2,
            child: SingleChildScrollView(
              child: Column(
                children: widget.detailShow.map((e) => ItemRequestComponents(detailShow: e,)).toList()
              ),
            ),
          ),
        ));

  }

}