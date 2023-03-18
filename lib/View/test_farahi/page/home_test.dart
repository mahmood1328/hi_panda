import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Helper/notification.dart';
import '../../../Widget/modal_error.dart';
import '../../../Widget/modal_logout.dart';
import '../../../main.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../../Dictionary Page/View/dictionary_page.dart';
import '../../SentRequest/Page/sent_request_page.dart';
import '../components/item_test.dart';
import '../components/loading.dart';
import '../controller/courses.dart';

class HomeTestPage extends StatefulWidget {
  const HomeTestPage({Key? key}) : super(key: key);

  @override
  State<HomeTestPage> createState() => _HomeTestPageState();
}

class _HomeTestPageState extends State<HomeTestPage> {
 var coursesController =Get.put(CoursesController());
 final box = GetStorage();
 String notificationTitle = '';
 String notificationBody = '';
 String notificationData = '';
 _changeData(String msg) {
   setState(() => notificationData = msg);
   setState(() => showNotification());


 }
 void showNotification() {
   setState(() {
   });

   flutterLocalNotificationsPlugin.show(
       0,
       "$notificationTitle",
       "$notificationBody",
       NotificationDetails(
           android: AndroidNotificationDetails(
               channel.id, channel.name,
               importance: Importance.high,
               color: Colors.blue,
               playSound: true,
               icon: '@mipmap/ic_launcher')));
 }

 _changeBody(String msg) {
   setState(() => notificationBody = msg);
   setState(() => showNotification());
 }
 _changeTitle(String msg) {
   setState(() => notificationTitle = msg);
   setState(() => showNotification());
 }

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    coursesController. getMyCourses(context);
    coursesController.title.value=box.read("name");
    coursesController.token.value=box.read("tokenn");
    final firebaseMessaging = FCM();
    firebaseMessaging.setNotifications();
    firebaseMessaging.streamCtlr.stream.listen(_changeData);
    firebaseMessaging.bodyCtlr.stream.listen(_changeBody);
    firebaseMessaging.titleCtlr.stream.listen(_changeTitle);

 }
  @override
  Widget build(BuildContext context) {
    // coursesController. getMyCourses();
    return GetX<CoursesController>(
        init: coursesController,
        builder: (coursesController) {
          return coursesController.isLoading.value
              ? Scaffold(
            backgroundColor: ColorsApp.white,
            body: SizedBox(
              height:SizeConfig.screenHeight,
              width:SizeConfig.screenWidth,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Container(
                    //   height:40,
                    //   width:SizeConfig.screenWidth,
                    //   decoration: const BoxDecoration(
                    //       color: ColorsApp.primary,
                    //       borderRadius:BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                    //      //border: Border.all(width: 1,color: ColorsApp.primaryLight.withOpacity(0.3))
                    //
                    //   ),
                    // ),
                     const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [

                              Row(
                                children: [
                                  Image.asset("${ConstAddress.image}hi.png",height: 30,width: 30,),
                                  const SizedBox(width: 10,),
                                  Text(coursesController.title.value,
                                    style:const TextStyle(color: ColorsApp.primary,fontSize: 19,fontFamily: "IranSANS",fontWeight: FontWeight.bold),),
                                ],
                              ),
                             const SizedBox(width: 5,),
                              Text("،سلام",
                                style: TextStyle(color: ColorsApp.black.withOpacity(0.8),fontSize: 18,fontFamily: "IranSANS",fontWeight: FontWeight.bold),),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                      height: 60,
                      width:SizeConfig.screenWidth,
                      decoration: BoxDecoration(
                          borderRadius:const BorderRadius.all( Radius.circular(15)),
                          border: Border.all(color: ColorsApp.primaryLight.withOpacity(0.5),width: 1)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          GestureDetector(
                            onTap: (){
                              // launch("https://whatsapp://send?text=پشتیبان عزیز من در خصوص دوره های شما نیاز به مشاوره دارم&phone=");
                              Get.to(SentRequestPage());
                            },
                            child: Container(
                              padding:const EdgeInsets.only(right: 15,left: 15,top: 5,bottom: 5),
                              decoration:const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: ColorsApp.primary
                              ),
                              child:const Text("کلیک کنید",
                                style: TextStyle(color: ColorsApp.white,fontSize: 14,fontFamily: "IranSANS",fontWeight: FontWeight.normal),) ,
                            ),
                          ),
                          const SizedBox(width: 15,),
                          const Text("رایگان",
                            style: TextStyle(color: ColorsApp.red,fontSize: 16,fontFamily: "IranSANS",fontWeight: FontWeight.bold),),
                          const SizedBox(width: 5,),
                          Text("درخواست مشاوره",
                            style: TextStyle(color: ColorsApp.black.withOpacity(0.8),fontSize: 16,fontFamily: "IranSANS",fontWeight: FontWeight.normal),),
                        ],
                      ),
                    ),
                    coursesController.category.isNotEmpty?
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: SizedBox(
                        height:50,
                        width:SizeConfig.screenWidth,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: coursesController.category.map((element) =>
                                GestureDetector(
                                  onTap: (){
                                    coursesController.getId(element.id);
                                    coursesController.changeCategory();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 5,bottom: 5,left: 15,right: 15),
                                    margin:const EdgeInsets.only(left: 5,right: 5),
                                    decoration: BoxDecoration(
                                        color:coursesController.idCat.value==element.id? ColorsApp.primary: ColorsApp.white,
                                        borderRadius: const BorderRadius.all(Radius.circular(30))),
                                    child: Text(element.title,style: TextStyle(fontSize: 14,color:coursesController.idCat.value==element.id?
                                    ColorsApp.white:
                                    ColorsApp.black,fontFamily: "IranSANS"),),
                                  ),
                                )).toList(),
                          ),
                        ),
                      ),
                    ):
                    const SizedBox(),
                    SizedBox(
                      height: SizeConfig.screenHeight/1.6,
                      width: SizeConfig.screenWidth,
                      child: RefreshIndicator(
                        color: ColorsApp.white,
                        backgroundColor: ColorsApp.primary,
                        onRefresh: () =>coursesController.fetchFruit(context),
                        child: ListView(
                          children: [
                            Column(
                              children:coursesController.listMyCoursesCat.isNotEmpty? coursesController.listMyCoursesCat.map((element) => ItemTest(course: element,)).toList()
                                  :coursesController.listMyCourses.map((element) => ItemTest(course: element,)).toList()
                              ,
                            ),
                          ],
                        ),
                      ),
                    )


                  ],
                ),
              ),
            ),
          )
              : const LoadingHome();
        });


  }
}
