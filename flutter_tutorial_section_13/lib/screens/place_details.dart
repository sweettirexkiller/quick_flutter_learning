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
      body:  Stack(
        children: [
          Image.file(
            place.image,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 20,
            right: 10,
            child: Container(
              color: Colors.black54,
              padding: const EdgeInsets.all(10),
              child: Text(
                place.title,
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}