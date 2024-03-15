import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial_section_13/model/place.dart';
import 'package:flutter_tutorial_section_13/providers/user_provider.dart';
import 'package:flutter_tutorial_section_13/widgets/image_input.dart';
import 'package:flutter_tutorial_section_13/widgets/location_input.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _pickedImage;
  PlaceLocation? _pickedLocation;

  void _onSelectImage(File image ) {
    _pickedImage = image;
  }

  void _onSelectLocation(PlaceLocation location){
    _pickedLocation = location;
  }

  void _savePlace() {
    if(_titleController.text.trim().isEmpty || _titleController.text.length < 3 || _titleController.text.length > 20 || _pickedImage == null){
      return;
    }
    print('Adding place');
    print("picked locatrio: $_pickedLocation");

    ref.read(userPlacesProvider.notifier).addPlace(_titleController.text, _pickedImage!,_pickedLocation!);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a New Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: _titleController,
              style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
            ),
            // image input
            const SizedBox(height: 10),
            ImageInput(onSelectImage: _onSelectImage,),
            const SizedBox(height: 16),
            LocationInput(onSelectLocation: _onSelectLocation),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _savePlace,
              icon: const Icon(Icons.add),
              label: const Text('Add Place'),
            ),
          ],
        ),
      ),
    );
  }


}