//
//  HomeView.swift
//  SDKCoreSample
//
//  Created by Tiago Linhares on 04/07/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Some samples are available in UIKit and SwiftUI Frameworks, more details in docs or sample details.")
                ForEach(SampleItem.samples) { sample in
                    NavigationLink {
                        AnyView(sample.view)
                    } label: {
                        Text(sample.name)
                    }
                    .navigationTitle("Samples")
                }
            }
        }
    }
}
