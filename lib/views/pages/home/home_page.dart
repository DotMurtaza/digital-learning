import 'package:flutter/material.dart';
import 'package:online_academy/views/pages/home/widgets/call_page.dart';
import 'package:online_academy/views/pages/home/widgets/second_vedio.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myController = TextEditingController();
  bool _validateError = false;
  late Permission _permissionHandler;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Agora Group Video Call'),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(top: 100)),
            const Padding(padding: EdgeInsets.only(top: 20)),
            const Text(
              'Agora Group Video Call Demo',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            Container(
              width: 300,
              child: TextFormField(
                controller: myController,
                decoration: InputDecoration(
                  labelText: 'Channel Name',
                  labelStyle: const TextStyle(color: Colors.blue),
                  hintText: 'test',
                  hintStyle: const TextStyle(color: Colors.black45),
                  errorText:
                      _validateError ? 'Channel name is mandatory' : null,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 30)),
            Container(
              width: 90,
              child: MaterialButton(
                onPressed: onJoin,
                height: 40,
                color: Colors.blueAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Join', style: TextStyle(color: Colors.white)),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> onJoin() async {
    // setState(() {
    //   myController.text.isEmpty
    //       ? _validateError = true
    //       : _validateError = false;
    // });
    // await _permissionHandler.isGranted;
    // requestPermissions(
    //     [PermissionGroup.camera, PermissionGroup.microphone]);

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondVedio(),
        ));
  }
}
