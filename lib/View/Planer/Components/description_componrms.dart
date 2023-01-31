import 'package:flutter/material.dart';

import '../../../utils/res/colors.dart';

class DescriptionComponents extends StatelessWidget {
  const DescriptionComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.white,
      body: SizedBox(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "توضیحات دوره : ",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ColorsApp.colorTextT1.withOpacity(0.5),
                        fontFamily: "IranSANS"),textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                children: [
                  Text(
                    "از مهم‌ترین دلایل و مزایایی که ما را به آموزش زبان انگلیسی ترغیب می‌کند می‌توان به جهانی بودن این زبان، استفاده از آن در برقراری ارتباط با آدم‌های جدید، استفاده از آن برای خواندن مقالات علمی و معتبر دنیا، کاربرد آن در اینترنت، استفاده از آن در سفر به کشورهای مختلف، بهره گیری از آن در تجارت و استفاده از آن برای تحصیل در دانشگاه‌های جهانی اشاره کرد.",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: ColorsApp.colorTextT1.withOpacity(0.5),
                        fontFamily: "IranSANS"),textDirection: TextDirection.rtl,maxLines: 5,textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
