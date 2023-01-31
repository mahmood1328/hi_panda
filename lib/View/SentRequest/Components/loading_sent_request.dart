import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';
import '../../../utils/res/colors.dart';

import '../../../utils/size_config.dart';


class LoadingSentRequest extends StatelessWidget {
  const LoadingSentRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.white,
      body: Container (
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 10),
          child: ListView(
            children: [
              const SizedBox(height: 80,),
              SkeletonAnimation(
                shimmerColor: Colors.grey,
                shimmerDuration: 500,
                child: Padding(
                    padding: const EdgeInsets.only(top: 10,right: 30,left: 30),
                    child: Container(
                      height: SizeConfig.screenHeight/3.5,
                      width: SizeConfig.screenWidth,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),

                        color: Color(0xffe1e1e1),
                      ),
                    )
                ),
              ),
              SkeletonAnimation(
                shimmerColor: Colors.grey,
                shimmerDuration: 500,
                child: Padding(
                  padding:  const EdgeInsets.only(top:  10, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          color: Color(0xffe1e1e1),
                        ),
                        height: 20,
                        width: 200,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              SkeletonAnimation(
                shimmerColor: Colors.grey,
                shimmerDuration: 500,
                child: Padding(
                    padding: const EdgeInsets.only(top: 10,right: 30,left: 30),
                    child: Container(
                      height: 20,
                      width: SizeConfig.screenWidth,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Color(0xffe1e1e1),
                      ),
                    )
                ),
              ),
              SkeletonAnimation(
                shimmerColor: Colors.grey,
                shimmerDuration: 500,
                child: Padding(
                    padding: const EdgeInsets.only(top: 10,right: 30,left: 30),
                    child: Container(
                      height: 20,
                      width: SizeConfig.screenWidth,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Color(0xffe1e1e1),
                      ),
                    )
                ),
              ),
              SkeletonAnimation(
                shimmerColor: Colors.grey,
                shimmerDuration: 500,
                child: Padding(
                    padding: const EdgeInsets.only(top: 10,right: 30,left: 30),
                    child: Container(
                      height: 20,
                      width: SizeConfig.screenWidth,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Color(0xffe1e1e1),
                      ),
                    )
                ),
              ),
              SkeletonAnimation(
                shimmerColor: Colors.grey,
                shimmerDuration: 500,
                child: Padding(
                    padding: const EdgeInsets.only(top: 10,right: 30,left: 30),
                    child: Container(
                      height: 20,
                      width: SizeConfig.screenWidth,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Color(0xffe1e1e1),
                      ),
                    )
                ),
              ),
              const SizedBox(height: 20,),
              SkeletonAnimation(
                shimmerColor: Colors.grey,
                shimmerDuration: 500,
                child: Padding(
                    padding: const EdgeInsets.only(top: 10,right: 30,left: 30),
                    child: Container(
                      height: 60,
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
              SkeletonAnimation(
                shimmerColor: Colors.grey,
                shimmerDuration: 500,
                child: Padding(
                    padding: const EdgeInsets.only(top: 10,right: 30,left: 30),
                    child: Container(
                      height: 60,
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
              SkeletonAnimation(
                shimmerColor: Colors.grey,
                shimmerDuration: 500,
                child: Padding(
                    padding: const EdgeInsets.only(top: 10,right: 30,left: 30),
                    child: Container(
                      height: 60,
                      width: SizeConfig.screenWidth,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
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
