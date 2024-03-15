import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial_section_13/model/place.dart';
import 'package:flutter_tutorial_section_13/screens/map.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({super.key, required this.place});

  String get locationImage {
    final lat = place.location.latitude ?? 37.422;
    final lng = place.location.longitude ?? -122.084;
    return "https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=13&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C$lat,$lng&key=AIzaSyAFSTRooipQaDvZN43jDESfR1Mu99reg8M";
  }

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
            bottom: 0,
            right: 0,
            left:0,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => MapScreen(location: place.location, isSelecting: false))
                    );
                  },
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(locationImage),
                    radius: 70,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  place.location.address,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ]
            ),
          ),
        ],
      )
    );
  }
}