import 'package:flutter/material.dart';
import 'package:flutter_tutorial_section_13/model/place.dart';

class PlaceDetaileScreen extends StatelessWidget {
  const PlaceDetaileScreen({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body:  Center(
        child: Text(
          'Place Details...',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground
            ),
        ),
      ),
    );
  }
}