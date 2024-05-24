# FitnessApp

##  Summary of the Project

FitnessApp created with flutter by using MVVM Architecture with Bloc.
Firebase for 
This project is a mobile application where people with obesity can make their nutrition more accurate and find exercise movements covering many body regions.

You can reach out to FitnessApp Project Documentation:  [sedat_dayan_20181567_SWE492_DIET_AND_FITNESS_APP.pdf](https://github.com/Sedatdynn/FitnessApp/files/15431632/sedat_dayan_20181567_SWE492_DIET_AND_FITNESS_APP.pdf)

##  Getting Started 🚀
First, to run this project, navigate to the api directory (cd .\api) and execute the command "python main.py". Next, under the fitness_app/assets directory create a folder named env. Inside the env folder, create a file named ".env" and set the baseUrl to your local host address.
```
baseUrl =  Your local host address
```
Finally, you can run the project by executing the command "flutter run".

```
flutter run
```
### Used Packages
* auto_route: ^7.8.4 -> Navigation 
* cached_network_image: ^3.3.1 -> image caching
* cloud_firestore: ^4.0.3 -> Firebase Cloud Firestore integration
* dio: ^5.1.2 -> Network requests
* envied: ^0.5.4+1 -> environment variable management
* equatable: ^2.0.5 -> value equality comparison
* firebase_auth: ^4.1.0 -> authentication
* firebase_core: ^2.1.1 > Firebase core functionality
* flutter_bloc: ^8.1.3 -> state management using the BLoC pattern
* flutter_screenutil: ^5.9.0 -> screen size and orientation adaptation
* fluttertoast: ^8.0.8 -> toast notifications
* fpdart: ^1.1.0 -> functional programming utilities for Dart
* google_fonts: ^4.0.4 -> custom fonts from Google Fonts
* google_sign_in: ^6.1.0 -> Google authentication
* json_annotation: ^4.7.0 -> JSON serialization
* lottie: ^2.3.2 -> Lottie animations
* numberpicker: ^2.1.1 -> number picker widget
* shared_preferences: ^2.0.15  -> local data caching
* syncfusion_flutter_gauges: ^21.2.4 -> gauge widgets
* video_player: ^2.4.10 -> video playback
* youtube_player_flutter: ^8.1.1 -> YouTube video player
* shimmer: ^3.0.0  -> shimmer loading effect
* easy_localization: ^3.0.6 -> localization
* flutter_gen: ^5.4.0 -> code generation for assets, fonts
* very_good_analysis: ^5.1.0 -> linting and analysis
* mockito: ^5.4.4 -> mocking for testing

## FitnessApp Screenshots and Gifs

### Splash-Authentication-Registration
<div style="display: flex;">
  <img src="https://github.com/Sedatdynn/FitnessApp/assets/70951966/0f6f4fb5-c9fc-406f-99b9-955ca1661891" alt="splash" width="250" height="450">
  <img src="https://github.com/Sedatdynn/FitnessApp/assets/70951966/c6f13a34-8284-4e82-9def-f2a7325face7" alt="launch" width="250" height="450">
  <img src="https://github.com/Sedatdynn/FitnessApp/assets/70951966/20a1f741-f36d-4fdb-94f6-8aaf5b732853" alt="login" width="250" height="450">
  <img src="https://github.com/Sedatdynn/FitnessApp/assets/70951966/05be20e3-a227-42ec-9ba7-c63d0f520a4c" alt="google_auth" width="250" height="450">
  <img src="https://github.com/Sedatdynn/FitnessApp/assets/70951966/f4e6399e-4a41-477d-ac35-1ec02003cc2c" alt="forgot_password" width="250" height="450">
  <img src="https://github.com/Sedatdynn/FitnessApp/assets/70951966/2a422788-f42a-4c7e-b69e-078bda871406" alt="register" width="250" height="450">
  <img src="https://github.com/Sedatdynn/FitnessApp/assets/70951966/bf90cfd3-a5bb-419f-a80a-7fb6b8c25f93" alt="gender" width="250" height="450">
  <img src="https://github.com/Sedatdynn/FitnessApp/assets/70951966/bdb20ca5-42f1-4a14-a7cd-0ac597594dee" alt="birth" width="250" height="450">
  <img src="https://github.com/Sedatdynn/FitnessApp/assets/70951966/08fc635b-b133-484a-a3c8-8d24b3b3401d" alt="mobility" width="250" height="450">
  <img src="https://github.com/Sedatdynn/FitnessApp/assets/70951966/b1655288-8ad5-48be-858d-ffe217731ab6" alt="height" width="250" height="450">
  <img src="https://github.com/Sedatdynn/FitnessApp/assets/70951966/6520ef83-416e-4ba0-b412-0bf4c7da3ef9" alt="weight" width="250" height="450">

</div>


### Home

<div style="display: flex;">
  <img src="https://github.com/Sedatdynn/FitnessApp/assets/70951966/b9763b8a-2b99-4343-9b5c-8563ac54d9e6" alt="exercise_1" width="250" height="450">
  <img src="https://github.com/Sedatdynn/FitnessApp/assets/70951966/01454330-cebf-45b1-aa19-13146961b74b" alt="exercise_2" width="250" height="450">
  <img src="https://github.com/Sedatdynn/FitnessApp/assets/70951966/a773c10c-a5eb-4845-9919-c137aa185f2a" alt="exercise_3" width="250" height="450">
  <img src="https://github.com/Sedatdynn/FitnessApp/assets/70951966/7704653a-eafa-4219-80f2-ee70896c3799" alt="exercise_4" width="250" height="450">
  <img src="https://github.com/Sedatdynn/FitnessApp/assets/70951966/c388167a-b2e6-4aa8-abb3-07c235acd729" alt="exercise_5" width="250" height="450">
  <img src="https://github.com/Sedatdynn/FitnessApp/assets/70951966/50ab9640-2cdb-4959-8d7d-7bd059e1a80b" alt="diet_1" width="250" height="450">
  <img src="https://github.com/Sedatdynn/FitnessApp/assets/70951966/6e9f3bcf-0255-439a-95af-f3af39ab2fe2" alt="diet_2" width="250" height="450">
  <img src="https://github.com/Sedatdynn/FitnessApp/assets/70951966/9098e020-4d6a-4584-82fa-ee4e1b66767c" alt="language" width="250" height="450">
  <img src="https://github.com/Sedatdynn/FitnessApp/assets/70951966/43b6f25c-6a65-4f46-ac06-f703e0650e5b" alt="theme" width="250" height="450">
  <img src="https://github.com/Sedatdynn/FitnessApp/assets/70951966/88f316ea-32c8-4392-bb6f-13fca8711bad" alt="bmi" width="250" height="450">
  <img src="https://github.com/Sedatdynn/FitnessApp/assets/70951966/89c0c19c-3428-493c-a626-d9ddb2ea28a2" alt="update_profile" width="250" height="450">

</div>





