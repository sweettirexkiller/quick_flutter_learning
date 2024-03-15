import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/place.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    this.location = PlaceLocation(
        latitude: 37.422,
        longitude: -122.084,
        address: 'Googleplex'
    ),
  });
  final PlaceLocation location;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Map'),
      ),
      body: Center(
        child: Text('Map!'),
      ),
    );
  }
}