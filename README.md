## Project Overview

Welcome to my simple  **Speech-To-Text App**. I implemented main clean architecture priciples. The app code is divided into three layers: data, domain and presentation. I used **Bloc** library for state-management and **record**, **just_sound** libs to implement recording and playback features. 

## Setup project:
1. Copy google-credentials.json to assets folder.
1. Generate freezed models:
`flutter pub run build_runner build --delete-conflicting-outputs`
1. Install packages: `flutter pub get`
1. Run app

### GitFlow:

Use key words to indicate change type in branches: *feature*, *bugfix*, *refact*

*feature* - use for any types of new changes. **Examples**:
- created new widget
- implemented new features and etc.

*bugfix* - use for any bugfixes. **Examples**:
- fixed button behavior
- fixed some business logic and etc.

*refact* - use for refactoring.

**Branch name examples**: *feature/slider*, *bugfix/slider*, *refact/slider*