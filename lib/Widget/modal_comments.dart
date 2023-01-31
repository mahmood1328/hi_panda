import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../Network/service_url.dart';
import '../View/Blog/Components/item_comment_components.dart';
import '../View/Blog/Controller/blog_controller.dart';
import '../View/Blog/Models/list_post_model.dart';
import '../View/Verify/Controller/verify_controller.dart';
import '../utils/const.dart';
import '../utils/res/colors.dart';
import '../utils/res/dimensions.dart';
import '../utils/size_config.dart';

class ModalComments extends StatefulWidget {
final  Post post;
  const ModalComments({Key? key,required this.post}) : super(key: key);


  @override
  _ModalCommentsState createState() => _ModalCommentsState();

}

class _ModalCommentsState extends State<ModalComments> {
  var box=GetStorage();
  var blogController=Get.put(BlogController());
  bool likeCommentValue=false;
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
          child: Stack(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 15,top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children:  [
                                Text(widget.post.publishDateShow , style:const TextStyle(fontSize: 9 , fontWeight: FontWeight.bold , color: ColorsApp.primaryLight2,fontFamily: "IranSANS"),),
                              ],
                            ),
                            const SizedBox(width: 8,),
                             Text(widget.post.writerName , style:const TextStyle(fontSize: 13 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextTitle,fontFamily: "IranSANS"),),
                            const SizedBox(width: 8,),
                             CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(widget.post.writerLogo),
                            ),
                          ],
                        ),
                      ),
                      Container(alignment: Alignment.centerRight,
                        width: SizeConfig.screenWidth,
                        margin: const EdgeInsets.only(right: 30,top: 5,left: 30,bottom: 10),
                        child: Wrap(
                          alignment: WrapAlignment.end,
                          children:  [
                            Text(widget.post.postAbstract,
                              style:const TextStyle(fontSize: 11 , fontWeight: FontWeight.normal , color: ColorsApp.colorTextTitle,fontFamily: "IranSANS"),textDirection: TextDirection.rtl,textAlign:
                              TextAlign.justify,),


                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                             mainAxisAlignment: MainAxisAlignment.end,
                              children:  [
                                const  Text("نظر" , style: TextStyle(fontSize: 12 , fontWeight: FontWeight.bold , color: ColorsApp.iconTextField,fontFamily: "IranSANS"),),
                                Text(widget.post.countComment.toString() , style:const TextStyle(fontSize: 12 , fontWeight: FontWeight.bold , color: ColorsApp.iconTextField,fontFamily: "IranSANS"),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Text("نظرات" , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextTitle,fontFamily: "IranSANS"),),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: widget.post.comments.map((e) => ItemCommentComponents(comment: e,),).toList(),
                      ),

                      const SizedBox(height: 80,),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:  const EdgeInsets.only(top: 20,left: 40,right: 40,bottom: 10),
                  child: ElevatedButton(

                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all( Size(SizeConfig.screenHeight/1.5, 50)),
                        foregroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
                        backgroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(Dimensions.borderRadiusComponents),
                                side: const BorderSide(color:ColorsApp.primary)
                            )
                        )
                    ),

                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            contentPadding: EdgeInsets.zero,
                            content: Container(
                                padding: const EdgeInsets.only(top: 25,right: 0,left: 0),
                                decoration: const BoxDecoration(
                                    borderRadius:BorderRadius.all(Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(color: ColorsApp.backTextField,blurRadius: 70,offset: Offset.zero,spreadRadius:0.2,blurStyle: BlurStyle.solid)
                                    ],
                                    color: ColorsApp.white
                                ),
                                height: SizeConfig.screenHeight/2.5,
                                width: SizeConfig.screenWidth/1.2,
                                child:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: (){
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.only(left: 30),
                                            height: 30,width: 30,
                                            //padding:const EdgeInsets.all(3),

                                            child: SvgPicture.asset("${ConstAddress.icon}closeCircle.svg",),
                                          ),
                                        ),
                                        Text(
                                          "ارسال نظر",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'IRANSans',
                                              fontSize: 15,
                                              color: ColorsApp.black.withOpacity(0.7)),
                                        ),
                                        const SizedBox(width: 50,),

                                      ],
                                    ),
                                    const SizedBox(height: 30,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: SizeConfig.screenWidth/1.45,
                                          padding: const EdgeInsets.only(right: 0,bottom: 5),
                                          child: TextFormField(
                                            onChanged: (value) {
                                            },
                                            onEditingComplete: () => FocusScope.of(context).nextFocus(),
//                  autofocus: true,
                                            controller: blogController.controllerComment,
                                            textAlign: TextAlign.right,
                                            style: const TextStyle(
                                                fontSize: 15.0,
                                                color: ColorsApp.colorTextTitle,
                                                fontWeight: FontWeight.normal,fontFamily: "IranSANS"
                                            ),
                                            decoration: InputDecoration(
                                              fillColor: const Color(0xffF9F9F9),
                                              filled: true,
                                              counterText: "",
                                              contentPadding:
                                              const EdgeInsets.only(left: 16, right: 16,top: 15),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                                borderSide: const BorderSide(
                                                  color: Color(0xFF6a7dca),
                                                  width: 0.7,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xFF6a7dca),
                                                  width: 0.7,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xFF6a7dca),
                                                  width: 0.7,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              hintText: "...نظر",
                                              hintStyle: const TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.normal,
                                                  color: ColorsApp.colorTextTitle,
                                                  fontFamily: 'IRANSans'),
                                            ),
                                            maxLines: 3,
                                            keyboardType: TextInputType.text,maxLength: 11,
                                          ),
                                        ),

                                      ],
                                    ),
                                    Padding(
                                      padding:  const EdgeInsets.only(top: 30,left: 20,right: 20),
                                      child: Center(
                                        child: ElevatedButton(

                                          style: ButtonStyle(
                                              minimumSize: MaterialStateProperty.all( Size(SizeConfig.screenHeight/1.5, 50)),
                                              foregroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
                                              backgroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(Dimensions.borderRadiusComponents),
                                                      side: const BorderSide(color:ColorsApp.primary)
                                                  )
                                              )
                                          ),

                                          onPressed: () {
                                            blogController.postOperation(context, widget.post.id, blogController.controllerComment.text, 3, "کامنت", true);

                                          },
                                          child: const Text(
                                            "ارسال",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                                                color: ColorsApp.white),
                                            textAlign: TextAlign.center,
                                          ),),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          );

                        },
                      );


                    },
                    child: const Text(
                      "ارسال نظر",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                          color: ColorsApp.white),
                      textAlign: TextAlign.center,
                    ),),
                ),
              ),
            ],
          ),
        ));
  }

}
