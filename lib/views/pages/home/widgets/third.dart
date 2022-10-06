// import 'dart:ui';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:get/get.dart';
// import 'package:agora_rtc_engine/rtc_engine.dart';
// import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
// import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
// import 'package:online_academy/Utils/constants.dart';
// import 'package:permission_handler/permission_handler.dart';

// class CallScreen extends StatefulWidget {
//   final String userID;

//   final channelId;
//   final bool isVideoCall;

//   CallScreen({required this.userID, this.channelId, this.isVideoCall = true});

//   @override
//   _CallScreenState createState() => _CallScreenState();
// }

// class _CallScreenState extends State<CallScreen> {
//   int _selectedItem = -1;
//   String token =
//       '006342eddd7c6a44b3fb800579777f3ccb4IACfh9Au8Dh+z4QsgBbNFtXbT7VkfjDeKh48dvz9jsZ0mUOQEggAAAAAEABgTjz66c4pYgEAAQDozili';
//   // final CallMethods callMethods = CallMethods();
//   List<int> _remoteUid = [];
//   late RtcEngine _engine;

//   @override
//   void initState() {
//     // Screen.keepOn(true);
//     super.initState();
//     print("type is:${widget.isVideoCall}");
//     initAgora();
//   }

//   Future<void> initAgora() async {
//     // retrieve permissions
//     await [Permission.microphone, Permission.camera].request();

//     //create the engine
//     _engine = await RtcEngine.create(appID);
//     // _engine = await RtcEngine.create("342eddd7c6a44b3fb800579777f3ccb4");
//     if (widget.isVideoCall) {
//       await _engine.enableVideo();
//     } else {
//       await _engine.enableAudio();
//     }

//     _engine.setEventHandler(
//       RtcEngineEventHandler(
//         joinChannelSuccess: (String channel, int uid, int elapsed) {
//           print("local user $uid joined");
//         },
//         userJoined: (int uid, int elapsed) {
//           print("remote user $uid joined");
//           setState(() {
//             // _remoteUid = uid;
//             _remoteUid.add(uid);
//           });
//         },
//         userOffline: (int uid, UserOfflineReason reason) {
//           print("remote user $uid left channel");
//           setState(() {
//             // _remoteUid = null;
//             _remoteUid.remove(uid);
//           });
//         },
//       ),
//     );

//     await _engine.joinChannel(null, widget.channelId, null, 0);
//     // await _engine.joinChannel(token,'myChannel', null, 0);
//   }

//   bool swap = false;

//   // Create UI with local view and remote view
//   @override
//   void dispose() {
//     super.dispose();
//     _engine.leaveChannel();
//     _engine.destroy();
//     // callStreamSubscription.cancel();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {
//               if (_selectedItem == -1) {
//                 Get.back();
//               } else {
//                 setState(() {
//                   _selectedItem = -1;
//                 });
//               }
//             },
//             icon: Icon(Icons.arrow_back)),
//         title: const Text('Meeting'),
//       ),
//       body: Stack(
//         children: [
//           Container(
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               child: _remoteUid.length == 0
//                   ? RtcLocalView.SurfaceView()
//                   : swap
//                       ? RtcLocalView.SurfaceView()
//                       : _remoteUid.length == 1
//                           ? _remoteVideo(_remoteUid[0])
//                           : _selectedItem == -1
//                               ? GridView.builder(
//                                   gridDelegate:
//                                       SliverGridDelegateWithFixedCrossAxisCount(
//                                           crossAxisCount: 2,
//                                           crossAxisSpacing: 5,
//                                           mainAxisSpacing: 5),
//                                   itemCount: _remoteUid.length,
//                                   itemBuilder: (_, index) {
//                                     return GestureDetector(
//                                         onTap: () {
//                                           setState(() {
//                                             _selectedItem = _remoteUid[index];
//                                           });
//                                         },
//                                         child: _remoteVideo(_remoteUid[index]));
//                                   })
//                               : _remoteVideo(_selectedItem)),
//           _remoteUid.length == 0
//               ? Container()
//               : Align(
//                   alignment: Alignment.topLeft,
//                   child: GestureDetector(
//                     onTap: () {
//                       print("ids length is:${_remoteUid.length}");
//                       if (_remoteUid.length == 1) {
//                         setState(() {
//                           swap = !swap;
//                         });
//                       }

//                       // swapWidget = RtcLocalView.SurfaceView();
//                       // RtcLocalView.SurfaceView()=_remoteUid[0];
//                       // _remoteVideo(_remoteUid[index])=swapWidget;
//                     },
//                     child: Container(
//                       width: 100,
//                       height: 100,
//                       child: Center(
//                         child: swap
//                             ? _remoteVideo(_remoteUid[0])
//                             : RtcLocalView.SurfaceView(),
//                       ),
//                     ),
//                   ),
//                 ),
//           _toolbar(),
//         ],
//       ),
//     );
//   }

//   // Display remote user's video
//   Widget _remoteVideo(int uid) {
//     print("remote uid is:${_remoteUid}");
//     if (_remoteUid != null) {
//       return RtcRemoteView.SurfaceView(
//         uid: uid,
//         channelId: widget.channelId,
//       );
//     } else {
//       return Text(
//         'Please wait for remote user to join',
//         textAlign: TextAlign.center,
//       );
//     }
//   }

//   //StreamSubscription callStreamSubscription;

//   bool muted = false;

//   //
//   addPostFrameCallback() {
//     SchedulerBinding.instance.addPostFrameCallback((_) {
//       // userProvider = Provider.of<UserProvider>(context, listen: false);

//       // callStreamSubscription = callMethods
//       //     .callStream(uid: widget.userID)
//       //     .listen((DocumentSnapshot ds) {
//       //   // defining the logic
//       //   switch (ds.data) {
//       //     case null:
//       //       // snapshot is null which means that call is hanged and documents are deleted
//       //       Navigator.pop(context);
//       //       break;

//       //     default:
//       //       break;
//       //   }
//       // });
//     });
//   }

//   void _onToggleMute() {
//     setState(() {
//       muted = !muted;
//     });
//     _engine.muteLocalAudioStream(muted);
//   }

//   void _onSwitchCamera() {
//     _engine.switchCamera();
//   }

//   //
//   // /// Toolbar layout
//   Widget _toolbar() {
//     return Container(
//         alignment: Alignment.bottomCenter,
//         padding: const EdgeInsets.symmetric(vertical: 48),
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
//           child: Container(
//             // margin: EdgeInsets.symmetric(
//             //   horizontal: Get.width * 0.01,
//             // ),
//             padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
//             height: Get.height * 0.1,
//             // width: Get.width * 0.7,
//             decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(.3),
//                 border: Border.all(color: Colors.white),
//                 borderRadius: BorderRadius.circular(12)),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 CircularWidget(
//                   onTap: _onSwitchCamera,
//                   child: Image.asset(
//                     'assets/callingicons/flipcamera.png',
//                     scale: 1.8,
//                     // height: Get.height * 0.01,
//                   ),
//                 ),
//                 // SizedBox(width: 10),
//                 // CircularWidget(
//                 //   onTap: () {},
//                 //   child: Image.asset(
//                 //     'assets/callingicons/videochat.png',
//                 //     scale: Responsive.isTablet(context) ? 1.3 : 1.8,
//                 //     // height: Get.height * 0.01,
//                 //   ),
//                 // ),
//                 // SizedBox(width: 10),
//                 CircularWidget(
//                     onTap: () {
//                       // Get.back();
//                       Navigator.pop(context);
//                     },
//                     child: Icon(
//                       Icons.call_end,
//                       color: Colors.red,
//                       size: 35.0,
//                     )
//                     // Image.asset(
//                     //   'assets/callingicons/declinecall.png',
//                     //   scale: Responsive.isTablet(context) ? 1.3 : 1.8,
//                     //   // height: Get.height * 0.01,
//                     // ),
//                     ),
//                 // SizedBox(width: 10),
//                 CircularWidget(
//                     onTap: _onToggleMute,
//                     child: Icon(
//                       muted ? Icons.mic_off : Icons.mic,
//                       color: Colors.blue,
//                       size: 30.0,
//                     )
//                     // Image.asset(
//                     //   'assets/callingicons/mutecall.png',
//                     //   scale: Responsive.isTablet(context) ? 1.3 : 1.8,
//                     //   // height: Get.height * 0.01,
//                     // ),
//                     ),
//                 // SizedBox(width: 10),
//                 CircularWidget(
//                   onTap: () {
//                     // _engine.enableSoundPositionIndication(true);
//                     // _engine.
//                   },
//                   child: Image.asset(
//                     'assets/callingicons/volume.png',
//                     scale: 1.8,
//                     // height: Get.height * 0.01,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }

// class CircularWidget extends StatelessWidget {
//   const CircularWidget({
//     Key? key,
//     required this.onTap,
//     required this.child,
//   }) : super(key: key);
//   final Widget child;
//   final VoidCallback onTap;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//           height: Get.height * 0.07,
//           width: Get.width * 0.1,
//           decoration:
//               BoxDecoration(shape: BoxShape.circle, color: Colors.white),
//           child: child),
//     );
//   }
// }
