# Movie App

A Flutter application for browsing and discovering movies with a clean, modern interface. Browse popular movies, search by title, filter by genre and release year, and manage your favorite movies collection.

## Features

- **Movie Discovery**: Browse "Now Showing" and "Popular" movies
- **Movie Details**: View comprehensive information about any movie
- **Favorites**: Add and manage your favorite movies (works offline)
- **Search & Filter**: Search movies by title and filter by genre and release year
- **Localization**: Available in Croatian and English
- **Themes**: Light and dark theme support
- **Clean UI**: Modern, responsive design following Material Design principles

## Architecture

This project follows **Clean Architecture** principles with the following structure:

```
lib/
├── core/                    # Shared components
│   ├── constants/
│   ├── database/
│   ├── entity/
│   ├── error/
│   ├── localization/
│   ├── models/
│   ├── navigation/
│   ├── network/
│   ├── services/
│   ├── theme/
│   ├── utils/
│   └── widgets/
└── features/               # Feature modules
    ├── movie_details/
    ├── movie_search/
    ├── movies/
    └── settings/
```

Each feature follows the Clean Architecture pattern:
- **Data Layer**: Repository interfaces and implementations
- **Domain Layer**: BLoC (bloc, state, event) and entity models  
- **Presentation Layer**: Pages and widgets

### Key Design Decisions

- **State Management**: BLoC pattern for predictable state management
- **Dependency Injection**: get_it with injectable for clean dependency management
- **Local Storage**: Drift for local database (favorites), SharedPreferences for settings
- **Network**: Retrofit + Dio for API communication with type-safe endpoints
- **Code Generation**: Freezed for immutable models, json_annotation for serialization
- **Theming**: Custom theme system with persistent theme selection

## Requirements

- Flutter SDK: `>=3.35.3`
- Dart SDK: `>=3.1.3 <4.0.0`
- iOS: 13.0+
- Android: API level 19 (Android 4.4+)

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/darko1551/movie-app.git
cd movie_app
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Generate Code

Run code generation for models and dependency injection:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 4. API Key Setup

1. Get your API key from [The Movie Database (TMDB)](https://www.themoviedb.org/settings/api)
2. Create a `.env` file in the root directory of the project
3. Add your API key:

```env
TMDB_API_KEY=your_api_key_here
```

**Important**: Never commit your `.env` file to version control. It's already included in `.gitignore`.

### 5. Run the App

```bash
flutter run
```

## Testing

### Run All Tests

```bash
flutter test
```

### Run Specific Test Types

```bash
# Unit tests only
flutter test test/unit_tests/

# Widget tests only  
flutter test test/widget_tests/

### Generate Test Coverage

```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

## Key Dependencies

- **flutter_bloc** & **bloc**: State management
- **get_it** & **injectable**: Dependency injection
- **retrofit** & **dio**: HTTP client and API integration
- **drift**: Local database for favorites
- **shared_preferences**: Simple key-value storage
- **freezed** & **json_annotation**: Code generation for models
- **flutter_dotenv**: Environment variable management
- **mocktail**: Testing framework

## Project Structure Details

### Core Module
Contains shared functionality used across features:
- **Network**: HTTP client configuration, interceptors
- **Database**: Local storage setup and configuration
- **Theme**: Light/dark theme definitions and management
- **Constants**: API endpoints, app constants
- **Services**: Storage service abstractions
- **Utils**: Helper functions and extensions

### Features
Each feature is self-contained with its own:
- **Data**: API models, repository implementations
- **Domain**: Business logic, entities, BLoCs
- **Presentation**: UI components, pages, widgets

## API Integration

This app uses [The Movie Database (TMDB) API v3](https://developers.themoviedb.org/3) for movie data.

### Endpoints Used:
- `/movie/now_playing` - Currently playing movies
- `/movie/popular` - Popular movies
- `/movie/{movie_id}` - Movie details
- `/search/movie` - Search movies

## Limitations

- **Internet Required**: App requires internet connection for movie data (except viewing saved favorites)
- **No Offline Browsing**: Movies cannot be browsed without internet connection
- **Favorites Only Offline**: Only previously saved favorites are accessible offline
