import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../Components/item_blog_components.dart';
import '../Components/loading_blog_list.dart';
import '../Controller/blog_controller.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<BlogController>(
        init: Get.put(BlogController()),
        builder: (blogController) {
          return blogController.loading.value
              ? Scaffold(
            backgroundColor: ColorsApp.white,
            body: Container(
              color: Colors.transparent,
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 70),
                    height: SizeConfig.screenHeight,
                    width: SizeConfig.screenWidth,
                    child: RefreshIndicator(
                      backgroundColor: ColorsApp.primary,
                      onRefresh: () =>blogController.fetchFruit(),
                      child: ListView(
                          physics: const BouncingScrollPhysics(),
                        controller: blogController.scrollController,
                          children: blogController.listPostsModel!.posts.map((e) => Container(
                            padding: const EdgeInsets.only(top: 10),
                            child: ItemBlogComponents( post: e,),
                          )).toList()
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 10
                    ),
                    child: TextField(
                      controller:blogController. controllerSearch,

                      cursorColor: Colors.grey,
                      onChanged: (value) {},
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
//                  autofocus: true,
                      //controller: controllerPhone,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 17.0,
                        color: Colors.black45,
                        fontWeight: FontWeight.normal,
                      ),
                      decoration: InputDecoration(
                        fillColor: ColorsApp.backTextField,
                        filled: true,
                        prefixIcon: GestureDetector(
                          onTap: (){
                            blogController.listPosts(1, 10, blogController.controllerSearch.text);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(7),
                            margin: const EdgeInsets.only(left: 10),
                            child: SvgPicture.asset(
                              "${ConstAddress.icon}Search.svg",
                              color: ColorsApp.iconTextField,
                            ),
                          ),
                        ),
                        counterText: "",
                        contentPadding:
                        const EdgeInsets.only(left: 16, right: 5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: const BorderSide(
                            color: ColorsApp.backTextField,
                            width: 0.7,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: ColorsApp.backTextField,
                            width: 0.7,
                          ),
                          borderRadius: BorderRadius.circular(32),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: ColorsApp.backTextField,
                            width: 0.7,
                          ),
                          borderRadius: BorderRadius.circular(32),
                        ),
                        hintText: "جستجو ",
                        hintStyle: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                            color: ColorsApp.iconTextField,
                            fontFamily: 'IranSANS'),
                      ),
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      // maxLength: 11,
                    ),
                  ),
                  // ItemBlogComponents(imageOrVideo: false,),
                  // ItemBlogComponents(imageOrVideo: true,)
                ],
              ),
            ),
          )
              : const LoadingBlogList();
        });

  }
}
