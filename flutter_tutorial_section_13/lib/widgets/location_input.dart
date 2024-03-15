import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial_section_13/model/place.dart';
import 'package:flutter_tutorial_section_13/widgets/places_list.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, required this.onSelectLocation});
  final void Function(PlaceLocation location) onSelectLocation;
  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  PlaceLocation? _pickedLocation;
  var _isGettingLocation = false;

  String get locationImage {
    final lat = _pickedLocation?.latitude ?? 37.422;
    final lng = _pickedLocation?.longitude ?? -122.084;
    return "https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=13&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C$lat,$lng&key=AIzaSyAFSTRooipQaDvZN43jDESfR1Mu99reg8M";
  }

  void _getCurrentLocation() async {
    Location location = new Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      _isGettingLocation = true;
    });

    locationData = await location.getLocation();

    if (locationData.latitude == null || locationData.longitude == null) {
      setState(() {
        _isGettingLocation = false;
      });
      return;
    }

    final url = Uri.parse('https://maps.googleapis.com/maps/api/geocode/json?latlng=${locationData.latitude},${locationData.longitude}&key=AIzaSyAFSTRooipQaDvZN43jDESfR1Mu99reg8M');
    final res = await http.get(url);
    final address = json.decode(res.body)['results'][0]['formatted_address'];

    setState(() {
      _pickedLocation = PlaceLocation(
        latitude: locationData.latitude!,
        longitude: locationData.longitude!,
        address: address,
      );
      _isGettingLocation = false;
    });



  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = Center(
      child: Text('No Location Chosen',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),),
    );


    if(_isGettingLocation){
      previewContent = const Center(child: CircularProgressIndicator(),);
    }

    if(_pickedLocation != null){
      previewContent = Image.network(locationImage, fit: BoxFit.cover, width: double.infinity,height: double.infinity);
    }


    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 170,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Theme.of(context).colorScheme.primary.withOpacity(0.2)),
          ),
          child: previewContent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(icon: const Icon(Icons.location_on), label: const Text('Get Current Location'),onPressed: _getCurrentLocation),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.map),
              label: const Text('Select on map'),
            ),
          ],
        ),
      ],
    );
  }
}

