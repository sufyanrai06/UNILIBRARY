# UniLibrary - Mobile Application Development (EL-333) Quiz 2

- **Student Name:** Abu Sufyan
- **Roll No / Student ID:** BSIT-F23-M14
- **PIN:** 4650

## Project Structure
- `lib/main.dart` - App entry point, Teal theme (`useMaterial3: false`), and tab title `UniLibrary - BSIT-F23-M14`
- `lib/signin.dart` - Student Sign In screen with validation, show/hide PIN, and sign-out return status
- `lib/home.dart` - Home screen greeting `Hello, BSIT-F23-M14`, profile photo, name, and Sign Out confirmation dialog
- `assets/images/library_logo.png` - Library book logo for Sign In screen
- `assets/images/profile_pic.jpeg` - Student profile picture for Home screen
- `pubspec.yaml` - Asset configuration

## How to Run & Build Web
1. Create a new Flutter project named `unilibrary` (or copy these files into your project).
2. Run `flutter pub get`
3. Test locally: `flutter run -d chrome`
4. Build for web deployment: `flutter build web --release`
5. Upload the `build/web` folder to Netlify Drop / Vercel / Firebase Hosting.
6. Zip the `lib` folder separately if required for LMS submission.
