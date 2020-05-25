import 'package:car_details_app/models/car_model.dart';
import 'package:flutter/material.dart';

import 'database.dart';
import 'firebase_auth.dart';

class FavIcon extends StatefulWidget {
  final int currentIndex;
  final Function() notifyParent;

  FavIcon({this.currentIndex, this.notifyParent});

  @override
  _FavIconState createState() => _FavIconState(currentIndex, notifyParent);
}

class _FavIconState extends State<FavIcon> {
  int currentIndex;
  Function() notifyParent;

  _FavIconState(this.currentIndex, this.notifyParent);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: getIcon(currentIndex),
      iconSize: 35.0,
      color: Colors.blueGrey[200],
      onPressed: () {
        setState(() {
          if (cars[currentIndex].isFavourite) {
            cars[currentIndex].setFavourite(false);
            cars.sort((a, b) => a.compareTo(b));
            widget.notifyParent();
            DatabaseService(uid: AuthProvider.userID).updateFavourite(cars[currentIndex].numberplate,false);

          } else {
            cars[currentIndex].setFavourite(true);
            cars.sort((a, b) => a.compareTo(b));
            widget.notifyParent();
            DatabaseService(uid: AuthProvider.userID).updateFavourite(cars[currentIndex].numberplate,true);
          }
        });
      },
    );
  }

  Icon getIcon(int currentIndex) {
    if (cars[currentIndex].isFavourite) {
      return Icon(Icons.favorite);
    } else {
      return Icon(Icons.favorite_border);
    }
  }
}
