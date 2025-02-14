import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:shecodes/components/button.dart';
import 'package:shecodes/theme/colors.dart';

class StoreDetailsPage extends StatefulWidget {
  final String storeName;
  final String location;
  final String phoneNumber;

  StoreDetailsPage({
    required this.storeName,
    required this.location,
    required this.phoneNumber,
  });

  @override
  _StoreDetailsPageState createState() => _StoreDetailsPageState();
}

class _StoreDetailsPageState extends State<StoreDetailsPage> {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  XFile? _image;
  bool _isCameraReady = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras != null && _cameras!.isNotEmpty) {
        _cameraController = CameraController(
          _cameras![0],
          ResolutionPreset.medium,
        );
        await _cameraController!.initialize();
        if (mounted) {
          setState(() {
            _isCameraReady = true;
          });
        }
      } else {
        print("No cameras available.");
      }
    } catch (e) {
      print("Error initializing camera: $e");
    }
  }

  Future<void> _takePicture() async {
    if (_cameraController != null && _cameraController!.value.isInitialized) {
      try {
        final image = await _cameraController!.takePicture();
        setState(() {
          _image = image;
        });
      } catch (e) {
        print("Error capturing image: $e");
      }
    } else {
      print("Camera not ready.");
    }
  }

  // @override
  // void dispose() {
  //   _cameraController?.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Store Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.storeName,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        Icon(Icons.access_time),
                        SizedBox(width: 8),
                        Text("11:00 - 12:30"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.location_on),
                        const SizedBox(width: 8),
                        Text(widget.location),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.phone),
                        const SizedBox(width: 8),
                        Text(widget.phoneNumber),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isCameraReady ? _takePicture : null,
              style:
                  ElevatedButton.styleFrom(backgroundColor: AppColors.yellow),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt, color: Colors.black),
                  SizedBox(width: 8),
                  Text("Take A Picture",
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Center(
                child: _image == null
                    ? (_cameraController != null &&
                            _cameraController!.value.isInitialized)
                        ? CameraPreview(_cameraController!)
                        : const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.image, size: 100, color: Colors.grey),
                              SizedBox(height: 10),
                              Text("No Images Yet",
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          )
                    : Image.file(File(_image!.path)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                //BACKEND COMES HERE
              },
              style:
                  ElevatedButton.styleFrom(backgroundColor: AppColors.yellow),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Confirm",
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
