# Car Details
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![Contributors](https://img.shields.io/badge/contributors-2-orange.svg?style=flat)](#contributors-)
![License](https://img.shields.io/github/license/ahm3di/car_details_app.svg)
![Last Commit](https://img.shields.io/github/last-commit/ahm3di/car_details_app)

<!-- ALL-CONTRIBUTORS-BADGE:END -->
Flutter app which allows users to store and retrieve important vehicle information
by entering the number plate. This group project was created in fulfilment of 
the Mobile App Development module.

## Screenshots
<img src="https://user-images.githubusercontent.com/45081478/132925438-f7294792-c754-4c21-96e3-246b474d047f.jpg" width="32%">
<img src="https://user-images.githubusercontent.com/45081478/132925884-3b6a2279-b51d-4f94-95d3-d22821c5f267.jpg" width="32%">
<img src="https://user-images.githubusercontent.com/45081478/132925929-d023b3ee-ede8-4ede-ba9d-4a8d1aea37c6.jpg" width="32%">
<img src="https://user-images.githubusercontent.com/45081478/132926039-65454c0e-8472-4bea-8c96-b16b298c1dc2.jpg" width="32%">
<img src="https://user-images.githubusercontent.com/45081478/132926061-859ee1b6-27cc-49f4-8e44-42c4fa769473.jpg" width="32%">
<img src="https://user-images.githubusercontent.com/45081478/132926087-3e8b030d-f764-4821-9ea1-fe75e4f14556.jpg" width="32%">

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
<br> `NOTE: To connect to your own Firestore database, create a project and replace
'google-services.json' in 'android -> app -> src'`
- Display nearby vehicle service locations using [Places API](https://developers.google.com/maps/documentation/places/web-service/overview) 
<br> `NOTE: The API key is limited for demonstration purposes, to use your own
key replace 'placesAPIkey' in 'services.dart'`
## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/talia123"><img src="https://avatars.githubusercontent.com/u/36270763?v=4?s=100" width="100px;" alt=""/><br /><sub><b>talia123</b></sub></a><br /><a href="#ideas-talia123" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/ahm3di/car_details_app/commits?author=talia123" title="Code">💻</a> <a href="#design-talia123" title="Design">🎨</a> <a href="#userTesting-talia123" title="User Testing">📓</a> <a href="https://github.com/ahm3di/car_details_app/commits?author=talia123" title="Documentation">📖</a></td>
    <td align="center"><a href="http://chriscatt.com"><img src="https://avatars.githubusercontent.com/u/47675714?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Chris Catt</b></sub></a><br /><a href="#ideas-christophercatt" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/ahm3di/car_details_app/commits?author=christophercatt" title="Code">💻</a> <a href="#design-christophercatt" title="Design">🎨</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!