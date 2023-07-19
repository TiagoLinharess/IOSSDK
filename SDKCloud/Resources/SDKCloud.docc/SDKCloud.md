# SharpnezCloud

![Build Status](https://api.travis-ci.com/TiagoLinharess/SharpnezCloud.svg)
![Platform](https://img.shields.io/cocoapods/p/SharpnezCloud.svg?style=flat)
![Cocoapods Compatible](https://img.shields.io/cocoapods/v/SharpnezCloud.svg)

## What is?
### SharpnezCloud is a cloud module for iOS development. Delivers objects aimed at HTTPS requests, such as errors, error converter and asynchronous methods for requests.

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
pod 'SharpnezCloud', '~> 1.0.0'
```
Then, run the following command:

```bash
$ pod install
```
## Setup Module

At frist, in your AppDelegate or in another file that is used before your HTTPS request, setup your base URL in SharpnezCloud

```swift
import SharpnezCloud
import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        SDKCloudConfiguration.shared.baseUrl = "https://your.api.com"
        return true
    }
}
```

After that, the SharpnezCloud is ready for usage

## Usage

### ApiProvider

ApiProvider is the class responsible for performing the HTTPS call, in its execution, it either returns a Data object that has a JSON content, or throws an Error object called ApiError

Example of implementation

```swift
public func perform<Response: Decodable>(_ type: Response.Type, request: ApiRequestInput) async throws -> Response {
    let data = try await ApiProvider().callMethod(request: request)
    let response = try JSONDecoder().decode(Response.self, from: data)
    return response
}
```

### ApiWorker

ApiWorker is the class responsible for, in addition to performing the HTTPS request, it returns the object that conforms to the already mapped Decodable, or throws an Error object called ApiError

Example of implementation

```swift
import Foundation
import SharpnezCloud

final class ApiSampleWorker {
    
    private let worker: ApiWorkerInput
    
    init(worker: ApiWorkerInput = ApiWorker()) {
        self.worker = worker
    }
    
    func searchRepository(with name: String) async throws -> Repository.Response {
        let request = ApiRequest<ApiEmptyRequest>(method: .get, endpoint: "/repos/\(name)", headers: nil, data: nil)
        return try await worker.perform(Repository.Response.self, request: request)
    }
}
```

### ApiError

ApiError is an object that extends Foundation.Error to be able to simply and clearly deliver an error in an HTTPS request

ApiError has 3 options of erros

* genericError
* httpError(Data, Int)
* customError(String)

### parseError

parseError is a method that is part of Foundation.Error that turns your raw Error into an object called HttpErrorResponse<T>, which takes a generic object to map your error object

If the response is not available, will return a ``ApiError.genericError``

Example of implementation

```swift
func presentError(error: Error) {
    DispatchQueue.main.sync {
        let errorResponse = error.parseError(Repository.ResponseError.self)
        self.appState.viewStatus = .error(errorResponse.response?.message ?? errorResponse.defaultMessage)
    }
}
```
