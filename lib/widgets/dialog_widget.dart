//
// import 'package:LW/widget/custom_image_view.dart';
// import 'package:LW/widget/theme/theme_helper.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../core/utils/size_utils.dart';
// import '../theme/app_style.dart';
// import 'custom_button.dart';
//
// class DialogWidget {
//   DialogWidget._();
//
//   static final DialogWidget _instance = DialogWidget._();
//
//   static DialogWidget get instance => _instance;
//
//
//
//
//   void optionUpdateAvatar(BuildContext context, {Function? functionCamera,Function? functionAlbum}) {
//     showGeneralDialog(
//       context: context,
//       barrierLabel: "optionUpdateAvatar",
//       barrierDismissible: true,
//       barrierColor: Colors.black.withOpacity(0.5),
//       transitionDuration: const Duration(milliseconds: 300),
//       pageBuilder: (_, __, ___) {
//         return Center(
//           child: Container(
//             margin: const EdgeInsets.symmetric(horizontal: 20),
//             decoration: BoxDecoration(
//               border: Border.all(
//                   width: getSize(2),
//                 color: appTheme.F2C94C
//               ),
//               color: Colors.black,
//               borderRadius: BorderRadius.all(
//                   Radius.circular(getSize(20)) //                 <--- border radius here
//               ),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Container(
//                   margin: getMargin(all: 5
//                   ),
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: getVerticalSize(10),
//                       ),
//                       Text(
//                         "UPDATE AVATAR",
//                         style: TextStyle(
//                             fontSize: getSize(20), fontWeight: FontWeight.w700,color: appTheme.F2C94C),
//                       ),
//                       SizedBox(
//                         height: getVerticalSize(20),
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Column(
//                               children: [
//                                 InkWell(
//                                     onTap:(){
//                                       if(functionCamera !=null){
//                                         functionCamera!();
//                                       }
//                                     },
//                                     child: Icon(Icons.camera_alt_outlined,size: getSize(45),color: appTheme.F2C94C,)),
//                                   Text("Camera",style: TextStyle(fontWeight: FontWeight.w500,color: appTheme.F2C94C),)
//                               ],
//                             ),
//                           ),
//                           Expanded(
//                             child: Column(
//                               children: [
//                                 InkWell(
//                                     onTap:(){
//                                       if(functionAlbum !=null){
//                                         functionAlbum!();
//                                       }
//                                     },child: Icon(Icons.image_outlined,size: getSize(45),color: appTheme.F2C94C,)),
//                                   Text("Album",style: TextStyle(fontWeight: FontWeight.w500,color: appTheme.F2C94C),)
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: getVerticalSize(20),),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: double.maxFinite,
//                   height: getVerticalSize(0.5),
//                   color: Colors.black12,
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//       transitionBuilder: (_, anim, __, child) {
//         Tween<Offset> tween;
//         if (anim.status == AnimationStatus.reverse) {
//           tween = Tween(begin: Offset(-1, 2), end: Offset.zero);
//         } else {
//           tween = Tween(begin: Offset(1, 2), end: Offset.zero);
//         }
//
//         return SlideTransition(
//           position: tween.animate(anim),
//           child: FadeTransition(
//             opacity: anim,
//             child: child,
//           ),
//         );
//       },
//     );
//   }
//   // Navigator.of(context, rootNavigator: true).pop(true),
//   void showComingSoon(BuildContext context ){
//     showGeneralDialog(
//       context: context,
//       barrierLabel: "showComingSoon",
//       barrierDismissible: true,
//       barrierColor: Colors.black.withOpacity(0.5),
//       transitionDuration: const Duration(milliseconds: 300),
//       pageBuilder: (_, __, ___) {
//         return Center(
//           child: Container(
//             width: double.maxFinite,
//             margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
//             decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.white,
//                   width: 1.0,
//                 ),
//                 color: Colors.black, borderRadius: BorderRadius.circular(20)),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SizedBox(height: getVerticalSize(24),),
//                     CustomImageView(
//                       height: getSize(50),
//                       svgPath: 'assets/images/img_warning.svg',
//                     ),
//                 Text("Function coming soon",style:  AppStyle.NotoSansBold16_E8B447.copyWith(fontSize: getSize(22)),),
//                 InkWell(
//                   onTap: (){
//                     Navigator.of(context, rootNavigator: true).pop(true);
//                   },
//                   child: Container(
//                       margin: getMargin(left: 24,bottom: 24,right: 24,top: 12),
//                       child: CustomButton.instance.buttonLogin("Close")),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//       transitionBuilder: (_, anim, __, child) {
//         Tween<Offset> tween;
//         if (anim.status == AnimationStatus.reverse) {
//           tween = Tween(begin: Offset(-1, 2), end: Offset.zero);
//         } else {
//           tween = Tween(begin: Offset(1, 2), end: Offset.zero);
//         }
//
//         return SlideTransition(
//           position: tween.animate(anim),
//           child: FadeTransition(
//             opacity: anim,
//             child: child,
//           ),
//         );
//       },
//     );
//   }
//   void showPermissionApp(BuildContext context ){
//     showGeneralDialog(
//       context: context,
//       barrierLabel: "Access permission has expired",
//       barrierDismissible: false,
//       barrierColor: Colors.black.withOpacity(0.5),
//       transitionDuration: const Duration(milliseconds: 300),
//       pageBuilder: (_, __, ___) {
//         return Center(
//           child: Container(
//             width: double.maxFinite,
//             margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
//             decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.white,
//                   width: 1.0,
//                 ),
//                 color: Colors.black, borderRadius: BorderRadius.circular(20)),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SizedBox(height: getVerticalSize(24),),
//                     CustomImageView(
//                       height: getSize(50),
//                       svgPath: 'assets/images/img_warning.svg',
//                     ),
//                 Text("Access permission has expired",style:  AppStyle.NotoSansBold16_E8B447.copyWith(fontSize: getSize(22)),),
//                 InkWell(
//                   onTap: (){
//                     Navigator.of(context, rootNavigator: true).pop(true);
//                   },
//                   child: Container(
//                       margin: getMargin(left: 24,bottom: 24,right: 24,top: 12),
//                       child: CustomButton.instance.buttonLogin("Close")),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//       transitionBuilder: (_, anim, __, child) {
//         Tween<Offset> tween;
//         if (anim.status == AnimationStatus.reverse) {
//           tween = Tween(begin: Offset(-1, 2), end: Offset.zero);
//         } else {
//           tween = Tween(begin: Offset(1, 2), end: Offset.zero);
//         }
//
//         return SlideTransition(
//           position: tween.animate(anim),
//           child: FadeTransition(
//             opacity: anim,
//             child: child,
//           ),
//         );
//       },
//     );
//   }
//   void showNotSupportCurrency(BuildContext context ){
//     showGeneralDialog(
//       context: context,
//       barrierLabel: "Currency is not supported",
//       barrierDismissible: false,
//       barrierColor: Colors.black.withOpacity(0.5),
//       transitionDuration: const Duration(milliseconds: 300),
//       pageBuilder: (_, __, ___) {
//         return Center(
//           child: Container(
//             width: double.maxFinite,
//             margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
//             decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.white,
//                   width: 1.0,
//                 ),
//                 color: Colors.black, borderRadius: BorderRadius.circular(20)),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SizedBox(height: getVerticalSize(24),),
//                     CustomImageView(
//                       height: getSize(50),
//                       svgPath: 'assets/images/img_warning.svg',
//                     ),
//                 Text("Currency is not supported",style:  AppStyle.NotoSansBold16_E8B447.copyWith(fontSize: getSize(22)),),
//                 InkWell(
//                   onTap: (){
//                     Navigator.of(context, rootNavigator: true).pop(true);
//                   },
//                   child: Container(
//                       margin: getMargin(left: 24,bottom: 24,right: 24,top: 12),
//                       child: CustomButton.instance.buttonLogin("Close")),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//       transitionBuilder: (_, anim, __, child) {
//         Tween<Offset> tween;
//         if (anim.status == AnimationStatus.reverse) {
//           tween = Tween(begin: Offset(-1, 2), end: Offset.zero);
//         } else {
//           tween = Tween(begin: Offset(1, 2), end: Offset.zero);
//         }
//
//         return SlideTransition(
//           position: tween.animate(anim),
//           child: FadeTransition(
//             opacity: anim,
//             child: child,
//           ),
//         );
//       },
//     );
//   }
// }
