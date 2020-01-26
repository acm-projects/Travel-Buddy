# Travel-Buddy
Mobile app designed to be your own personal travel assistant to help with smart itinerary planning and packing.

## MVP
- A simple app with multiple pages including at minimum:
  - Packing List
    - Comes preloaded with a master packing list that is customizable (can add, remove, and change items)
  - Itinerary
    - A week or day view planner with events depicted as blocks of hours
    - Users can add flight / travel info
    - Events can be dragged and dropped
    - Location info can be auto-filled (ie. given the name of a restaurant / museum, info on the address / closing times is attached)
    - Calculates travel time between places

## Stretch Goals
- User login and authentication
- Pop up notifications before events
- Recommends restaurants and big landmarks to visit nearby
  - Even better if the recommendations can be refined to either the interests of the user or a search bar / tags
- Given a list of places that the user is interested in visiting or are already in their schedule, the app will try to plan out a day’s itinerary (taking into account closing times and travel times)
- Currency converter
- Connect to available ride share apps

## Resources
- [Git Bash for Windows](https://gitforwindows.org)
- [Flutter](https://flutter.dev/)
  - Google's UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.
  - Uses [Dart](https://dart.dev/) language
    - [Rundown of Dart](https://dart.dev/guides/language/language-tour)
  - Setup:
    - [Official Flutter Setup Instructions](https://flutter.dev/docs/get-started/install)
    - [Install and Setup Video](https://www.youtube.com/watch?v=1ukSR1GRtMU)
- Any text editor can be used eg. [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)
  - Personally I prefer Android Studio. VS Code might be lighter and cleaner, but Android Studio has never let me down, would be valuable to learn for future projects / career, and most tutorials out there will explain using Android Studio as the default.
- [Firebase](https://firebase.google.com/)
  - Database to store user info (accounts, lists, schedule, etc)
  - [Adding Firebase to Your Android Project](https://firebase.google.com/docs/android/setup)
  - [Flutter and Firebase Tutorial](https://www.youtube.com/watch?v=sfA3NWDBPZ4&list=PL4cUxeGkcC9j--TKIdkb3ISfRbJeJYQwC)
- [Google Places API](https://developers.google.com/places/web-service/intro)
  - API for auto filling location info and places nearby

### Suggestions
- [Flutter vs. React Native](https://www.thedroidsonroids.com/blog/flutter-vs-react-native-what-to-choose-in-2020)
  - If you want, you can choose to use React Native. Flutter has some troubles with Firebase, but it's very good with UI, loads quickly for people on the go, and is made by Google vs Facebook (same as Firebase and the Maps API).

### Common GitHub Commands
[GitHub Cheatsheet PDF](https://www.atlassian.com/dam/jcr:8132028b-024f-4b6b-953e-e68fcce0c5fa/atlassian-git-cheatsheet.pdf)

Login:

| Command | Description |
| ------ | ------ |
| git config --global user.name "username" |  |
| git config --global user.email "email" |  |
| git config user.name | Checks that you're in, in case you’re unsure |

First Time Setup:

| Command | Description |
| ------ | ------ |
| git clone | Creates local copy of remote repo. Try to not do this again unless you blew up your computer |

General Use

| Command | Description |
| ------ | ------ |
| cd "encryption-evolution" | Change directories over to our repository |
| git branch | Lists branches for you |
| git branch "branch name" | Makes new branch |
| git checkout "branch name" | Switch to branch |
| git checkout -b "branch name" | Same as 2 previous commands together |
| git add . | Finds all changed files |
| git commit -m "Testing123" | Commit with message |
| git push origin "branch" | Push to branch |
| git pull origin "branch" | Pull updates from a specific branch |
