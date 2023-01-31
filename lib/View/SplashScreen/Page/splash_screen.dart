
import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import '../../../utils/const.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../../Login/page/login_screen.dart';
import '../../Main_page/Page/main_page.dart';
import '../Controller/splash_controller.dart';
class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}
class _SplashScreenPageState extends State<SplashScreenPage> {
  Map _source = {ConnectivityResult.none: false};
  final MyConnectivity _connectivity = MyConnectivity.instance;
  final box = GetStorage();
  late Timer timer;
  @override
  void initState() {
    super.initState();
    _connectivity.initialise();
    try{
      _connectivity.myStream.listen((source) {
        setState(() => _source = source);
      });
    }catch(ignored){}

  }


  bool checkInternet=false;
  errorNetwork(){
    setState(() {
      checkInternet=true;
    });
    // ShowSnackBar().showSnackBar(
    //   context,
    //   'error Connection',
    //   noAction: true
    // );
  }

  checked()async{
    if(box.read("tokenn")!=null){
      // Get.to(()=>  MainPage());

      timer.cancel();

      await Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => MainPage()));
    }else if(box.read("tokenn")==null) {
      //Get.to(()=>  guestPage());
      timer.cancel();

      await  Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) =>  LoginScreen()));
      timer.cancel();

    }
  }

  // chekNetwork()async {
  //   if(box.read("intro")!=null  ){
  //     checked();
  //     timer.cancel();
  //   }else if(box.read("intro")==null){
  //     //Get.to(()=>  IntroPage());
  //     await  Navigator.pushReplacement(context,
  //         MaterialPageRoute(builder: (context) => StartAppScreen()));
  //     timer.cancel();
  //
  //   }else if(box.read("tokenn")==null) {
  //     // Get.to(()=>  guestPage());
  //     await  Navigator.pushReplacement(context,
  //         MaterialPageRoute(builder: (context) => const StartAppScreen()));
  //     timer.cancel();
  //
  //   }
  //   // Get.to(()=>  guestPage());
  //
  //
  // }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
    _connectivity.disposeStream();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    timer=  Timer(const Duration(seconds: 13) , (){
      print(_source.keys.toList()[0]);
      //String error;
      switch (_source.keys.toList()[0]) {
        case ConnectivityResult.mobile:
        //error = 'Mobile: Online';

          checked();
          break;
        case ConnectivityResult.wifi:
        //error = 'WiFi: Online';

          checked();
          break;
        case ConnectivityResult.none:
        default:
        // error = 'Offline';
          //kIsWeb?profile(): errorNetwork();

      }

    });

    return Scaffold(
      backgroundColor: ColorsApp.white,
      body: SizedBox(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Stack(
          children: [
            Center(child: Image.asset("${ConstAddress.image}logoPanda.png",height:SizeConfig.screenHeight/4,width:SizeConfig.screenWidth/1.5  ,)),
            Align(
              alignment: Alignment.bottomCenter,
              child:  SizedBox(
                  height: SizeConfig.screenHeight/3,
                  width: SizeConfig.screenWidth/3,
                  child: Lottie.asset("${ConstAddress.lottie}loading1.json")),
            ),
            checkInternet?BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: Colors.black.withOpacity(0.5),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      const SizedBox(height: 20,),
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height/4,
                          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/5),
                          child: Image.asset("${ConstAddress.image}noWifi.png",color: ColorsApp.primary,),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      const Text("Ooops!",style: TextStyle(color: Colors.white,fontSize: 22),),
                      const SizedBox(height: 20,),
                      const Text("No internet connection found. \n     Cheak your connection",style: TextStyle(color: Colors.white,fontSize: 16),),

                      GestureDetector(
                        onTap: () {

                          setState(() {
                            checkInternet=false;
                          });
                        },
                        child: Container(
                          height: 35,
                          width: 110,
                          margin: const EdgeInsets.only(top: 30),
                          decoration: const BoxDecoration(
                              // boxShadow:const [
                              //   BoxShadow(
                              //       color: ColorsApp.primary,
                              //       blurRadius: 4.0,
                              //       spreadRadius: 2.0)
                              // ],
                              color: ColorsApp.primary,
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Try Again",
                                style: TextStyle(fontSize: 15, color: Colors.white,fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),


            ):Container()
          ],
        ),
      ),
    );
  }
}


class MyConnectivity {
  MyConnectivity._();

  static final _instance = MyConnectivity._();
  static MyConnectivity get instance => _instance;
  final _connectivity = Connectivity();
  final _controller = StreamController.broadcast();
  Stream get myStream => _controller.stream;

  void initialise() async {
    ConnectivityResult result = await _connectivity.checkConnectivity();
    _checkStatus(result);
    _connectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result);
    });
  }

  void _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('example.com');
      isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isOnline = false;
    }
    _controller.sink.add({result: isOnline});
  }

  void disposeStream() => _controller.close();
}