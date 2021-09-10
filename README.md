# Car Details
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-3-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->
Flutter app which allows users to store and retrieve important vehicle information
by entering the number plate. This group project was created in fulfilment of the following module: CN6211 - 
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
## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/talia123"><img src="https://avatars.githubusercontent.com/u/36270763?v=4?s=100" width="100px;" alt=""/><br /><sub><b>talia123</b></sub></a><br /><a href="#ideas-talia123" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/ahm3di/car_details_app/commits?author=talia123" title="Code">💻</a> <a href="#design-talia123" title="Design">🎨</a> <a href="#userTesting-talia123" title="User Testing">📓</a> <a href="https://github.com/ahm3di/car_details_app/commits?author=talia123" title="Documentation">📖</a></td>
    <td align="center"><a href="http://chriscatt.com"><img src="https://avatars.githubusercontent.com/u/47675714?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Chris Catt</b></sub></a><br /><a href="#ideas-christophercatt" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/ahm3di/car_details_app/commits?author=christophercatt" title="Code">💻</a> <a href="#design-christophercatt" title="Design">🎨</a></td>
    <td align="center"><a href="https://github.com/keerthy"><img src="https://avatars.githubusercontent.com/u/691581?v=4?s=100" width="100px;" alt=""/><br /><sub><b>keerthy-opt</b></sub></a><br /><a href="#ideas-Keerthy" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/ahm3di/car_details_app/commits?author=Keerthy" title="Documentation">📖</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!