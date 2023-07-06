//
//  ApiSampleView.swift
//  SDKCoreSample
//
//  Created by Tiago Linhares on 04/07/23.
//

import SwiftUI
import SDKCore
import SDKCloud

struct ApiSampleView: View {
    
    // MARK: - Properties
    
    @StateObject private var appState: ApiSampleState
    private let interactor: ApiSampleInteractorInput
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            textField
            searchButton
            searchResult
            bottomSpacer
        }
    }
}

extension ApiSampleView {
    
    // MARK: - UI Elements
    
    @ViewBuilder var textField: some View {
        TextField("Enter repo name", text: $appState.textFieldValue)
            .autocorrectionDisabled(true)
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 60)
    }
    
    @ViewBuilder var searchButton: some View {
        Button("Search") {
            Task {
                await interactor.perform(repositoryName: appState.textFieldValue)
            }
        }
        .padding(.bottom, 40)
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
            .frame(width: 60, height: 60)
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
            .frame(height: 0)
    }
    
    @ViewBuilder func errorView(errorMessage: String) -> some View {
        Text(errorMessage)
    }
}
