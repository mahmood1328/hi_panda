
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../Models/banner.dart';
import '../../../Network/service_url.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';

class BannerComponent extends StatelessWidget {
  final List<String> banners;
  const BannerComponent({Key? key,required this.banners }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final PageController controller = PageController();
    return SizedBox(
           height: SizeConfig.screenHeight,
           width: SizeConfig.screenWidth,
      child: Column(
        children: [
          Container(
            width: screenSize.width ,
            height: (screenSize.width) / 1.8,
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Stack(
                children: [
                  PageView(
                    children: banners
                        .map(
                          (e) => GestureDetector(
                        onTap: (){
                        },
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(ServiceURL.baseUrl+e ),
                                fit: BoxFit.cover
                            ),
                          ),
                        ),
                      ),
                    )
                        .toList(),
                    controller: controller,
                  ),

                ],
              ),
            ),
          ),
          banners.length==1?SizedBox():  Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SmoothPageIndicator(
                  controller: controller,
                  // PageController
                  count: banners == null ? 3 : banners.length,
                  effect:  ScrollingDotsEffect(
                      dotHeight: 7,
                      dotWidth: 7,
                      activeStrokeWidth: 10,
                      dotColor: ColorsApp.textColorSub,
                      activeDotColor: ColorsApp.colorTextTitle),
                  // your preferred effect
                  onDotClicked: (index) {}),
            ),
          ),
        ],
      ),
    );
  }
}
