import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../model/place.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    this.location = const PlaceLocation(
        latitude: 37.422,
        longitude: -122.084,
        address: 'Googleplex'
    ),
    this.isSelecting = true,
  });
  final PlaceLocation location;
  final bool isSelecting;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  LatLng? _pickedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.isSelecting
            ? const Text('Pick your location')
            : const Text('Your Location'),
        actions: [
          if(widget.isSelecting)
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                if(_pickedLocation == null) {
                  return;
                }
                Navigator.of(context).pop(_pickedLocation);
              },
            )
        ]
      ),
      body: GoogleMap(
        onTap: (position){

          if(!widget.isSelecting) {
            return;
          }

          setState(() {
            _pickedLocation = position;
          });

          Navigator.of(context).pop(_pickedLocation);

        },
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.location.latitude, widget.location.longitude),
          zoom: 16,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('m1'),
            position: _pickedLocation ?? LatLng(widget.location.latitude, widget.location.longitude),
          )
        },
      ),
    );
  }
}