import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget{
  MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20) ,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                ),
              ),
            child: Row(children: [
              Icon(Icons.fastfood, size: 48, color: Theme.of(context).colorScheme.onPrimary),
              SizedBox(width: 20,),
              Text('Cooking Up!', style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary,
              ),),
            ],),
          )
        ],
      ),
    );
  }

}