Simple Modal Presentation for SwiftUI
====================

ModalPresentationKit is a lightweight SwiftUI library that simplifies modal presentations using a presenter pattern. Manage sheets and full-screen covers effortlessly.

Presentation Styles
--------
Right now two presentation styles are available:

*   **Full Screen Cover**
*   **Sheet**

Features
--------

*   **Easy Modal Management**: Present and dismiss modals with minimal code.
*   **Data Passing Support**: Pass data to your modals seamlessly.
*   **Simple Integration**: Add to your project and start using immediately.
*   **Example App Available**: An example app is included in the package.

Installation
------------

### Swift Package Manager

1.  In Xcode, go to **File > Add Packages...**
2.  Enter the repository URL: `https://github.com/yourusername/ModalPresentationKit.git`
3.  Select the package and add it to your project.

Usage
-----

### 1\. Define Modal Destinations

Create an enum conforming to `ModalDestination`, where each case represents a modal view.

```swift
import SwiftUI
import ModalPresentationKit

enum ModalDestinations: ModalDestination {
    case exampleView
    case detailView(data: String) // For passing data
    
    var body: some View {
        switch self {
        case .exampleView:
            ExampleView()
        case .detailView(let data):
            DetailView(data: data)
        }
    }
}
```

### 2\. Initialize the Modal Presenter

Set up `ModalPresenter` in your `App` or main view.

```swift
import SwiftUI
import ModalPresentationKit

@main
struct YourApp: App {
    @StateObject var presenter = ModalPresenter<ModalDestinations>()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(presenter)
                .modalPresenter(presenter)
        }
    }
}
```

### 3\. Present Modals

Use the presenter to show modals from your views.

```swift
import SwiftUI
import ModalPresentationKit

struct ContentView: View {
    @EnvironmentObject var presenter: ModalPresenter<ModalDestinations>

    var body: some View {
        VStack {
            Button("Show Example View") {
                presenter.present(destination: .exampleView, style: .sheet)
            }

            Button("Show Detail View with Data") {
                presenter.present(destination: .detailView(data: "Hello, World!"), style: .fullScreenCover)
            }
        }
    }
}
```

### 4\. Dismiss Modals

Inside your modal views, call `presenter.dismiss()` to close the modal.

```swift
import SwiftUI
import ModalPresentationKit

struct ExampleView: View {
    @EnvironmentObject var presenter: ModalPresenter<ModalDestinations>

    var body: some View {
        VStack {
            Text("Example View")
            Button("Dismiss") {
                presenter.dismiss()
            }
        }
    }
}
```

### 5\. Pass Data to Modals

To pass data, use associated values in your enum and access them in your modal view.

```swift
// In ModalDestinations enum
case detailView(data: String)

// In DetailView
struct DetailView: View {
    let data: String

    var body: some View {
        Text(data)
    }
}
```

Example App
-----------

An [ExampleApp](https://github.com/aadzhanow/ModalPresentationKit/tree/main/ExampleApp) demonstrating how to use ModalPresentationKit is included in the package.
