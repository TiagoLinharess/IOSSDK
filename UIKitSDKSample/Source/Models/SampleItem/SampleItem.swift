//
//  SampleItem.swift
//  UIKitSDKSample
//
//  Created by Tiago Linhares on 11/07/23.
//

import UIKit

struct SampleItem {
    let controller: UIViewController
    let name: String
    
    static var samples: [SampleItem] = [
        .init(controller: UIImageFromURLFactory.configure(), name: "UIImageView from url"),
    ]
}
