import 'package:flutter/material.dart';
import 'package:pixabay/utils/utils.dart';

class PreviewScreen extends StatefulWidget {
  final String image;
  const PreviewScreen({super.key, required this.image});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Image preview",style:TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Image.network(widget.image, height: sH(context),width: sW(context),
      loadingBuilder: (context, child,ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null)return child;
          return const Center(child: Icon(Icons.image_rounded,color: Colors.black26,));
        },
      fit: BoxFit.cover,
      ),
    );
  }
}