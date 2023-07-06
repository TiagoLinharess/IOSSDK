//
//  Repository.swift
//  SDKSample
//
//  Created by Tiago Linhares on 05/07/23.
//

import Foundation

enum Repository {
    
    struct Response: Decodable {
        
        let name: String?
        let owner: Owner?
    }
    
    struct ResponseError: Decodable {
        let message: String?
    }
    
    struct ViewModel {
        
        let name: String
        let imageUrl: URL?
        
        init(from response: Response) {
            self.name = response.name ?? String()
            self.imageUrl = URL(string: response.owner?.imageUrlString ?? String())
        }
    }
}

extension Repository.Response {
    
    struct Owner: Decodable {
        
        enum CodingKeys: String, CodingKey {
            case imageUrlString = "avatar_url"
        }
        
        let imageUrlString: String?
    }
}
