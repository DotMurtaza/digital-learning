// import 'package:flutter/material.dart';
// // import 'package:agora_rtc_engine/rtc_engine.dart';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:online_academy/Utils/constants.dart';
// // import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
// // import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

// class CallPage extends StatefulWidget {
//   const CallPage({Key? key}) : super(key: key);

//   @override
//   State<CallPage> createState() => _CallPageState();
// }

// class _CallPageState extends State<CallPage> {
//   static final _users = <int>[];
//   final _infoStrings = <String>[];
//   bool muted = false;
//   RtcEngine? _engine;

//   @override
//   void dispose() {
//     // clear users
//     _users.clear();
//     // destroy sdk
//     _engine!.leaveChannel();
//     //_engine!.destroy();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     super.initState();
//     // initialize agora sdk
//     initialize();
//   }

//   Future<void> initialize() async {
//     if (appID.isEmpty) {
//       setState(() {
//         _infoStrings.add(
//           'APP_ID missing, please provide your APP_ID in settings.dart',
//         );
//         _infoStrings.add('Agora Engine is not starting');
//       });
//       return;
//     }
//     await _initAgoraRtcEngine();
//     _addAgoraEventHandlers();
//     await _engine!.joinChannel( channelId: '', options:ChannelMediaOptions () , token: "", uid:0 );
//   }
//   Future<void> _initAgoraRtcEngine() async {
//     _engine =  _engine.initialize(const RtcEngineContext(
//       appId: appId,
//       channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
//     ));
//     await _engine.enableVideo();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }
