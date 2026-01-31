# Cardinal Quotes App

A beautiful and inspiring Flutter application designed to deliver daily cardinal quotes and spiritual wisdom. The app combines elegant UI design with meaningful content to inspire and uplift users.

## 📋 Table of Contents

- [Features](#features)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Dependencies](#dependencies)
- [Architecture](#architecture)
- [Getting Started](#getting-started)
- [Build & Run](#build--run)
- [Requirements](#requirements)
- [License](#license)

## ✨ Features

### Core Features

- **Home Screen**: Main dashboard with quotes and daily inspiration
- **Audio Quotes**: Listen to motivational quotes through audio playback
- **Soul Check-in**: Personal reflection and wellness tracking feature
- **Top Quotes**: Browse and discover the most popular and trending quotes
- **Sounds**: Audio library with background sounds and ambient music
- **Memorial Cards**: Create and view memorial collections
- **Journal**: Personal journaling feature to record thoughts and reflections
- **Save**: Bookmark and save favorite quotes for later access
- **Navigation Drawer**: Easy access to all app features and settings

### User Experience Features

- **Responsive Design**: Optimized UI using Flutter ScreenUtil for all screen sizes
- **Custom Navigation**: Beautiful custom bottom navigation bar
- **Material Design**: Modern Material Design 3 implementation
- **Google Fonts**: Typography using Google Fonts for elegant text rendering
- **SVG Support**: Vector graphics support for scalable icons and illustrations
- **Dark/Light Theme**: Theme support with customizable color schemes
- **Notification System**: In-app notifications and alerts

## 📁 Project Structure

```
cardinal_quotes_app/
├── lib/
│   ├── main.dart                          # Application entry point
│   ├── src/
│   │   ├── app.dart                       # Main app configuration
│   │   ├── common_widgets/                # Reusable UI components
│   │   ├── constants/
│   │   │   ├── app_colors.dart           # Color palette
│   │   │   ├── app_strings.dart          # Localization strings
│   │   │   └── app_theme.dart            # Theme configuration
│   │   ├── features/
│   │   │   ├── authentication/           # User login/signup
│   │   │   ├── home/                     # Home screen
│   │   │   ├── journal/                  # Journal feature
│   │   │   ├── main/                     # Main navigation screen
│   │   │   ├── memorial_cards/           # Memorial collections
│   │   │   ├── more/                     # Additional features
│   │   │   ├── save/                     # Saved quotes
│   │   │   ├── soul_check_in/            # Wellness check-in
│   │   │   ├── sound_player/             # Audio playback
│   │   │   ├── sounds/                   # Sound library
│   │   │   └── top_quotes/               # Popular quotes
│   │   ├── models/                       # Data models
│   │   ├── routing/                      # Navigation configuration
│   │   └── services/                     # Business logic services
│   └── test/
│       └── widget_test.dart              # Widget tests
├── assets/
│   ├── images/                           # Image assets
│   └── icons/                            # Icon assets
├── android/                              # Android platform files
├── ios/                                  # iOS platform files
├── pubspec.yaml                          # Project dependencies
├── analysis_options.yaml                 # Lint rules
└── README.md                             # This file
```

## 🔧 Dependencies

### Core Dependencies

- **Flutter**: Google's UI framework
- **cupertino_icons** (^1.0.8): iOS-style icons
- **google_fonts** (^6.3.1): Beautiful typography with Google Fonts
- **flutter_svg** (^2.2.1): SVG rendering support
- **flutter_screenutil** (^5.9.3): Responsive UI adaptation

### Development Dependencies

- **flutter_test**: Flutter testing framework
- **flutter_lints** (^5.0.0): Lint rules for code quality

## 🏗️ Architecture

The app follows a feature-based architecture pattern:

### Design Patterns

1. **Feature-Based Structure**: Each feature is self-contained in its own directory
2. **Separation of Concerns**: Clear separation between UI, business logic, and services
3. **Reusable Widgets**: Common widgets are centralized for consistency
4. **Theming System**: Centralized theme and color management
5. **Navigation Management**: Organized routing system for screen navigation

### Key Components

- **Features**: Independent feature modules containing screens and widgets
- **Common Widgets**: Shared UI components used across features
- **Models**: Data structures and entity definitions
- **Services**: Business logic and data management layer
- **Constants**: App-wide constants, colors, strings, and themes

## 📱 Screen Layout

The app uses a bottom navigation bar with four main tabs:

1. **Home** - Daily quotes and main dashboard
2. **Sounds** - Audio quotes and ambient sounds
3. **Soul Check-in** - Wellness and reflection feature
4. **Top Quotes** - Most popular quotes

Additional features accessible through:
- Navigation drawer
- Notification system
- Settings and more options menu

## 🚀 Installation

### Prerequisites

- Flutter SDK (3.9.0 or higher)
- Dart SDK (included with Flutter)
- Android Studio or Xcode (for emulator/device testing)
- A code editor (VS Code, Android Studio, or IntelliJ)

### Setup Steps

1. **Clone or Download the Project**
   ```bash
   cd cardinal_quotes_app
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate Build Files** (if needed)
   ```bash
   flutter pub get
   flutter gen-l10n  # if using localization
   ```

## 🏃 Getting Started

### Development Environment Setup

1. Ensure Flutter is properly installed:
   ```bash
   flutter doctor
   ```

2. Navigate to the project directory:
   ```bash
   cd /path/to/cardinal_quotes_app
   ```

3. Get dependencies:
   ```bash
   flutter pub get
   ```

## 🛠️ Build & Run

### Run on Emulator/Device

```bash
# List available devices
flutter devices

# Run on default device
flutter run

# Run on specific device
flutter run -d <device_id>

# Run in debug mode
flutter run --debug

# Run in release mode
flutter run --release

# Run with verbose logging
flutter run -v
```

### Build Release APK (Android)

```bash
flutter build apk --release
# Output: build/app/outputs/flutter-apk/app-release.apk
```

### Build iOS App

```bash
flutter build ios --release
```

### Build Web App

```bash
flutter build web --release
```

## 📦 Assets

### Images
Located in `assets/images/`
- App logos and branding
- Feature-specific illustrations

### Icons
Located in `assets/icons/`
- Navigation icons
- Feature-specific icons
- SVG icon files for scalability

### Color Scheme
- Primary colors defined in `lib/src/constants/app_colors.dart`
- Supports light and dark themes

## 🎨 Customization

### Theming

Modify `lib/src/constants/app_theme.dart` to customize:
- Color schemes
- Typography
- Component styling
- Light/Dark mode

### Colors

Edit `lib/src/constants/app_colors.dart` for:
- Primary brand colors
- Secondary accent colors
- Background colors
- Text colors

### Strings

Update `lib/src/constants/app_strings.dart` for:
- UI text labels
- Messages
- Error messages
- Localization strings

## 🧪 Testing

Run unit and widget tests:

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/widget_test.dart

# Run tests with coverage
flutter test --coverage
```

## 📊 Performance Optimization

- **ScreenUtil**: Responsive design adaptation
- **SVG**: Lightweight vector graphics
- **Material Design**: Optimized UI rendering
- **Lazy Loading**: On-demand feature loading

## 🔍 Code Quality

Run lint checks:

```bash
flutter analyze
```

Format code:

```bash
dart format .
```

## 📋 Requirements

- **Flutter**: ^3.9.0
- **Dart**: ^3.9.0
- **Android**: API level 21+
- **iOS**: iOS 11.0+

## 🤝 Contributing

1. Create a feature branch for your changes
2. Make your modifications
3. Test thoroughly on both Android and iOS
4. Submit your changes

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 📧 Support

For support, questions, or feedback, please contact the development team.

## 🎯 Future Enhancements

- [ ] Social sharing features
- [ ] Quote collections and favorites management
- [ ] Push notifications for daily quotes
- [ ] User authentication and accounts
- [ ] Offline quote database
- [ ] Advanced search and filtering
- [ ] User-generated content features
- [ ] Analytics and usage tracking

---

**Version**: 1.0.0
**Last Updated**: February 1, 2026
**Status**: Active Development