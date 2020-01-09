//
//  SearchUsersRouter.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/18/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit
import Alamofire

/// Search Users Router
enum SearchUsersRouter: URLRequestConvertible {
    
    static let searchUsersURL = "https://api.harridev.com/api/v1/harri_search/search_users"
    case searchWithParams(Parameters)
    
    static let useProfileInfoLink: String = "https://api.harridev.com/api/v1/profile/member/"
    case requestInfoWithID(Int)

    /**
     As URL Request
     */
    func asURLRequest() throws -> URLRequest {
        
            // Decide the HTTP Method
            var method: HTTPMethod {
                switch self {
                case .searchWithParams:
                    return .post
                case .requestInfoWithID:
                    return .get
                }
        }
        
        // Set The HTTP Body Parameters According to the passed value from Network Manager
        let parameters: Parameters = {
                switch self {
                case .searchWithParams(let params):
                    return params
                case .requestInfoWithID:
                    return [:]
            }
        }()
        
        // Set The Proper URL
        let urlToRequest: String = {
           
            switch self {
            case .requestInfoWithID(let userID):
                return SearchUsersRouter.useProfileInfoLink + userID.description
            case .searchWithParams:
                return SearchUsersRouter.searchUsersURL
            }
            
        }()
        
        // Set the URL Request
        let url = URL(string: urlToRequest)
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = method.rawValue
        
        // check if request needs a body data
        let needBody: Bool = {
            
            switch self {
            case .requestInfoWithID:
                return false
            case .searchWithParams:
                return true
            }
        }()
        
        
        // Encode The Body Parameters With The URL Request
        let encoding = JSONEncoding.default
        
        if needBody {
            return try encoding.encode(urlRequest,with: parameters)
        }
        
        else {
            return urlRequest
        }
        
        
    }
}
