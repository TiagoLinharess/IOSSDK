//
//  FontsView.swift
//  SwiftUISDKSample
//
//  Created by Tiago Linhares on 13/07/23.
//

import DesignSystem
import SwiftUI

struct FontsView: View {
    var body: some View {
        ScrollView {
            Text("This sample are available in UIKit an SwiftUI Frameworks, check the docs.")
            Spacer()
            VStack {
                Text("Hello World")
                    .font(UIFont.title1(.roboto, .bold).font)
                Text("Hello World")
                    .font(UIFont.title2(.roboto, .medium).font)
                Text("Hello World")
                    .font(UIFont.title3(.roboto, .regular).font)
                Text("Hello World")
                    .font(UIFont.subtitle(.roboto, .bold).font)
                Text("Hello World")
                    .font(UIFont.body(.roboto, .medium).font)
                Text("Hello World")
                    .font(UIFont.caption(.roboto, .regular).font)
            }
            VStack {
                Text("Hello World")
                    .font(UIFont.title1(.montserrat, .bold).font)
                Text("Hello World")
                    .font(UIFont.title2(.montserrat, .medium).font)
                Text("Hello World")
                    .font(UIFont.title3(.montserrat, .regular).font)
                Text("Hello World")
                    .font(UIFont.subtitle(.montserrat, .bold).font)
                Text("Hello World")
                    .font(UIFont.body(.montserrat, .medium).font)
                Text("Hello World")
                    .font(UIFont.caption(.montserrat, .regular).font)
            }
            Spacer()
        }
    }
}
