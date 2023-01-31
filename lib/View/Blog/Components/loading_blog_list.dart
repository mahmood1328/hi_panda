import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';
import '../../../utils/res/colors.dart';

import '../../../utils/size_config.dart';


class LoadingBlogList extends StatelessWidget {
  const LoadingBlogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.white,
      body: Container (
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 0),
          child: ListView(
            children: [
              const SizedBox(height: 0,),
              SkeletonAnimation(
                shimmerColor: Colors.grey,
                shimmerDuration: 500,
                child: Padding(
                    padding: const EdgeInsets.only(top: 0,right: 20,left: 20),
                    child: Container(
                      height: 50,
                      width: SizeConfig.screenWidth,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),

                        color: Color(0xffe1e1e1),
                      ),
                    )
                ),
              ),

              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListTile(
                    leading:SkeletonAnimation(
                      shimmerColor: Colors.grey,
                      shimmerDuration: 500,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 0,right: 0,left: 0),
                          child: Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),

                              color: Color(0xffe1e1e1),
                            ),
                          )
                      ),
                    ),
                    title: SkeletonAnimation(
                      shimmerColor: Colors.grey,
                      shimmerDuration: 500,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 10,right: 0,left: 0),
                          child: Container(
                            height: 10,
                            width: SizeConfig.screenWidth/3,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),

                              color: Color(0xffe1e1e1),
                            ),
                          )
                      ),
                    ),
                    subtitle: SkeletonAnimation(
                      shimmerColor: Colors.grey,
                      shimmerDuration: 500,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 10,right: 0,left: 0),
                          child: Container(
                            height: 10,
                            width: SizeConfig.screenWidth/4,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),

                              color: Color(0xffe1e1e1),
                            ),
                          )
                      ),
                    ),
                    trailing: SkeletonAnimation(
                      shimmerColor: Colors.grey,
                      shimmerDuration: 500,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 10,right: 0,left: 0),
                          child: Container(
                            height: 10,
                            width: SizeConfig.screenWidth/10,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),

                              color: Color(0xffe1e1e1),
                            ),
                          )
                      ),
                    ),
                  ),
                ),
              ),
              SkeletonAnimation(
                shimmerColor: Colors.grey,
                shimmerDuration: 500,
                child: Padding(
                    padding: const EdgeInsets.only(top: 10,right: 0,left: 0),
                    child: Container(
                      height: SizeConfig.screenHeight/3,
                      width: SizeConfig.screenWidth,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(0),
                        ),

                        color: Color(0xffe1e1e1),
                      ),
                    )
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListTile(
                    leading:SkeletonAnimation(
                      shimmerColor: Colors.grey,
                      shimmerDuration: 500,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 0,right: 0,left: 0),
                          child: Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),

                              color: Color(0xffe1e1e1),
                            ),
                          )
                      ),
                    ),
                    title: SkeletonAnimation(
                      shimmerColor: Colors.grey,
                      shimmerDuration: 500,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 10,right: 0,left: 0),
                          child: Container(
                            height: 10,
                            width: SizeConfig.screenWidth/3,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),

                              color: Color(0xffe1e1e1),
                            ),
                          )
                      ),
                    ),
                    subtitle: SkeletonAnimation(
                      shimmerColor: Colors.grey,
                      shimmerDuration: 500,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 10,right: 0,left: 0),
                          child: Container(
                            height: 10,
                            width: SizeConfig.screenWidth/4,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),

                              color: Color(0xffe1e1e1),
                            ),
                          )
                      ),
                    ),
                    trailing: SkeletonAnimation(
                      shimmerColor: Colors.grey,
                      shimmerDuration: 500,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 10,right: 0,left: 0),
                          child: Container(
                            height: 10,
                            width: SizeConfig.screenWidth/10,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),

                              color: Color(0xffe1e1e1),
                            ),
                          )
                      ),
                    ),
                  ),
                ),
              ),
              SkeletonAnimation(
                shimmerColor: Colors.grey,
                shimmerDuration: 500,
                child: Padding(
                    padding: const EdgeInsets.only(top: 10,right: 0,left: 0),
                    child: Container(
                      height: SizeConfig.screenHeight/3,
                      width: SizeConfig.screenWidth,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(0),
                        ),

                        color: Color(0xffe1e1e1),
                      ),
                    )
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListTile(
                    leading:SkeletonAnimation(
                      shimmerColor: Colors.grey,
                      shimmerDuration: 500,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 0,right: 0,left: 0),
                          child: Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),

                              color: Color(0xffe1e1e1),
                            ),
                          )
                      ),
                    ),
                    title: SkeletonAnimation(
                      shimmerColor: Colors.grey,
                      shimmerDuration: 500,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 10,right: 0,left: 0),
                          child: Container(
                            height: 10,
                            width: SizeConfig.screenWidth/3,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),

                              color: Color(0xffe1e1e1),
                            ),
                          )
                      ),
                    ),
                    subtitle: SkeletonAnimation(
                      shimmerColor: Colors.grey,
                      shimmerDuration: 500,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 10,right: 0,left: 0),
                          child: Container(
                            height: 10,
                            width: SizeConfig.screenWidth/4,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),

                              color: Color(0xffe1e1e1),
                            ),
                          )
                      ),
                    ),
                    trailing: SkeletonAnimation(
                      shimmerColor: Colors.grey,
                      shimmerDuration: 500,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 10,right: 0,left: 0),
                          child: Container(
                            height: 10,
                            width: SizeConfig.screenWidth/10,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),

                              color: Color(0xffe1e1e1),
                            ),
                          )
                      ),
                    ),
                  ),
                ),
              ),
              SkeletonAnimation(
                shimmerColor: Colors.grey,
                shimmerDuration: 500,
                child: Padding(
                    padding: const EdgeInsets.only(top: 10,right: 0,left: 0),
                    child: Container(
                      height: SizeConfig.screenHeight/3,
                      width: SizeConfig.screenWidth,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(0),
                        ),

                        color: Color(0xffe1e1e1),
                      ),
                    )
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListTile(
                    leading:SkeletonAnimation(
                      shimmerColor: Colors.grey,
                      shimmerDuration: 500,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 0,right: 0,left: 0),
                          child: Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),

                              color: Color(0xffe1e1e1),
                            ),
                          )
                      ),
                    ),
                    title: SkeletonAnimation(
                      shimmerColor: Colors.grey,
                      shimmerDuration: 500,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 10,right: 0,left: 0),
                          child: Container(
                            height: 10,
                            width: SizeConfig.screenWidth/3,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),

                              color: Color(0xffe1e1e1),
                            ),
                          )
                      ),
                    ),
                    subtitle: SkeletonAnimation(
                      shimmerColor: Colors.grey,
                      shimmerDuration: 500,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 10,right: 0,left: 0),
                          child: Container(
                            height: 10,
                            width: SizeConfig.screenWidth/4,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),

                              color: Color(0xffe1e1e1),
                            ),
                          )
                      ),
                    ),
                    trailing: SkeletonAnimation(
                      shimmerColor: Colors.grey,
                      shimmerDuration: 500,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 10,right: 0,left: 0),
                          child: Container(
                            height: 10,
                            width: SizeConfig.screenWidth/10,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),

                              color: Color(0xffe1e1e1),
                            ),
                          )
                      ),
                    ),
                  ),
                ),
              ),
              SkeletonAnimation(
                shimmerColor: Colors.grey,
                shimmerDuration: 500,
                child: Padding(
                    padding: const EdgeInsets.only(top: 10,right: 0,left: 0),
                    child: Container(
                      height: SizeConfig.screenHeight/3,
                      width: SizeConfig.screenWidth,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(0),
                        ),

                        color: Color(0xffe1e1e1),
                      ),
                    )
                ),
              ),





            ],
          )),
    );
  }
}
