//
//  ViewStatusSampleView.swift
//  SwiftUISDKSample
//
//  Created by Tiago Linhares on 11/07/23.
//

import SDKCore
import SwiftUI

struct ViewStatusSampleView: View {
    
    @State var viewStatus: ViewStatus = .none
    
    var body: some View {
        status
        Spacer()
        Button("Change to success") {
            viewStatus = .success
        }
        Spacer()
        Button("Change to error") {
            viewStatus = .error("error message")
        }
        Spacer()
        Button("Change to loading") {
            viewStatus = .loading
        }
        Spacer()
        Button("Change to none") {
            viewStatus = .none
        }
        Spacer()
    }
    
    @ViewBuilder var status: some View {
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
    }
}
