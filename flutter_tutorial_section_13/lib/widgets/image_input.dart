import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onSelectImage});

  final void Function(File image) onSelectImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState  extends State<ImageInput> {
  File? _storedImage;

  void _takePicture() async { 
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600, maxHeight: 600, imageQuality: 50);


    if(pickedImage == null){
      return;
    }

    setState(() {
      _storedImage = File(pickedImage.path);
    });

    widget.onSelectImage(_storedImage!);
  }


  @override
  Widget build(BuildContext context) {

    Widget content = TextButton.icon(
          onPressed: _takePicture,
          icon:const Icon(Icons.camera), 
          label: const Text('Take Picture'),
        );

    if(_storedImage != null){
      content = GestureDetector(
        onTap: _takePicture,
        child: Image.file(
          _storedImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }

    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1, 
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2)
          )
        ),
        height: 250,
        width: double.infinity,
        alignment: Alignment.center,
        child: content,
      );
  }
}