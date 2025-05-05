## 📱 Key Features
- 📆 **Hijri Calendar Integration**
- 📈 **Radial Chart** for attendance visualization
---

## 🧠 Architecture Overview
```
lib/
├── core/ # Shared and reusable logic
│ ├── colors/ # App color definitions
│ └── styles/ # Text styles, themes, etc.
│
├── features/ # App features grouped by functionality
│ ├── feature_name/
│ │ ├── cubit/ # State management using Cubit (Bloc)
│ │ ├── views/
│ │ │ ├── widgets/ # Reusable UI components
│ │ │ └── main_view.dart # Main screen of the feature
│ │ └── model/ # Optional: Data models for the feature
│
├── main.dart # Entry point
```


## 🧩 Technologies Used

- **Flutter** 🐦
- **Bloc/Cubit** for state management
- **MVVM** (Model-View-ViewModel) pattern
- **ScreenUtil** for responsive UI (`flutter_screenutil`)
- **Clean Code** principles (readable, modular, testable)

---
![Screenshot_20250505_182823](https://github.com/user-attachments/assets/9325c2d8-101e-42dc-9818-fffbf8782217)


