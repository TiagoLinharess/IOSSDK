//
//  ApiSampleView.swift
//  SDKCoreSample
//
//  Created by Tiago Linhares on 04/07/23.
//

import DesignSystem
import SDKCore
import SwiftUI

struct ApiSampleView: View {
    
    // MARK: - Properties
    
    @StateObject var appState: ApiSampleState
    let interactor: ApiSampleInteractorInput
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            header
            textField
            searchButton
            searchResult
            bottomSpacer
        }
    }
}

extension ApiSampleView {
    
    // MARK: - UI Elements
    
    @ViewBuilder var header: some View {
        Text("This sample are available in UIKit or SwiftUI Frameworks, check the docs.")
        Spacer()
    }
    
    @ViewBuilder var textField: some View {
        TextField("Enter repo name", text: $appState.textFieldValue)
            .autocorrectionDisabled(true)
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, .superLarge)
    }
    
    @ViewBuilder var searchButton: some View {
        Button("Search") {
            Task {
                await interactor.perform(repositoryName: appState.textFieldValue)
            }
        }
        .padding(.bottom, .superBig)
    }
    
    @ViewBuilder var bottomSpacer: some View {
        Spacer()
    }
    
    @ViewBuilder var searchResult: some View {
        switch appState.viewStatus {
        case .success:
            successView
        case .none:
            noneView
        case .loading:
            loadingView
        case let .error(error):
            errorView(errorMessage: error)
        }
    }
    
    @ViewBuilder var successView: some View {
        if let repository = appState.repository {
            AsyncImage(url: repository.imageUrl) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                loadingView
            }
            .frame(width: .superLarge, height: .superLarge)
            Text(repository.name)
        } else {
            errorView(errorMessage: "No data")
        }
    }
    
    @ViewBuilder var loadingView: some View {
        ProgressView()
    }
    
    @ViewBuilder var noneView: some View {
        Spacer()
            .frame(height: .zero)
    }
    
    @ViewBuilder func errorView(errorMessage: String) -> some View {
        Text(errorMessage)
    }
}
