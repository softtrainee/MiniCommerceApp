# MiniCommerce (mCommerce) iOS App

## Overview

MiniCommerce is a sample mini mCommerce application built with SwiftUI, demonstrating modern iOS development best practices including MVVM, Combine, async/await networking, and local persistence. The app showcases a real-world flow: listing products, viewing product details, and managing a shopping cart.

---

## 1. Project Setup Instructions

### Requirements
- Xcode 13.2.1 or above
- iOS 15.0+

### Setup Steps

1. **Clone the Repository**
   ```sh
   git clone https://github.com/softtrainee/MiniCommerceApp.git
   cd MiniCommerce
   ```

2. **Open the Project**
   - Open `MiniCommerce.xcodeproj` with Xcode 13.2.1.

3. **Run the App**
   - Select an iOS 15+ Simulator or a real device.
   - Press `Cmd+R` or click the Run button.

#### (If submitting as a zip)
- Download the zip, extract, open the `.xcodeproj` file, and run as above.

---

## 2. Libraries Used

- **SwiftUI**: For declarative UI and navigation.
- **Combine**: For observable state and reactive bindings.
- **Foundation (URLSession, Codable, UserDefaults)**: For networking and local storage.
- **No third-party libraries** were used, to keep the project lightweight and educational.

---

## 3. Architecture Overview

- **MVVM (Model-View-ViewModel)**: Designed for clean separation of UI, business logic, and data.
- **Combine**: Used for state management with `@Published` and `@ObservableObject`.
- **Dependency Injection (DI)**: All view models accept service protocols, allowing for easy mocking and testing.
- **Async/Await**: Used for all network operations for clarity and modern concurrency.
- **Persistence**: Cart items are persisted in `UserDefaults` (bonus feature).
- **Unit Testing**: Key logic is tested with XCTest and mock services (see `Tests/`).

**File Structure:**
- `Model/`: Data models (Product, CartItem)
- `ViewModel/`: View models for each screen
- `View/`: SwiftUI views for product list, detail, and cart
- `Networking/`: API service abstraction and implementation
- `Tests/`: Unit tests and mock services

---

## 4. Known Issues

- No image caching (network images may reload on scroll).
- No real authentication or checkout flow (beyond scope).
- No advanced error handling/UI for network failures.
- UI is basic and designed for demonstration, not production polish.
- Only supports English and portrait orientation.

---

## 5. Testing

- **Unit Tests**: ViewModel logic is tested via XCTest using dependency injection and mock services.
- **MainActor isolation**: All tests accessing `@MainActor` properties do so via `@MainActor` functions or `await MainActor.run { ... }`.
- **Manual Testing**: All main flows (add to cart, quantity, remove, navigation) were manually tested on simulator.

---

## 6. Optional Features

- **Local Persistence**: Cart contents are persisted via `UserDefaults` and restored on launch.
- **Dependency Injection**: All services are injected, enabling easy mocking/testing.
- **Unit Testing**: Included in `Tests/`, demonstrating async/await, error scenarios, and MainActor isolation.

---

## Approach, Architecture, and Assumptions

- **Approach**: Focused on clarity, SwiftUI best practices, and testability. All business logic is moved out of views.
- **Architecture**: MVVM + Combine, with services injected via protocols.
- **Assumptions**:
  - Users do not log in; cart is per device.
  - Only product list, detail, and basic cart flows are required.
  - Only built-in Apple frameworks are permitted.
- **Time Taken**: ~5-6 hours (coding, testing, and documentation).

---


## Output
<img width="487" alt="Screenshot 2025-06-27 at 2 34 44 PM" src="https://github.com/user-attachments/assets/59e64e95-6e3e-44cd-8420-8c9047de731e" />
<img width="487" alt="Screenshot 2025-06-27 at 2 35 10 PM" src="https://github.com/user-attachments/assets/1f208c78-987f-42b7-b877-e3dfe2d7e8f0" />
<img width="487" alt="Screenshot 2025-06-27 at 2 35 21 PM" src="https://github.com/user-attachments/assets/ccc9a8b9-725f-4708-a445-13d20e2a44ad" />
<img width="487" alt="Screenshot 2025-06-27 at 2 35 48 PM" src="https://github.com/user-attachments/assets/1f638f52-48b8-4c37-84a6-61cf1f266389" />


## Screen Recording

Please see the attached [Video](https://www.youtube.com/shorts/c4Ow3yh_WPY) demonstrating:
- Product list loading
- Detail view
- Adding/removing/updating cart
- Cart persistence

---

Thank you for reviewing the project!
