//
//  SwiftUISDKSampleApp.swift
//  SwiftUISDKSample
//
//  Created by Tiago Linhares on 05/07/23.
//

import SwiftUI

@main
struct SwiftUISDKSampleApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .task {
                    AppStart.setupApp()
                }
        }
    }
}
