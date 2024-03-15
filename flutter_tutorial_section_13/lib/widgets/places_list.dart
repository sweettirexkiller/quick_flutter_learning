import 'package:flutter/material.dart';
import 'package:flutter_tutorial_section_13/model/place.dart';
import 'package:flutter_tutorial_section_13/screens/place_details.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if(places.isEmpty) {
      return Center(child: Text(
        'No places added yet', 
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground
        ),)
      );
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (ctx, i) => ListTile(
        leading: CircleAvatar(
          backgroundImage: FileImage(places[i].image),
        ),
        title: Text(places[i].title, style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground
          ),
        ),
        onTap: () {
           Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => PlaceDetaileScreen(place: places[i]))
          );
        }
      ),
    );
  }
}