import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';
import '../../../Network/service_url.dart';
import '../../../Widget/modal_comments.dart';
import '../../../Widget/modal_description.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../Controller/blog_controller.dart';
import '../Models/list_post_model.dart';
import 'banner.dart';

class ItemBlogComponents extends StatefulWidget {
final  Post post;
  const ItemBlogComponents({Key? key,required this.post}) : super(key: key);

  @override
  State<ItemBlogComponents> createState() => _ItemBlogComponentsState();
}

class _ItemBlogComponentsState extends State<ItemBlogComponents> {

  bool likeValue=false;
  bool bookmarkVal=false;
  bool likeValueRed=false;
  late VideoPlayerController _videoPlayerController1;
  ChewieController? _chewieController;


  @override
  void initState() {
    super.initState();
    initializePlayer();
    likeValueRed=widget.post.isLike;
    bookmarkVal=widget.post.isBookmark;
  }
  Future<void> initializePlayer() async {
    _videoPlayerController1 =  VideoPlayerController.network(
      ServiceURL.baseUrl+ widget.post.dataUrl[0],
        // httpHeaders: {
        //   "Authorization": "bearer ${coursesController.token}"
        // }
        );
    await Future.wait([
      _videoPlayerController1.initialize(),
    ]);
    _createChewieController();
    setState(() {});
  }
  void _createChewieController() {
    final subtitles = [
      Subtitle(
        index: 0,
        start: const Duration(seconds: 10),
        end: const Duration(seconds: 20),
        text: 'Whats up? :)',
        // text: const TextSpan(
        //   text: 'Whats up? :)',
        //   style: TextStyle(color: Colors.amber, fontSize: 22, fontStyle: FontStyle.italic),
        // ),
      ),
    ];

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: false,
      //aspectRatio: 16 / 9,
      looping: false,
      showControlsOnInitialize: true,
      additionalOptions: (context) {
        return <OptionItem>[
          OptionItem(
            onTap: toggleVideo,
            iconData: Icons.live_tv_sharp,
            title: 'Toggle Video Src',
          ),
        ];
      },
      // subtitle: Subtitles(subtitles),
      subtitleBuilder: (context, dynamic subtitle) => Container(
        padding: const EdgeInsets.all(10.0),
        child: subtitle is InlineSpan
            ? RichText(
          text: subtitle,
        )
            : Text(
          subtitle.toString(),
          style: const TextStyle(color: Colors.black),
        ),
      ),

      // Try playing around with some of these other options:

      showControls: true,
      materialProgressColors: ChewieProgressColors(
        playedColor: ColorsApp.primary,
        handleColor: ColorsApp.primaryLight2,
        backgroundColor: Colors.grey,
        bufferedColor: ColorsApp.primaryLight,
      ),
      placeholder: Container(
        color: Colors.grey,
      ),
      autoInitialize: true,
    );
  }
  int currPlayIndex = 0;
  Future<void> toggleVideo() async {
    await _videoPlayerController1.pause();
    currPlayIndex = currPlayIndex == 0 ? 1 : 0;
    await initializePlayer();
  }
  var blogController=Get.put(BlogController());
  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert,size: 22,color: ColorsApp.colorTextTitle,)),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:  [
                      Text(widget.post.writerName, style: const TextStyle(fontSize: 11 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextTitle,fontFamily: "IranSANS"),),
                      Text(widget.post.publishDateShow, style: const TextStyle(fontSize: 9 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextTitle,fontFamily: "IranSANS"),),
                    ],
                  ),
                  const SizedBox(width: 8,),
                   CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(widget.post.writerLogo),
                  ),
                ],
              ),
            ),
          ],
        ),
        GestureDetector(
          onDoubleTap:(){
            blogController.postOperation(context, widget.post.id, "",1,"لایک",likeValueRed);
            if(likeValueRed){
              setState(() {
                likeValueRed=false;
              });
            }else{
             setState(() {
               likeValueRed=true;
             });
            }
            setState(() {
              likeValue=true;
            });
            Future.delayed(const Duration(seconds: 2), () {
              setState(() {
                likeValue=false;
              });

            });

          } ,
          child: Container(
            margin: const EdgeInsets.only(top: 8),
            height: SizeConfig.screenHeight/3.7,
            width: SizeConfig.screenWidth,
            child: Stack(
              children: [
               widget.post.isVideo==false? SizedBox(
                  child: BannerComponent(banners: widget.post.dataUrl,),
                ):Container(
                 margin: const EdgeInsets.only(top: 0, bottom: 0),
                 height: SizeConfig.screenHeight / 3.7,
                 child: Center(
                   child: _chewieController != null &&
                       _chewieController!.videoPlayerController
                           .value.isInitialized
                       ? Chewie(
                     controller: _chewieController!,
                   )
                       : Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: const [
                       CircularProgressIndicator(
                         color: ColorsApp.primary,
                       ),
                       SizedBox(height: 20),
                       Text(
                         'در حال بارگذاری...',
                         style:
                         TextStyle(color: ColorsApp.primary),
                       ),
                     ],
                   ),
                 ),
               ),
                likeValue?   Container(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    height: 90,
                    width: 90,
                    "${ConstAddress.icon}favP.svg",color: ColorsApp.white,
                  ),
                ) :const SizedBox(),
              ],
            ),
          ),
        ),
        // const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            bookmarkVal? GestureDetector(
              onTap: (){
                blogController.postOperation(context, widget.post.id, "",2,"علامت",bookmarkVal);
                if(bookmarkVal){
                  setState(() {
                    bookmarkVal=false;
                  });
                }else{
                  setState(() {
                    bookmarkVal=true;
                  });
                }
              },
              child: Container(
                margin: const EdgeInsets.only(left: 15),
                height: 20,
                width: 20,
                child: SvgPicture.asset(
                  "${ConstAddress.icon}bookmarkP.svg",color: ColorsApp.textUnSelected,
                ),
              ),
            ): GestureDetector(
              onTap: (){
                blogController.postOperation(context, widget.post.id, "",2,"علامت",bookmarkVal);
                if(bookmarkVal){
                  setState(() {
                    bookmarkVal=false;
                  });
                }else{
                  setState(() {
                    bookmarkVal=true;
                  });
                }
              },
              child: Container(
                margin: const EdgeInsets.only(left: 15),
                height: 20,
                width: 20,
                child: SvgPicture.asset(
                  "${ConstAddress.icon}bookmark.svg",color: ColorsApp.textUnSelected,
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Share.share("http://education.co/?type=Product&id=${widget.post.id}"
                        .toString());
                  },
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: SizedBox(
                      height: 25,
                      width: 25,
                      child: SvgPicture.asset(
                        "${ConstAddress.icon}send.svg",color: ColorsApp.textUnSelected,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20,),
                GestureDetector(
                  onTap: (){
                    showCupertinoModalBottomSheet(
                        expand: true,
                        context: context,
                        useRootNavigator: true,
                        backgroundColor: ColorsApp.white,
                        builder: (BuildContext context) =>
                            ModalComments(post: widget.post,));
                  },
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: SvgPicture.asset(
                      "${ConstAddress.icon}com.svg",color: ColorsApp.textUnSelected,


                    ),
                  ),
                ),
                const SizedBox(width: 20,),
                likeValueRed?  GestureDetector(
                  onTap: (){
                    blogController.postOperation(context, widget.post.id, "",1,"لایک",likeValueRed);
                    if(likeValueRed){
                      setState(() {
                        likeValueRed=false;
                      });
                    }else{
                      setState(() {
                        likeValueRed=true;
                      });
                    }
                  },
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: SvgPicture.asset(
                      "${ConstAddress.icon}favP.svg",color: ColorsApp.red,
                    ),
                  ),
                ):
                GestureDetector(
                  onTap: (){
                    blogController.postOperation(context, widget.post.id, "",1,"لایک",likeValueRed);
                    if(likeValueRed){
                     setState(() {
                       likeValueRed=false;
                     });
                    }else{
                     setState(() {
                       likeValueRed=true;
                     });
                    }
                  },
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: SvgPicture.asset(
                      "${ConstAddress.icon}f.svg",color: ColorsApp.textUnSelected,
                    ),
                  ),
                ),
                const SizedBox(width: 20,),
              ],
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(right: 20,top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children:  [
              const  Text("نفر این پست را پسندیده اند" , style: TextStyle(fontSize: 10 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextTitle,fontFamily: "IranSANS"),),
              const  SizedBox(width: 5,),
              Text(widget.post.countLike.toString() , style: const TextStyle(fontSize: 11 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextTitle,fontFamily: "IranSANS"),),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(widget.post.writerName , style: const TextStyle(fontSize: 12 , fontWeight: FontWeight.bold , color: ColorsApp.colorTextTitle,fontFamily: "IranSANS"),textDirection: TextDirection.rtl,),
            ],
          ),
        ),
        Container(alignment: Alignment.centerRight,
          width: SizeConfig.screenWidth,
          margin: const EdgeInsets.only(right: 20,top: 5,left: 15),
          child: Wrap(
            alignment: WrapAlignment.end,
            children:  [
              Text(widget.post.postAbstract ,
                style:const TextStyle(fontSize: 11 , fontWeight: FontWeight.normal , color: ColorsApp.colorTextTitle,fontFamily: "IranSANS"),textDirection: TextDirection.rtl,textAlign:
                TextAlign.justify,),


            ],
          ),
        ),
        const SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: (){
                showCupertinoModalBottomSheet(
                    expand: true,
                    context: context,
                    useRootNavigator: true,
                    backgroundColor: ColorsApp.white,
                    builder: (BuildContext context) =>

                     ModalComments(post: widget.post,));
              },
              child: Container(alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(right: 0,top: 5,left: 20),
                child: Text("دیدن همه ${widget.post.countComment} نظر" , style: const TextStyle(fontSize: 11 , fontWeight: FontWeight.bold , color: ColorsApp.primary,fontFamily: "IranSANS"),textDirection: TextDirection.rtl,
                ),

              ),
            ),
            GestureDetector(
              onTap: (){
                showCupertinoModalBottomSheet(
                    expand: true,
                    context: context,
                    useRootNavigator: true,
                    backgroundColor: ColorsApp.white,
                    builder: (BuildContext context) =>

                     ModalDescription(des: widget.post.descript, writerName: widget.post.writerName, publishDate: widget.post.publishDateShow, logo: widget.post.writerLogo,));
              },
              child: Container(alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(right: 20,top: 5,left: 10),
                child:const Text("دیدن متن کامل" , style: TextStyle(fontSize: 11 , fontWeight: FontWeight.bold , color: ColorsApp.primary,fontFamily: "IranSANS"),textDirection: TextDirection.rtl,
                ),

              ),
            ),
          ],
        ),
        const SizedBox(height: 0,)

      ],
    );
  }
}
