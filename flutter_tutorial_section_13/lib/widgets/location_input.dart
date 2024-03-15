import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 170,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Theme.of(context).colorScheme.primary.withOpacity(0.2)),
          ),
          child: Center(
            child: Text('No Location Chosen',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(icon: const Icon(Icons.location_on), label: const Text('Choose Location'),onPressed:  () {}),
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

