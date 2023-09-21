import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:vr_zoo/provider/item_provider.dart';
class ItemDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemIndex = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(title: Text('Item Details'), backgroundColor: Colors.black,),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: ModelViewer(
              backgroundColor: Colors.white,
              src: items[itemIndex].modelUrl,
              alt: 'A 3D model',
              cameraControls: true,
              ar: true,
              autoRotate: true,
              // iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
              disableZoom: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Center(
                    child: Text('Details of ${items[itemIndex].title}', style: TextStyle(color: Colors.white),)
                ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${items[itemIndex].description}", style: TextStyle(color: Colors.white),),
              ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}