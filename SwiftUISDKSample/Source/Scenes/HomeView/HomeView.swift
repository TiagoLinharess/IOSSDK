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
