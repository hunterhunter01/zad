# 🌙 Zad | زَاد

<p align="center">
  <strong>A modern Islamic companion for your daily spiritual journey.</strong>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/c0e565c8-a228-4cbc-9915-0a8693e9f97d" width="180" alt="Zad Home Screen" />
  <img src="https://github.com/user-attachments/assets/3cb7acf9-9de0-4d84-9126-9dc75bdbf62a" width="180" alt="Zad Names of Allah Screen" />
  <img src="https://github.com/user-attachments/assets/66048e91-b73c-455c-961c-9361d6488574" width="180" alt="Zad Quran Screen" />
  <img src="https://github.com/user-attachments/assets/43aaa58e-76e5-4ee3-97dc-79bc1206af2b" width="180" alt="Zad Quran Reading Screen" />
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/e5074a17-3a60-41bf-8e69-4646e6dae014" width="180" alt="Zad Azkar Screen" />
  <img src="https://github.com/user-attachments/assets/30a78043-4d41-415a-b958-106b4b82dca4" width="180" alt="Zad Islamic Features Screen" />
  <img src="https://github.com/user-attachments/assets/162ce6a8-7e4a-48e6-abf9-eae33c7a673a" width="180" alt="Zad Dua Screen" />
  <img src="https://github.com/user-attachments/assets/284a0cef-6e84-4bd3-ad39-3d164539cd3d" width="180" alt="Zad App Preview" />
</p>



---

## 📖 About Zad

**Zad (زَاد)** is a Flutter-based Islamic mobile application designed to help Muslims maintain their daily spiritual routines through a clean, simple, and modern experience.

The app brings together essential Islamic resources in one place, including the **Holy Quran, daily Azkar, Duas, and the 99 Names of Allah**, with additional features planned for future releases.

> **زَاد — رفيقك في طريق الطاعة 🤍**

---

## ✨ Features

### 📖 Holy Quran — القرآن الكريم

* Browse and navigate through the Quran.
* Read Surahs with a clean and comfortable reading experience.
* Arabic-first typography and RTL support.
* Page-based Quran reading.
* Surah information and navigation.
* Designed for distraction-free reading.

### 📿 Daily Azkar — الأذكار

Keep your daily remembrance organized in one place.

* 🌅 Morning Azkar
* 🌙 Evening Azkar
* 🕌 Post-prayer Azkar
* 📿 Categorized remembrance
* 🔢 Easy-to-use counting experience

### 🤲 Duas — الأدعية

A collection of daily Islamic supplications organized for easy access.

* Daily Duas
* Categorized supplications
* Simple reading interface
* Arabic RTL layout

### ✨ 99 Names of Allah — أسماء الله الحسنى

Explore the beautiful names of Allah through an elegant and readable interface.

* All 99 Names of Allah
* Arabic names
* Meanings and explanations
* Dedicated presentation for each name

### 🎨 Modern & Responsive UI

Zad is designed with a focus on simplicity and readability.

* 📱 Responsive layouts
* 🌙 Islamic-inspired visual identity
* 🖋️ Arabic-friendly typography
* ↔️ Full RTL support
* ⚡ Smooth navigation
* 📐 Responsive sizing with `flutter_screenutil`

---

## 🚧 Coming Soon

Zad is actively being developed, with more Islamic features planned for upcoming releases.

### 🕌 Prayer Times

* Daily prayer times
* Fajr, Dhuhr, Asr, Maghrib & Isha
* Location-based calculation
* Next prayer indicator
* Prayer notifications

### 📅 Islamic Calendar

* Hijri calendar
* Gregorian calendar
* Important Islamic dates
* Islamic occasions and events

### 🔔 Notifications

Planned reminders for:

* Prayer times
* Morning & evening Azkar
* Daily Duas
* Other spiritual reminders

---

## 🛠️ Tech Stack

Zad is built using modern Flutter development practices.

| Technology             | Purpose                           |
| ---------------------- | --------------------------------- |
| **Flutter**            | Cross-platform mobile development |
| **Dart**               | Programming language              |
| **Bloc / Cubit**       | State management                  |
| **flutter_screenutil** | Responsive UI                     |
| **Google Fonts**       | Typography                        |
| **Material Design**    | UI components                     |

---

## 🏗️ Architecture

The project follows a feature-oriented architecture to keep the codebase organized and scalable.

```text
lib/
├── core/
│   ├── constants/
│   ├── themes/
│   ├── utils/
│   └── widgets/
│
├── features/
│   ├── quran/
│   │   ├── data/
│   │   ├── presentation/
│   │   │   ├── cubit/
│   │   │   └── screens/
│   │   └── ...
│   │
│   ├── azkar/
│   ├── dua/
│   ├── names_of_allah/
│   └── home/
│
└── main.dart
```

This structure makes it easier to add new Islamic features without tightly coupling different parts of the application.

---

## 🚀 Getting Started

### Prerequisites

Make sure you have the following installed:

* [Flutter SDK](https://flutter.dev/)
* Dart SDK
* Android Studio or VS Code
* Flutter & Dart extensions
* Android Emulator, iOS Simulator, or a physical device

### 1. Clone the repository

```bash
git clone https://github.com/hunterhunter01/zad.git
```

### 2. Navigate to the project

```bash
cd zad
```

### 3. Install dependencies

```bash
flutter pub get
```

### 4. Run the application

```bash
flutter run
```

---

## 📱 Supported Platforms

Currently focused on:

* 🤖 Android
* 🍎 iOS

Flutter also makes it possible to extend the application to additional platforms in the future.

---

## 🗺️ Roadmap

* [x] Quran browsing
* [x] Quran reading
* [x] Daily Azkar
* [x] Duas
* [x] 99 Names of Allah
* [x] Responsive UI
* [ ] Prayer times
* [ ] Prayer notifications
* [ ] Islamic calendar
* [ ] Hijri date support
* [ ] Bookmarks & favorites
* [ ] Reading progress
* [ ] Dark mode
* [ ] Additional Quran customization
* [ ] More personalization features

---

## 🎯 Project Goals

Zad aims to provide an experience that is:

**Simple** — Easy to navigate without unnecessary complexity.

**Beautiful** — A calm and modern interface inspired by Islamic aesthetics.

**Accessible** — Designed for comfortable daily use across different screen sizes.

**Expandable** — Built with a scalable architecture that makes future features easier to integrate.

---

## 🤝 Contributing

Contributions, suggestions, and feedback are welcome.

If you'd like to contribute:

1. Fork the repository.
2. Create a new branch.

```bash
git checkout -b feature/your-feature
```

3. Make your changes.
4. Commit your changes.

```bash
git commit -m "feat: add your feature"
```

5. Push the branch.

```bash
git push origin feature/your-feature
```

6. Open a Pull Request.

---

## 📄 License

This project is currently available for personal and educational use.

Please check the repository for the latest licensing information.

---

## 🌙 About the Name

**Zad (زاد)** means *provision* or *sustenance for a journey*.

In the context of the application, it represents the spiritual provisions we carry throughout our journey in life:

> **﴿وَتَزَوَّدُوا فَإِنَّ خَيْرَ الزَّادِ التَّقْوَىٰ﴾**
> سورة البقرة الاية 197

---

<p align="center">
  Made with ❤️ and Flutter
</p>

<p align="center">
  <strong>🌙 Zad | زَاد</strong>
  <br>
  <em>Your companion for daily remembrance and worship.</em>
</p>
