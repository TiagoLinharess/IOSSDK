//
//  SDKCloudConfiguration.swift
//  SDKCore
//
//  Created by Tiago Linhares on 04/07/23.
//

import Foundation

// MARK: - SDKCloudConfiguration

/// SDKCloud main Configuration.
public final class SDKCloudConfiguration: NSObject {
    
    // MARK: - Singleton
    
    /// SDKCloud Singleton.
    public static let shared = SDKCloudConfiguration()
    
    // MARK: - BaseUrl
    
    /// This property is used to create the URL for request.
    /// This is not opcional don't use it when using SDKCloud.
    /// Don't using it will return this error "ApiError.customError("No Available URL")".
    public var baseUrl: String?
}
