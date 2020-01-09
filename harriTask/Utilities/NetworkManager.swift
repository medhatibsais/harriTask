//
//  NetworkManager.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/16/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit
import Alamofire

/// Network Manager
class NetworkManager {
    
    /**
     Get Data ( Get Users Data Method with Completion Handler )
     */
    static func getData(httpBodyParameters: Parameters,userCompletionHandler: @escaping ([User],Int, Error?) -> Void){
        
        /// Alamofire Search For Users Request
        Alamofire.request(SearchUsersRouter.searchWithParams(httpBodyParameters)).responseJSON { (response) in
            
            do {
                let dataRecieved = try JSONDecoder().decode(UserSearchDataResponse.self, from: response.data!)
                userCompletionHandler(dataRecieved.data.results,dataRecieved.data.hits,nil)
            }
            catch let theError {
                userCompletionHandler([],0,theError)
            }
        }
    }
    
    /**
     Get Users Profile Info
     */
    static func getUsersProfileInfo(userID: Int, userProfileInfoCompletion: @escaping (UserProfileContent,Error?) -> Void){
      
        /// Alamofire Requesrt User Profile Data
        Alamofire.request(SearchUsersRouter.requestInfoWithID(userID)).responseJSON { (userInfo) in
            
            do {
                let dataRecieved = try JSONDecoder().decode(UserProfileData.self, from: userInfo.data!)
                userProfileInfoCompletion(dataRecieved.data, nil)
            }
            catch let error {
                print(error)
            }
        }
        
    }
}
