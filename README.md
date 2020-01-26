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
- Given a list of places the user is interested in visiting or are already in their schedule, the app will try to plan out a day’s itinerary (taking into account closing times and travel times)
- Currency converter
- Connect to available ride share apps

## Resources
- [Git Bash for Windows](https://gitforwindows.org)
- [Flutter](https://flutter.dev/)
  - Google's UI framework, comprehensive app Software Development Kit (SDK) complete with widgets and tools 
  - Uses [Dart](https://dart.dev/) language
- Any text editor can be used eg. [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)
- [Firebase](https://firebase.google.com/)
  - Database to store user info (accounts, lists, schedule, etc)
- [Google Places API](https://developers.google.com/places/web-service/intro)
  - API for auto filling location info and places nearby

### Suggestions
- [Flutter vs. React Native](https://www.thedroidsonroids.com/blog/flutter-vs-react-native-what-to-choose-in-2020)
  - If you want, you can choose to use React Native. Flutter has some troubles with Firebase, but it's very good with UI, loads quickly for people on the go, and I like Google better than Facebook.

### Common Github Commands
Login:
> git config --global user.name "username"

> git config --global user.email "email"

> git config user.name ((checks that you're in, in case you’re unsure))

First Time Setup:
> git clone ((never do this again unless you blew up your computer))

General Use
> cd "encryption-evolution" ((change directories over to our repository))
> git branch ((lists branches for you))
> git branch "branch name" ((makes new branch))
> git checkout "branch name" ((switch to branch))
> 	git checkout -b "branch name" ((same as 2 prev commands together))
> git add . ((finds all changed files))
> git commit -m "Testing123" ((commit message))
> git push origin "branch" ((push to branch))
> git pull origin "branch" ((pull updates from a specific branch))


