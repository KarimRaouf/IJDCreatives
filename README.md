# 📱 Flutter App Architecture (MVVM)

This project follows a clean **MVVM architecture** with a separation of concerns between the core functionalities and app features.

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

## 🎯 Benefits

- 🔄 **Scalable** and easy to maintain
- 📱 **Responsive UI** with `flutter_screenutil`
- 🧼 **Clean and organized codebase**
- 📦 **Modular features** with isolated logic and views

![image](https://github.com/user-attachments/assets/d5dbc600-c581-42a5-9133-5349db81d56e)
