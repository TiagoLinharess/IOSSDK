//
//  SampleItem.swift
//  SDKCoreSample
//
//  Created by Tiago Linhares on 04/07/23.
//

import SwiftUI

struct SampleItem: Identifiable {
    let id: UUID = .init()
    let view: any View
    let name: String
    
    static var samples: [SampleItem] = [
        .init(view: ApiSampleFactory.configure(), name: "ApiSampleView"),
        .init(view: ViewStatusSampleView(), name: "View Status Sample"),
        .init(view: ColorsFromHexView(), name: "Hex Colors"),
        .init(view: FontsView(), name: "Custom Fonts"),
        .init(view: SHLabelSampleView(), name: "SHLabel"),
        .init(view: SHButtonSampleView(), name: "SHButton")
    ]
}
