import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'display_picture_screen.dart';
//import 'googleapi.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized so that availableCameras()
  // can be called before runApp()
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  //final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.


}

class camera extends StatefulWidget {
  const camera({Key? key}) : super(key: key);

  @override
  State<camera> createState() => _accountState();
}

class _accountState extends State<camera> {
  @override
  int sum = 0;
  bool _buttonDisabled = false;



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          SizedBox(
            width: 100,
            height: 100,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
              child:
              IconButton(onPressed: null, icon: Icon(Icons.account_circle)),
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: SizedBox(
                  width: 400,
                  height: 50,
                  child:
                  FilledButton(onPressed: () async {
                    final cameras = await availableCameras();
                    final firstCamera = cameras.first;

                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                        TakePictureScreen(
                          // Pass the appropriate camera to the TakePictureScreen widget.
                          camera: firstCamera,
                        ),
                    ));
                  }, child: Text('Scan The Waste')),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Take a picture')),
        // You must wait until the controller is initialized before displaying the
        // camera preview. Use a FutureBuilder to display a loading spinner until the
        // controller has finished initializing.
        body: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // If the Future is complete, display the preview.
              return CameraPreview(_controller);
            } else {
              // Otherwise, display a loading indicator.
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          // Provide an onPressed callback.
          onPressed: () async {
            // Take the Picture in a try / catch block. If anything goes wrong,
            // catch the error.
            try {
              await _initializeControllerFuture;
              final image = await _controller.takePicture();
              if (!context.mounted) return;
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DisplayPictureScreen(imagePath: image.path),
                ),
              );
            } catch (e) {
              print(e);
            }
          },
          child: const Icon(Icons.camera_alt),
        ));
  }
}