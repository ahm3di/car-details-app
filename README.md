# Car Details
Flutter app which allows users to retrieve and store important information about
a vehicle by entering the number plate. This group project was created in fulfilment of the following module: CN6211 - 
Mobile App Development.

## Setup
- Install [Flutter](https://flutter.dev/docs/get-started/install)
- Download or clone this repository
- Connect device or emulator to IDE
- Switch working directory to `car_details_app` and run:
    - `flutter pub get`
    - `flutter run`

## Features
- User authentication using [Firebase](https://firebase.google.com/docs/flutter/setup?platform=android)
- Retrieve vehicle information using 
[DVLASearch](http://api.vehicle-search.co.uk/#/Search/Licence_Plate) API <br>
`NOTE: The API trial only supports number plates beginning with MT09 and FH51`
- Data storage using [Firestore](https://firebase.flutter.dev/docs/firestore/usage/) database
- Display nearby service locations using [Places API](https://developers.google.com/maps/documentation/places/web-service/overview) 
<br> `NOTE: The API key is limited for demonstration purposes, to use your own
key replace 'placesAPIkey' in 'services.dart'`