//
//  HomeViewModel.swift
//  UIKitSDKSample
//
//  Created by Tiago Linhares on 10/07/23.
//

import Foundation

protocol HomeViewModelProtocol {
    
    var samples: [SampleItem] { get }
    
    func didSelectSample(at index: Int)
}

final class HomeViewModel: HomeViewModelProtocol {
    
    let samples: [SampleItem] = SampleItem.samples
    
    var onSelectSample: ((SampleItem) -> Void)?
    
    func didSelectSample(at index: Int) {
        let sample = samples[index]
        onSelectSample?(sample)
    }
}
