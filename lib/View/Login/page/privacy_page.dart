import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../Network/service_url.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: ColorsApp.white,
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Column(
          children: [
            Container(child: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color: Colors.black,)),height:50 ,alignment: Alignment.topLeft,padding: EdgeInsets.only(left: 10,top: 10),),
            SizedBox(
              height: SizeConfig.screenHeight-50,
              width: SizeConfig.screenWidth,
              child:WebView(
                initialUrl: '${ServiceURL.baseUrlWebView}',
                javascriptMode: JavascriptMode.unrestricted,

              ),
            ),
          ],
        ),
      ),);

  }
}
