# Flutter GraphQL Application

A Flutter application demonstrating a clean and scalable approach to working with GraphQL APIs.

## Overview

This project shows how to build a Flutter app that interacts with a GraphQL backend using a structured architecture. It brings together several tools to create a reliable development setup:

- **GraphQL Flutter** — Handles queries, mutations, and subscriptions with a type-safe, declarative API.
- **Dio** — Wrapped around the GraphQL client to provide improved error handling, interceptors, and network logging.
- **Flutter BLoC** — Used as the state management layer to keep UI updates predictable and easy to test.

These tools work together to demonstrate a practical pattern you can use in real projects.

## Pubspec Plugins Used

This example assumes you're using a recent version of the Flutter SDK.

To use these plugins in your package, add these dependencies to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  graphql_flutter: ^5.1.0
  dio: ^5.4.0
  flutter_bloc: ^8.1.3
  json_annotation: ^4.8.1
  get_it: ^9.0.5
  injectable: ^2.5.2

dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^2.4.6
  json_serializable: ^6.7.1
  flutter_lints: ^3.0.0
  injectable_generator: ^2.9.0
```

### Key Dependencies Explained

- **`graphql_flutter`** – Core library for making GraphQL requests in Flutter with built-in caching and state management.
- **`dio`** – HTTP client used for custom error handling, request interceptors, and network logging.
- **`flutter_bloc`** – State management using the BLoC (Business Logic Component) pattern for predictable UI updates.
- **`equatable`** – Simplifies value equality comparisons in Dart classes, particularly useful with BLoC states and events.
- **`json_annotation` / `json_serializable`** – Used for generating model classes and handling JSON mapping cleanly.
- **`build_runner`** – Development tool that runs code generators for serialization and other build tasks.

## Setup Instructions

### 1. Install Dependencies

Run the following command to install all required packages:

```bash
flutter pub get
```

### 2. Generate Code

This project uses code generation for JSON serialization. Run this command to generate the necessary files:

```bash
flutter pub run build_runner build
```

For continuous code generation during development:

```bash
flutter pub run build_runner watch
```
