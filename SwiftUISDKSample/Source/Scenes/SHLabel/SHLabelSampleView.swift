//
//  SHLabelSampleView.swift
//  SwiftUISDKSample
//
//  Created by Tiago Linhares on 26/07/23.
//

import DesignSystem
import SwiftUI

struct SHLabelSampleView: View {
    
    var body: some View {
        SHLabel(
            text: "Hello SHLabel",
            textColor: .blue100,
            font: .body(.poppins, .medium)
        )
        SHLabel(
            text: "Hello SHLabel",
            textColor: .red100,
            font: .caption(.montserrat, .bold)
        )
        SHLabel(
            text: "Hello SHLabel",
            textColor: .green100,
            font: .body(.poppins, .medium)
        ) {
            print("Hello SHLabel")
        }
    }
}
