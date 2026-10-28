# ⏳ FocusFlow — Smart Student Study Planner & Focus Companion

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter" />
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart" />
  <img src="https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web%20%7C%20Desktop-lightgrey?style=for-the-badge" alt="Platforms" />
  <img src="https://img.shields.io/badge/License-MIT-blue?style=for-the-badge" alt="License" />
</p>

---

## 📖 Overview

**FocusFlow** is a modern, high-performance study session planner and focus companion built with **Flutter**. Designed specifically for college students, researchers, and deep-work professionals, FocusFlow integrates daily study goals, task management, Pomodoro focus timers, and weekly analytics into a unified, distraction-free **Electric Violet & Dark Navy** interface.

---

## ✨ Key Features

### 1. 🏠 Student Dashboard
- **Personalized Header**: Greets students based on time of day with academic profile and major details.
- **Daily Study Goal Tracker**: Circular and linear goal indicators showing completed vs. target hours, alongside active streak tracking (e.g. 6-day study streak).
- **Quick Focus Banner**: One-tap trigger to jump into a deep focus study session.
- **Performance Summary**: Real-time snapshot of daily focus hours, task completion ratio, and overall study efficiency.
- **Today's Tasks Preview**: Immediate access to top-priority tasks due today with interactive completion toggles.

### 2. 📝 Study Task Management
- **Course & Subject Association**: Tag each study task with specific university courses (e.g., *Data Structures*, *Operating Systems*, *Discrete Mathematics*).
- **Priority Matrix**: Color-coded High, Medium, and Low priority classification.
- **Dynamic Task Filters**: Filter tasks seamlessly by *All*, *Pending*, *Completed*, and *High Priority*.
- **Quick Task Modal**: Bottom-sheet modal to add new tasks with due dates, estimated durations, and subjects in seconds.

### 3. 🍅 Deep Work & Pomodoro Focus Timer
- **Multi-Mode Timer**:
  - 🍅 **Pomodoro**: 25-minute concentrated work block
  - ⚡ **Deep Work**: 50-minute intensive study session
  - ☕ **Short Break**: 5-minute refresher
  - 🛋️ **Long Break**: 15-minute restorative rest
- **Course Tagging**: Assign timer sessions to active courses for granular study analytics.
- **Interactive Controls**: Play/pause, reset, and skip actions with glowing progress circle.
- **Completion Dialog**: Rewarding session wrap-up dialog logging completed blocks.
- **Motivational Prompts**: Built-in micro-tips to help eliminate phone and notification distractions.

### 4. 📊 Study Analytics & Insights
- **Weekly Study Chart**: Visual vertical bar chart mapping study hours across Monday through Sunday.
- **High-Level Metrics**: Comparison metrics showing total weekly study hours, week-over-week trends, and daily average vs. target.
- **Subject Breakdown**: Progress distribution showing hours allocated per subject/module.
- **Session History Log**: Chronological audit trail of completed focus sessions with duration and study notes.

### 5. ⚙️ Preferences & Customization
- **Daily Target Adjuster**: Interactive slider to adjust study goals between 1.0 and 10.0 hours per day.
- **Focus Environment**: Options for study reminder notifications, haptic vibration feedback, and ambient audio background themes (Rainfall, White Noise, Forest Stream, Lo-Fi Chill).
- **Academic Project Details**: System specifications displaying versioning, target platforms, and clean architecture info.

---

## 🎨 Design System & Theme

FocusFlow features an aesthetic, dark-mode design system tailored for long study sessions:

| Token | Color Code | Purpose |
|---|---|---|
| **Primary Violet** | `#8B5CF6` | Primary brand accent, active timer glow, action buttons |
| **Secondary Cyan** | `#38BDF8` | Break indicators, duration badges, secondary highlights |
| **Deep Navy Background**| `#0B0F19` | Eye-friendly OLED-ready background |
| **Midnight Navy Card** | `#13192B` | Elevated card surfaces and panels |
| **Status Emerald** | `#10B981` | Completed tasks, positive trend indicators |
| **Status Amber** | `#F59E0B` | Active study streak badges, in-progress items |
| **Status Rose** | `#F43F5E` | High-priority deadlines and urgent tasks |

---

## 🏗️ Architecture & Folder Structure

FocusFlow follows a **feature-first, modular Clean Architecture** pattern:

```text
lib/
├── core/
│   └── theme/
│       ├── app_colors.dart       # Curated Dark Navy & Violet palette
│       ├── app_theme.dart        # Material 3 ThemeData definition
│       └── app_typography.dart   # Standardized text hierarchy
├── data/
│   ├── models/
│   │   ├── study_session_model.dart # Focus session data structure
│   │   └── task_model.dart          # Study task model & priority enum
│   └── sample_data.dart          # Structured initial sample datasets
├── features/
│   ├── app_shell/
│   │   └── presentation/screens/
│   │       └── main_scaffold.dart    # Bottom navigation & indexed stack
│   ├── dashboard/
│   │   └── presentation/
│   │       ├── screens/dashboard_screen.dart
│   │       └── widgets/
│   │           ├── daily_goal_card.dart
│   │           ├── quick_timer_banner.dart
│   │           └── task_preview_card.dart
│   ├── focus/
│   │   └── presentation/screens/focus_screen.dart
│   ├── tasks/
│   │   └── presentation/screens/tasks_screen.dart
│   ├── statistics/
│   │   └── presentation/screens/statistics_screen.dart
│   └── settings/
│       └── presentation/screens/settings_screen.dart
└── main.dart                     # App entry point & orientation lock
```

---

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (`^3.13.7` or newer)
- [Dart SDK](https://dart.dev/get-dart)
- Android Studio, VS Code, or Antigravity IDE
- Android device or emulator (Android API 24+)

### Installation & Run

1. **Clone the repository**:
   ```bash
   git clone https://github.com/whoalannn/focus-flow.git
   cd focus-flow
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Verify Flutter setup**:
   ```bash
   flutter doctor
   ```

4. **Run the application**:
   ```bash
   # Run on connected Android device / emulator
   flutter run

   # Or launch for Chrome / Web preview
   flutter run -d chrome
   ```

5. **Build APK / App Bundle**:
   ```bash
   flutter build apk --release
   ```

---

## 🛠️ Tech Stack & Dependencies

- **Framework**: [Flutter](https://flutter.dev/) (Material 3)
- **Language**: [Dart](https://dart.dev/)
- **State Management**: State-driven reactive widgets with `StatefulWidget` & `IndexedStack`
- **Formatting & Dates**: `intl: ^0.20.3`
- **Icons**: `cupertino_icons: ^1.0.8` & Material Icons
- **Code Quality**: `flutter_lints: ^6.0.0`

---

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.
