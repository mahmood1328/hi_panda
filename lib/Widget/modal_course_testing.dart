
// class ModalCourseTesting extends StatefulWidget {
//   const ModalCourseTesting({Key? key}) : super(key: key);
//
//
//   @override
//   _ModalCourseTestingState createState() => _ModalCourseTestingState();
//
// }
//
// class _ModalCourseTestingState extends State<ModalCourseTesting> {
//
//   @override
//   void initState() {
//     super.initState();
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//         color: ColorsApp.white,
//         child: SizedBox(
//           height: SizeConfig.screenHeight,
//           width: SizeConfig.screenWidth,
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   "تمرین شماره 22 : تست مکالمه ",
//                   style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                       color: ColorsApp.colorTextT1.withOpacity(0.5),
//                       fontFamily: "IranSANS"),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   height: 1,width: SizeConfig.screenWidth,
//                   color: ColorsApp.backTextField,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Card(
//                   margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
//                   color:   ColorsApp.white,
//                   elevation: 3,
//                   surfaceTintColor: Colors.grey,
//                   shadowColor:Colors.grey ,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   semanticContainer: true,
//                   clipBehavior: Clip.hardEdge,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             Text(
//                               "عبارت انگلیسی کلمه سلام را پیدا کنید ",
//                               style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w500,
//                                   color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                   fontFamily: "IranSANS"),
//                             ),
//                             Text(
//                               "- 1 ",
//                               style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w500,
//                                   color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                   fontFamily: "IranSANS"),
//                             ),
//                           ],
//                         ),
//                        const SizedBox(height: 10,),
//                         SizedBox(
//                           width: SizeConfig.screenWidth,
//                           child: Wrap(
//                             alignment: WrapAlignment.spaceAround,
//                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Wrap(
//                                 children: [
//
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     child: Text(
//                                       "1-",
//                                       style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.w500,
//                                           color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                           ),
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
//                                     // margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     decoration: BoxDecoration(
//                                       borderRadius: const BorderRadius.all(Radius.circular(10)),
//                                       border: Border.all(color: ColorsApp.primary),
//                                       color: ColorsApp.primaryLight
//
//                                     ),
//                                     child: Text(
//                                       "Hello Hello  ",
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w600,
//                                           color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                           fontFamily: "IranSANS"),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(width: 10,),
//                               Wrap(
//                                 children: [
//
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     child: Text(
//                                       "2-",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500,
//                                         color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
//                                     // margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     decoration: BoxDecoration(
//                                         borderRadius: const BorderRadius.all(Radius.circular(10)),
//                                         border: Border.all(color: ColorsApp.primary),
//                                         color: ColorsApp.white
//
//                                     ),
//                                     child: Text(
//                                       "Hello Hello  ",
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w600,
//                                           color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                           fontFamily: "IranSANS"),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 10,),
//                         SizedBox(
//                           width: SizeConfig.screenWidth,
//                           child: Wrap(
//                             alignment: WrapAlignment.spaceAround,
//                             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Wrap(
//                                 children: [
//
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     child: Text(
//                                       "3-",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500,
//                                         color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
//                                     // margin: const EdgeInsets.symmetric(vertical: 0,horizontal: 0),
//                                     decoration: BoxDecoration(
//                                         borderRadius: const BorderRadius.all(Radius.circular(10)),
//                                         border: Border.all(color: ColorsApp.primary),
//                                         color: ColorsApp.white
//
//                                     ),
//                                     child: Text(
//                                       "Hello Hello  ",
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w600,
//                                           color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                           fontFamily: "IranSANS"),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(width: 10,),
//                               Wrap(
//                                 children: [
//
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     child: Text(
//                                       "4-",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500,
//                                         color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
//                                     // margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     decoration: BoxDecoration(
//                                         borderRadius: const BorderRadius.all(Radius.circular(10)),
//                                         border: Border.all(color: ColorsApp.primary),
//                                         color: ColorsApp.white
//
//                                     ),
//                                     child: Text(
//                                       "Hello Hello  ",
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w600,
//                                           color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                           fontFamily: "IranSANS"),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Card(
//                   margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
//                   color:   ColorsApp.white,
//                   elevation: 3,
//                   surfaceTintColor: Colors.grey,
//                   shadowColor:Colors.grey ,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   semanticContainer: true,
//                   clipBehavior: Clip.hardEdge,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             Text(
//                               "عبارت انگلیسی کلمه سلام را پیدا کنید ",
//                               style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w500,
//                                   color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                   fontFamily: "IranSANS"),
//                             ),
//                             Text(
//                               "- 1 ",
//                               style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w500,
//                                   color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                   fontFamily: "IranSANS"),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 10,),
//                         SizedBox(
//                           width: SizeConfig.screenWidth,
//                           child: Wrap(
//                             alignment: WrapAlignment.spaceAround,
//                             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Wrap(
//                                 children: [
//
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     child: Text(
//                                       "1-",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500,
//                                         color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
//                                     // margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     decoration: BoxDecoration(
//                                         borderRadius: const BorderRadius.all(Radius.circular(10)),
//                                         border: Border.all(color: ColorsApp.primary),
//                                         color: ColorsApp.primaryLight
//
//                                     ),
//                                     child: Text(
//                                       "Hello Hello  ",
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w600,
//                                           color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                           fontFamily: "IranSANS"),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(width: 10,),
//                               Wrap(
//                                 children: [
//
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     child: Text(
//                                       "2-",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500,
//                                         color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
//                                     // margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     decoration: BoxDecoration(
//                                         borderRadius: const BorderRadius.all(Radius.circular(10)),
//                                         border: Border.all(color: ColorsApp.primary),
//                                         color: ColorsApp.white
//
//                                     ),
//                                     child: Text(
//                                       "Hello Hello  ",
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w600,
//                                           color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                           fontFamily: "IranSANS"),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 10,),
//                         SizedBox(
//                           width: SizeConfig.screenWidth,
//                           child: Wrap(
//                             alignment: WrapAlignment.spaceAround,
//                             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Wrap(
//                                 children: [
//
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     child: Text(
//                                       "3-",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500,
//                                         color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
//                                     // margin: const EdgeInsets.symmetric(vertical: 0,horizontal: 0),
//                                     decoration: BoxDecoration(
//                                         borderRadius: const BorderRadius.all(Radius.circular(10)),
//                                         border: Border.all(color: ColorsApp.primary),
//                                         color: ColorsApp.white
//
//                                     ),
//                                     child: Text(
//                                       "Hello Hello  ",
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w600,
//                                           color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                           fontFamily: "IranSANS"),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(width: 10,),
//                               Wrap(
//                                 children: [
//
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     child: Text(
//                                       "4-",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500,
//                                         color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
//                                     // margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     decoration: BoxDecoration(
//                                         borderRadius: const BorderRadius.all(Radius.circular(10)),
//                                         border: Border.all(color: ColorsApp.primary),
//                                         color: ColorsApp.white
//
//                                     ),
//                                     child: Text(
//                                       "Hello Hello  ",
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w600,
//                                           color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                           fontFamily: "IranSANS"),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Card(
//                   margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
//                   color:   ColorsApp.white,
//                   elevation: 3,
//                   surfaceTintColor: Colors.grey,
//                   shadowColor:Colors.grey ,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   semanticContainer: true,
//                   clipBehavior: Clip.hardEdge,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             Text(
//                               "عبارت انگلیسی کلمه سلام را پیدا کنید ",
//                               style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w500,
//                                   color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                   fontFamily: "IranSANS"),
//                             ),
//                             Text(
//                               "- 1 ",
//                               style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w500,
//                                   color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                   fontFamily: "IranSANS"),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 10,),
//                         SizedBox(
//                           width: SizeConfig.screenWidth,
//                           child: Wrap(
//                             alignment: WrapAlignment.spaceAround,
//                             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Wrap(
//                                 children: [
//
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     child: Text(
//                                       "1-",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500,
//                                         color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
//                                     // margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     decoration: BoxDecoration(
//                                         borderRadius: const BorderRadius.all(Radius.circular(10)),
//                                         border: Border.all(color: ColorsApp.primary),
//                                         color: ColorsApp.primaryLight
//
//                                     ),
//                                     child: Text(
//                                       "Hello Hello  ",
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w600,
//                                           color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                           fontFamily: "IranSANS"),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(width: 10,),
//                               Wrap(
//                                 children: [
//
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     child: Text(
//                                       "2-",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500,
//                                         color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
//                                     // margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     decoration: BoxDecoration(
//                                         borderRadius: const BorderRadius.all(Radius.circular(10)),
//                                         border: Border.all(color: ColorsApp.primary),
//                                         color: ColorsApp.white
//
//                                     ),
//                                     child: Text(
//                                       "Hello Hello  ",
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w600,
//                                           color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                           fontFamily: "IranSANS"),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 10,),
//                         SizedBox(
//                           width: SizeConfig.screenWidth,
//                           child: Wrap(
//                             alignment: WrapAlignment.spaceAround,
//                             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Wrap(
//                                 children: [
//
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     child: Text(
//                                       "3-",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500,
//                                         color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
//                                     // margin: const EdgeInsets.symmetric(vertical: 0,horizontal: 0),
//                                     decoration: BoxDecoration(
//                                         borderRadius: const BorderRadius.all(Radius.circular(10)),
//                                         border: Border.all(color: ColorsApp.primary),
//                                         color: ColorsApp.white
//
//                                     ),
//                                     child: Text(
//                                       "Hello Hello  ",
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w600,
//                                           color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                           fontFamily: "IranSANS"),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(width: 10,),
//                               Wrap(
//                                 children: [
//
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     child: Text(
//                                       "4-",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500,
//                                         color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
//                                     // margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     decoration: BoxDecoration(
//                                         borderRadius: const BorderRadius.all(Radius.circular(10)),
//                                         border: Border.all(color: ColorsApp.primary),
//                                         color: ColorsApp.white
//
//                                     ),
//                                     child: Text(
//                                       "Hello Hello  ",
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w600,
//                                           color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                           fontFamily: "IranSANS"),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Card(
//                   margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
//                   color:   ColorsApp.white,
//                   elevation: 3,
//                   surfaceTintColor: Colors.grey,
//                   shadowColor:Colors.grey ,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   semanticContainer: true,
//                   clipBehavior: Clip.hardEdge,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             Text(
//                               "عبارت انگلیسی کلمه سلام را پیدا کنید ",
//                               style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w500,
//                                   color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                   fontFamily: "IranSANS"),
//                             ),
//                             Text(
//                               "- 1 ",
//                               style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w500,
//                                   color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                   fontFamily: "IranSANS"),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 10,),
//                         SizedBox(
//                           width: SizeConfig.screenWidth,
//                           child: Wrap(
//                             alignment: WrapAlignment.spaceAround,
//                             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Wrap(
//                                 children: [
//
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     child: Text(
//                                       "1-",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500,
//                                         color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
//                                     // margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     decoration: BoxDecoration(
//                                         borderRadius: const BorderRadius.all(Radius.circular(10)),
//                                         border: Border.all(color: ColorsApp.primary),
//                                         color: ColorsApp.primaryLight
//
//                                     ),
//                                     child: Text(
//                                       "Hello Hello  ",
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w600,
//                                           color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                           fontFamily: "IranSANS"),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(width: 10,),
//                               Wrap(
//                                 children: [
//
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     child: Text(
//                                       "2-",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500,
//                                         color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
//                                     // margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     decoration: BoxDecoration(
//                                         borderRadius: const BorderRadius.all(Radius.circular(10)),
//                                         border: Border.all(color: ColorsApp.primary),
//                                         color: ColorsApp.white
//
//                                     ),
//                                     child: Text(
//                                       "Hello Hello  ",
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w600,
//                                           color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                           fontFamily: "IranSANS"),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 10,),
//                         SizedBox(
//                           width: SizeConfig.screenWidth,
//                           child: Wrap(
//                             alignment: WrapAlignment.spaceAround,
//                             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Wrap(
//                                 children: [
//
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     child: Text(
//                                       "3-",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500,
//                                         color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
//                                     // margin: const EdgeInsets.symmetric(vertical: 0,horizontal: 0),
//                                     decoration: BoxDecoration(
//                                         borderRadius: const BorderRadius.all(Radius.circular(10)),
//                                         border: Border.all(color: ColorsApp.primary),
//                                         color: ColorsApp.white
//
//                                     ),
//                                     child: Text(
//                                       "Hello Hello  ",
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w600,
//                                           color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                           fontFamily: "IranSANS"),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(width: 10,),
//                               Wrap(
//                                 children: [
//
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     child: Text(
//                                       "4-",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500,
//                                         color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
//                                     // margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     decoration: BoxDecoration(
//                                         borderRadius: const BorderRadius.all(Radius.circular(10)),
//                                         border: Border.all(color: ColorsApp.primary),
//                                         color: ColorsApp.white
//
//                                     ),
//                                     child: Text(
//                                       "Hello Hello  ",
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w600,
//                                           color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                           fontFamily: "IranSANS"),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Card(
//                   margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
//                   color:   ColorsApp.white,
//                   elevation: 3,
//                   surfaceTintColor: Colors.grey,
//                   shadowColor:Colors.grey ,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   semanticContainer: true,
//                   clipBehavior: Clip.hardEdge,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             Text(
//                               "عبارت انگلیسی کلمه سلام را پیدا کنید ",
//                               style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w500,
//                                   color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                   fontFamily: "IranSANS"),
//                             ),
//                             Text(
//                               "- 1 ",
//                               style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w500,
//                                   color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                   fontFamily: "IranSANS"),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 10,),
//                         SizedBox(
//                           width: SizeConfig.screenWidth,
//                           child: Wrap(
//                             alignment: WrapAlignment.spaceAround,
//                             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Wrap(
//                                 children: [
//
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     child: Text(
//                                       "1-",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500,
//                                         color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
//                                     // margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     decoration: BoxDecoration(
//                                         borderRadius: const BorderRadius.all(Radius.circular(10)),
//                                         border: Border.all(color: ColorsApp.primary),
//                                         color: ColorsApp.primaryLight
//
//                                     ),
//                                     child: Text(
//                                       "Hello Hello  ",
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w600,
//                                           color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                           fontFamily: "IranSANS"),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(width: 10,),
//                               Wrap(
//                                 children: [
//
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     child: Text(
//                                       "2-",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500,
//                                         color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
//                                     // margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     decoration: BoxDecoration(
//                                         borderRadius: const BorderRadius.all(Radius.circular(10)),
//                                         border: Border.all(color: ColorsApp.primary),
//                                         color: ColorsApp.white
//
//                                     ),
//                                     child: Text(
//                                       "Hello Hello  ",
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w600,
//                                           color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                           fontFamily: "IranSANS"),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 10,),
//                         SizedBox(
//                           width: SizeConfig.screenWidth,
//                           child: Wrap(
//                             alignment: WrapAlignment.spaceAround,
//                             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Wrap(
//                                 children: [
//
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     child: Text(
//                                       "3-",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500,
//                                         color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
//                                     // margin: const EdgeInsets.symmetric(vertical: 0,horizontal: 0),
//                                     decoration: BoxDecoration(
//                                         borderRadius: const BorderRadius.all(Radius.circular(10)),
//                                         border: Border.all(color: ColorsApp.primary),
//                                         color: ColorsApp.white
//
//                                     ),
//                                     child: Text(
//                                       "Hello Hello  ",
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w600,
//                                           color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                           fontFamily: "IranSANS"),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(width: 10,),
//                               Wrap(
//                                 children: [
//
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     child: Text(
//                                       "4-",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500,
//                                         color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
//                                     // margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     decoration: BoxDecoration(
//                                         borderRadius: const BorderRadius.all(Radius.circular(10)),
//                                         border: Border.all(color: ColorsApp.primary),
//                                         color: ColorsApp.white
//
//                                     ),
//                                     child: Text(
//                                       "Hello Hello  ",
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w600,
//                                           color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                           fontFamily: "IranSANS"),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Card(
//                   margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
//                   color:   ColorsApp.white,
//                   elevation: 3,
//                   surfaceTintColor: Colors.grey,
//                   shadowColor:Colors.grey ,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   semanticContainer: true,
//                   clipBehavior: Clip.hardEdge,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             Text(
//                               "عبارت انگلیسی کلمه سلام را پیدا کنید ",
//                               style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w500,
//                                   color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                   fontFamily: "IranSANS"),
//                             ),
//                             Text(
//                               "- 1 ",
//                               style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w500,
//                                   color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                   fontFamily: "IranSANS"),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 10,),
//                         SizedBox(
//                           width: SizeConfig.screenWidth,
//                           child: Wrap(
//                             alignment: WrapAlignment.spaceAround,
//                             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Wrap(
//                                 children: [
//
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     child: Text(
//                                       "1-",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500,
//                                         color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
//                                     // margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     decoration: BoxDecoration(
//                                         borderRadius: const BorderRadius.all(Radius.circular(10)),
//                                         border: Border.all(color: ColorsApp.primary),
//                                         color: ColorsApp.primaryLight
//
//                                     ),
//                                     child: Text(
//                                       "Hello Hello  ",
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w600,
//                                           color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                           fontFamily: "IranSANS"),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(width: 10,),
//                               Wrap(
//                                 children: [
//
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     child: Text(
//                                       "2-",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500,
//                                         color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
//                                     // margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     decoration: BoxDecoration(
//                                         borderRadius: const BorderRadius.all(Radius.circular(10)),
//                                         border: Border.all(color: ColorsApp.primary),
//                                         color: ColorsApp.white
//
//                                     ),
//                                     child: Text(
//                                       "Hello Hello  ",
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w600,
//                                           color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                           fontFamily: "IranSANS"),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 10,),
//                         SizedBox(
//                           width: SizeConfig.screenWidth,
//                           child: Wrap(
//                             alignment: WrapAlignment.spaceAround,
//                             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Wrap(
//                                 children: [
//
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     child: Text(
//                                       "3-",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500,
//                                         color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
//                                     // margin: const EdgeInsets.symmetric(vertical: 0,horizontal: 0),
//                                     decoration: BoxDecoration(
//                                         borderRadius: const BorderRadius.all(Radius.circular(10)),
//                                         border: Border.all(color: ColorsApp.primary),
//                                         color: ColorsApp.white
//
//                                     ),
//                                     child: Text(
//                                       "Hello Hello  ",
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w600,
//                                           color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                           fontFamily: "IranSANS"),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(width: 10,),
//                               Wrap(
//                                 children: [
//
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     child: Text(
//                                       "4-",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500,
//                                         color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
//                                     // margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                     decoration: BoxDecoration(
//                                         borderRadius: const BorderRadius.all(Radius.circular(10)),
//                                         border: Border.all(color: ColorsApp.primary),
//                                         color: ColorsApp.white
//
//                                     ),
//                                     child: Text(
//                                       "Hello Hello  ",
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w600,
//                                           color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                           fontFamily: "IranSANS"),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Card(
//               margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
//               color:   ColorsApp.white,
//               elevation: 3,
//               surfaceTintColor: Colors.grey,
//               shadowColor:Colors.grey ,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               semanticContainer: true,
//               clipBehavior: Clip.hardEdge,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Text(
//                           "عبارت انگلیسی کلمه سلام را پیدا کنید ",
//                           style: TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w500,
//                               color: ColorsApp.colorTextT1.withOpacity(0.5),
//                               fontFamily: "IranSANS"),
//                         ),
//                         Text(
//                           "- 1 ",
//                           style: TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w500,
//                               color: ColorsApp.colorTextT1.withOpacity(0.5),
//                               fontFamily: "IranSANS"),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10,),
//                     SizedBox(
//                       width: SizeConfig.screenWidth,
//                       child: Wrap(
//                         alignment: WrapAlignment.spaceAround,
//                         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Wrap(
//                             children: [
//
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                 child: Text(
//                                   "1-",
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500,
//                                     color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
//                                 // margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                 decoration: BoxDecoration(
//                                     borderRadius: const BorderRadius.all(Radius.circular(10)),
//                                     border: Border.all(color: ColorsApp.primary),
//                                     color: ColorsApp.primaryLight
//
//                                 ),
//                                 child: Text(
//                                   "Hello Hello  ",
//                                   style: TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w600,
//                                       color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                       fontFamily: "IranSANS"),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(width: 10,),
//                           Wrap(
//                             children: [
//
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                 child: Text(
//                                   "2-",
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500,
//                                     color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
//                                 // margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                 decoration: BoxDecoration(
//                                     borderRadius: const BorderRadius.all(Radius.circular(10)),
//                                     border: Border.all(color: ColorsApp.primary),
//                                     color: ColorsApp.white
//
//                                 ),
//                                 child: Text(
//                                   "Hello Hello  ",
//                                   style: TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w600,
//                                       color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                       fontFamily: "IranSANS"),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 10,),
//                     SizedBox(
//                       width: SizeConfig.screenWidth,
//                       child: Wrap(
//                         alignment: WrapAlignment.spaceAround,
//                         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Wrap(
//                             children: [
//
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                 child: Text(
//                                   "3-",
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500,
//                                     color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
//                                 // margin: const EdgeInsets.symmetric(vertical: 0,horizontal: 0),
//                                 decoration: BoxDecoration(
//                                     borderRadius: const BorderRadius.all(Radius.circular(10)),
//                                     border: Border.all(color: ColorsApp.primary),
//                                     color: ColorsApp.white
//
//                                 ),
//                                 child: Text(
//                                   "Hello Hello  ",
//                                   style: TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w600,
//                                       color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                       fontFamily: "IranSANS"),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(width: 10,),
//                           Wrap(
//                             children: [
//
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                 child: Text(
//                                   "4-",
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500,
//                                     color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
//                                 // margin: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
//                                 decoration: BoxDecoration(
//                                     borderRadius: const BorderRadius.all(Radius.circular(10)),
//                                     border: Border.all(color: ColorsApp.primary),
//                                     color: ColorsApp.white
//
//                                 ),
//                                 child: Text(
//                                   "Hello Hello  ",
//                                   style: TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w600,
//                                       color: ColorsApp.colorTextT1.withOpacity(0.5),
//                                       fontFamily: "IranSANS"),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//               ],
//             ),
//           ),
//         ));
//   }
//
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/res/colors.dart';
import '../../../utils/size_config.dart';
import '../View/Planer/Components/answer_components.dart';
import '../View/Planer/Controller/planner_controller.dart';
import '../View/Planer/Models/planner_session_item_details_model.dart';




class ModalCourseTesting extends StatefulWidget {
  final String title;
  final String desc;
  final int id;
  final List<QuestionGroup>? questionGroup;
   const ModalCourseTesting({Key? key,required this.title,required this.desc,required this.id,required this.questionGroup}) : super(key: key);


  @override
  _ModalCourseTestingState createState() => _ModalCourseTestingState();

}

class _ModalCourseTestingState extends State<ModalCourseTesting> {

  @override
  void initState() {
    super.initState();

  }

  bool isError=false;
  var plannerController=Get.put(PlannerController());
  @override
  Widget build(BuildContext context) {
    return Material(
        color: ColorsApp.white,
        child: SizedBox(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${widget.title} ",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: ColorsApp.colorTextT1.withOpacity(0.5),
                      fontFamily: "IranSANS"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 1,width: SizeConfig.screenWidth,
                  color: ColorsApp.backTextField,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Wrap(
                    alignment: WrapAlignment.end,
                    children: [
                      Text(
                        widget.desc
                        ,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: ColorsApp.colorTextT1.withOpacity(0.5),
                            fontFamily: "IranSANS"),textDirection: TextDirection.rtl,
                      ),
                      Text(
                        "توضیحات : ",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: ColorsApp.colorTextT1.withOpacity(0.5),
                            fontFamily: "IranSANS"),textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                ),


                Column(
                  children: widget.questionGroup!.map((e) => Column(
                    children: e.questions!.map((f) => Card(
                      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      color:   ColorsApp.white,
                      elevation: 3,
                      surfaceTintColor: Colors.grey,
                      shadowColor:Colors.grey ,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      semanticContainer: true,
                      clipBehavior: Clip.hardEdge,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Wrap(
                                alignment: WrapAlignment.start,
                                textDirection: TextDirection.ltr,
                                children: [
                                  Text(
                                    f?.question??"",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: ColorsApp.colorTextT1.withOpacity(0.6),
                                        fontFamily: "yekan"),textDirection: TextDirection.rtl,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: AnswerComponents(value: f.items, id: f.id,),
                            ),


                          ],
                        ),
                      ),
                    )).toList(),
                  )).toList(),
                ),
                isError?  const Text(
                  "لطفا تست ها را کامل انجام دهید",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: ColorsApp.red,
                      fontFamily: "IranSANS"),
                ) :const SizedBox(),
                widget.questionGroup!.isNotEmpty?  Padding(
                  padding:  const EdgeInsets.only(top: 10,left: 30,right: 30,bottom: 10),
                  child: Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all( Size(SizeConfig.screenHeight/1.5, 35)),
                          foregroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
                          backgroundColor: MaterialStateProperty.all<Color>( ColorsApp.primary),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(color:ColorsApp.primary)
                              )
                          )
                      ),

                      onPressed: () {
                        setState(() {
                          isError=false;
                        });
                        print("add");
                        if(plannerController.answerModel.isNotEmpty){
                          plannerController.plannerItemPartTestResult(context,plannerController.answerModel,widget.id);
                        }else{

                          setState(() {
                            isError=true;
                          });
                        }

                      },

                      child: const Text(
                        "ارسال",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.normal,fontFamily: "IranSANS",
                            color: ColorsApp.white),
                        textAlign: TextAlign.center,
                      ),),
                  ),
                ) :SizedBox() ,


              ],
            ),
          ),
        ));
  }

}