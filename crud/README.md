# Taskly - A crud assessment app for Zealight Innovation Labs

Taskly is a Flutter-based task management app designed to help users efficiently manage their daily tasks. It supports persistent storage using Hive, dark/light mode theming, and intuitive UI for adding, editing, and deleting tasks. The app features a responsive design that works seamlessly across different devices and screen sizes.

Users can add tasks with a title and duration, mark tasks with a tick box, and easily delete tasks via swipe gestures. The app ensures data persistence so tasks remain even after restarting the app.

## Features
- Add Tasks: Users can add new tasks with a title and duration.
- Edit Tasks: Edit existing tasks with ease.
- Delete Tasks: Swipe-to-delete functionality for tasks.
- Tick Box: Mark tasks visually with a tick box.
- Persistent Storage: All tasks are saved locally using Hive and remain after app restarts.
- Dark/Light Theme: Switch between dark and light themes dynamically.
- Responsive UI: UI adapts to different screen sizes.
- Custom App Theme: Consistent text styles and colors throughout the app.
- GetX State Management: Efficient reactive state handling for tasks and themes.
- Floating Action Button: Quick access to add new tasks.

## Getting Started

You can download the apk directly on your android device and install. Allow from unknown sources!!

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)

## To Run the app

- Copy the repo link
- Clone the repository using git clone
- Run flutter pub get to download repositories
- Run flutter run to build the app

## Tools/ Library Used
# Framework & Language
- Flutter – UI framework for building cross-platform apps
- Dart – Programming language used throughout the project

# State Management
- GetX – For routing, dependency injection, and reactive state management

# Local Storage
- Hive – Lightweight NoSQL database for storing task items locally
- Hive Flutter Adapter – For integrating Hive with Flutter
- Hive Type Adapters – Used to serialize the ItemModel

# UI/Styling
- Google Fonts – For custom typography (Inter font)
- Material 3 Components – Default Flutter UI widgets
- Custom Theme Controller (GetX) – For dynamic light and dark mode switching
- Custom App Theme – Centralized text styles and color system

# Other Tools
- Dart DevTools – Debugging and performance tracking
- Android Studio / VS Code – Development environment
- Git & GitHub – Version control and repository hosting
