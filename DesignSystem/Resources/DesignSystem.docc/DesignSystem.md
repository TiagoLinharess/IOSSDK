# SharpnezDesignSystem

![Build Status](https://api.travis-ci.com/TiagoLinharess/SharpnezDesignSystem.svg)
![Platform](https://img.shields.io/cocoapods/p/SharpnezDesignSystem.svg?style=flat)
![Cocoapods Compatible](https://img.shields.io/cocoapods/v/SharpnezDesignSystem.svg)

## What is?
### SharpnezDesignSystem is a DesignSystem module for iOS development. This is a UI module including components and UI helpers for better development.

## Installing via cocoapods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command

```bash
$ gem install cocoapods
```

Frist of all, you need to setup a source propertie in your ``Poffile``

```
source 'https://github.com/CocoaPods/Specs.git'
```

After that still in your Pofile file add the following line.

```
pod 'SharpnezDesignSystem', '~> 1.0.1'
```
Then, run the following command:

```bash
$ pod install
```
## Setup Module

At frist, if you do not want to use use the DesignSystem custom fonts, jump for the next step, now if you want to use, setup the custom fonts in your AppDelegate or in another file that is used before using the fonts

```swift
import SharpnezDesignSystem
import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        DesignSystemConfiguration.loadFonts()
        return true
    }
}
```

After that, SharpnezDesignSystem is totally ready for usage

## Usage

### SwiftUI and UIKit components and helpers

#### CGFloat Extensions

Some properties were implemented in the CGFloat object, most of which are multiple values ​​of 4 for better responsiveness, starting with 1, 2, 3, 4 and multiplying up to 80, helping to remove what we call HardCode

Example of usage

```swift
TextField("Title", text: $textFieldValue)
    .padding(.horizontal, .superLarge) /// 60.00
```

``.superLarge`` is a constant in CGFloat with value ``60.00`` and has the same usage for SwiftUI and UIKit frameworks

#### UIColor and Color

UIColor has an extension that implements some custom colors, but it also has a method that transforms hexadecimal colors into UIColors.

Example of usage of ``hexStringToUIColor`` method

```swift
public static var green75: UIColor {
    return hexStringToUIColor(hex: "#68C151")
}
```
Example of usage of this propertie

```swift
private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.text = "title"
    label.textColor = .green75
    return label
}()
```
Also there is a way to transform all UIColors in to SwiftUI.Color, like this

```swift
Text("Example of green")
    .foregroundColor(UIColor.green75.color)
```
Just use the propertie ``.color`` in the final of your UIColor sentence

#### UIFont and Font

Just remembering, to use the fonts you need to setup the SharpnezDesignSystem at the beginning of this document

UIFont has an extension that implements some custom fonts, the fonts are ``Poppins`` and ``Montserrat`` with their variations ``Regular``, ``Medium`` and ``Bold``, to implement them just follow the usage below

```swift
private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.text = "title"
    label.font = .title1(.poppins, .bold)
    return label
}()
```

Also there is a way to transform all UIFonts in to SwiftUI.Font, like this

```swift
Text("Hello World")
    .font(UIFont.title1(.poppins, .bold).font)
```
Just use the propertie ``.font`` in the final of your UIFont sentence

#### ViewStatus

ViewStatus is a simple object that was created to implements UIViewController and SwiftUI.View states, like this usage

```swift
switch viewStatus {
    case .success:
        Text("current status: success")
    case .loading:
        Text("current status: loading")
    case .none:
        Text("current status: none")
    case .error(let error):
        Text("current status: \(error)")
}
```
This object has the same usage for SwiftUI and UIKit frameworks

### UIKit Components and helpers

The components below are only available in UIKit framework

#### ViewCode

ViewCode is a simple protocol created to help to standardize UIView and UIViewController layout methods

The protocol

```swift
import UIKit

public protocol UIViewCode {
    
    func setup()
    func setupView()
    func setupBinding()
    func setupHierarchy()
    func setupConstraints()
}

public extension UIViewCode {
    
    func setup() {
        setupView()
        setupBinding()
        setupHierarchy()
        setupConstraints()
    }
    
    func setupBinding() { /* No Implementation */ }
}
```

implementation

```swift
import SharpnezDesignSystem
import UIKit

final class ViewController: UIViewController, UIViewCode {
    
    // MARK: - UI Elements
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: - View Life Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - View Setup
    
    func setupView() {
        title = "title"
        view.backgroundColor = .gray
    }
    
    func setupHierarchy() {
        view.addSubview(imageView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
```

#### MVVM-C architecture base components

#### UIBaseCoordinator

UIBaseCoordinator is a simple base coordinator created to help UIKit with MVVM-C projects. The object has 3 methos ``start()``, ``startChild()``, ``removeChild(animated: Bool = true)``

The method ``start()`` has no implementation and needs to be overrided

The method ``startChild()`` has your own implementation thas starts a child coordinator

The method ``removeChild(animated: Bool = true)`` has your own implementation thats remove the current coordinator

Example of usage

```swift
import SharpnezDesignSystem
import UIKit

final class HomeCoordinator: UIBaseCoordinator {
    
    override func start() {
        let controller = HomeFactory.configure { sample in
            self.navigateToSampleDetail(sample: sample)
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func navigateToSampleDetail(sample: UIViewController) {
        navigationController.pushViewController(sample, animated: true)
    }
}
```
#### UIMVVMBaseViewController

UIMVVMBaseViewController is a base UIViewController that takes a mandatory generic type which is known as the ViewModel

In the MVVM architecture, the UIViewController must receive only the ViewModel in its constructor, so this controller only forces it to initialize with the ViewModel

For now this controller only connects the points between the UIViewController and the ViewModel, but in the future it will have other features

Example of usage

```swift
import SharpnezDesignSystem
import UIKit

final class ViewController: UIMVVMBaseViewController<ViewModelProtocol> {
    
    // MARK: - UI Elements
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: - View Life Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.load()
    }
}
```

#### VIP-Clean architecture base components

#### UIVIPBaseViewController

UIVIPBaseViewController is a base UIViewController that takes 3 mandatory generic types which are known as CustomView that must be a ``UIView``, Interactor, Router

In the VIP-Clean architecture, the UIViewController must receive only these 3 parameters above in its constructor, so this controller only forces to initialize all of them

For now this controller only connects the points between the ViewController and these objects, but in the future it will have other features

Example of usage

```swift
import SharpnezDesignSystem
import UIKit

protocol VIPSceneViewControllerInput { }

final class VIPSceneViewController: UIVIPBaseViewController<VIPSceneView, VIPSceneInteractorInput, VIPSceneRouterInput> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "VIP Clean Scene"
    }
}

extension VIPSceneViewController: VIPSceneViewControllerInput { }
```

#### UIVIPInteractor

UIVIPInteractor is a base Interactor that takes a mandatory generic type known as Presenter

The Interactor can receive some parameters in its constructor in addition to the presenter, and its objective is to receive this data, store it and pass it on to the Presenter

Example of usage

```swift
import SharpnezDesignSystem
import Foundation

protocol VIPSceneInteractorInput { }

final class VIPSceneInteractor: UIVIPInteractor<VIPScenePresenterInput> { }

extension VIPSceneInteractor: VIPSceneInteractorInput { }
```

#### UIVIPPresenter

The UIVIPPresenter is an empty constructor object, it receives the UIViewController as a weak type, but it can only receive it after initialization,

Its job is to receive commands from the Interactor, apply the business rules and send them to the controller, so this base object just connects the dots

Example os usage

```swift
import SharpnezDesignSystem
import Foundation

protocol VIPScenePresenterInput { }

final class VIPScenePresenter: UIVIPPresenter<VIPSceneViewControllerInput> { }

extension VIPScenePresenter: VIPScenePresenterInput { }
```

#### UIVIPRouter

UIVIPRouter does not receive any generic type, it is just an object that has a weak type of the UINavigationController that must be inserted after its construction, its purpose is just to do the navigation in the VIP-Clean architecture

Example of usage

```swift
import SharpnezDesignSystem
import Foundation

protocol VIPSceneRouterInput {
    func navigateToSampleDetail()
}

final class VIPSceneRouter: UIVIPRouter { }

extension VIPSceneRouter: VIPSceneRouterInput {

    func navigateToSampleDetail() {
        navigationController?.pushViewController(UIViewController(), animated: true)
    }
}
```
