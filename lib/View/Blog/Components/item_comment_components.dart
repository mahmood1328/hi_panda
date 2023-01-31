
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../Controller/blog_controller.dart';
import '../Models/list_post_model.dart';
import 'banner.dart';

class ItemCommentComponents extends StatefulWidget {
final  Comment comment;
  const ItemCommentComponents({Key? key,required this.comment}) : super(key: key);

  @override
  State<ItemCommentComponents> createState() => _ItemCommentComponentsState();
}

class _ItemCommentComponentsState extends State<ItemCommentComponents> {
  var blogController=Get.put(BlogController());
  bool likeCommentValue=false;
  @override
  void initState() {
    super.initState();
    likeCommentValue=widget.comment.isLike;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 25,top: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){
                blogController.postOperation(context,widget.comment.id, "", 1, "لایک کامنت", likeCommentValue);
                if(likeCommentValue){
                  setState(() {
                    likeCommentValue=false;
                  });
                }else{
                  setState(() {
                    likeCommentValue=true;
                  });
                }

              }, icon:likeCommentValue? const Icon(Icons.favorite,color: ColorsApp.red,size: 15,): const Icon(Icons.favorite_border,color: ColorsApp.colorTextTitle,size: 15,)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                // alignment: WrapAlignment.end,
                children: [
                  Row(
                    children:  [
                      Text(widget.comment.publishDateShow , style:const TextStyle(fontSize: 8 , fontWeight: FontWeight.bold , color: ColorsApp.primaryLight2,fontFamily: "IranSANS"),),
                    ],
                  ),
                  const SizedBox(width: 3,),
                  Text(widget.comment.writerName , style:const TextStyle(fontSize: 11 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextTitle,fontFamily: "IranSANS"),),
                  const SizedBox(width: 8,),
                  const CircleAvatar(
                    radius: 15,
                    backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiVWupoD5ivNVv-2C_YX_ddk6ZgM0HB_xYVA&usqp=CAU"),
                  ),
                ],
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerRight,
            width: SizeConfig.screenWidth/1.3,
            child: Wrap(
              alignment: WrapAlignment.end,
              children:  [
                Text(widget.comment.text , style:const TextStyle(fontSize: 9 , fontWeight: FontWeight.bold , color: ColorsApp.primaryLight2,fontFamily: "IranSANS",

                ),textDirection: TextDirection.rtl,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
