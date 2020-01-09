//
//  UsersViewModel.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/3/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit
import JNAvatarWithInitials

/// Users View Model
class UsersViewModel {
    
    /// Navigation Bar Title
    var navigationBarTitle: String = "Harri"
    
    /// Navigation Bar Color
    var navigationBarColor: UIColor = UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: 1)
    
    /// Navigation Bar Title Attributes
    var navigationBarTitleAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    
    /// Navigation Bar Tint Color
    var navigationBarTintColor = UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: 1)
    
    /// Refresh Control Tint Color
    var refreshControlTintColor = UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: 0.5)
    
    /// Users
    private var users: [User]
    
    /// Representables
    private var representables: [TableViewCellRepresentable]
    
    /// Hits
    private var hits: Int
    
    /**
     Table View Header
     */
    private var tableViewHeader: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 50))
    
    /**
     Initializer
     */
    init(users: [User]) {
        self.representables = []
        self.users = users
        self.hits = 0
    }
    /**
     Add To Users
     */
    func addToUsers(newUsers: [User], hits: Int){
        self.users += newUsers
        self.hits = hits
    }
    /**
     Remove All Users
     */
    func removeAllUsers(){
        self.users.removeAll()
        self.representables.removeAll()
    }
    /**
     Build Representables
     */
    func buildRepresentables(numberOfNewUsers: Int){
        for eachUser in users[users.count - numberOfNewUsers..<users.count] {
            let representable = MainCellRepresentables(user: eachUser)
            representables.append(representable)
        }
    }
    /**
     Loading View For Footer
     */
    func loadingViewForFooter() -> UsersTableFooterView {
        
        return UsersTableFooterView()
    }
    
    /**
     Get Cells Representables Count
     */
    func getCellRepresentablesCount() -> Int {
        return representables.count
    }
    
    /**
     Get Representable At Index
     */
    func getRepresentableAt(index: Int) -> TableViewCellRepresentable {
        return representables[index]
    }
    
    /**
     Get Hits Count
     */
    func getHitsCount() -> Int {
        return hits
    }
    
    /**
     Get User At Index
     */
    func getUserAt(index: Int) -> User {
        return users[index]
    }
    
    /**
     Height For Loading Footer View
     */
    func heightForLoadingFooterView() -> CGFloat {
        return 50
    }
    /**
     Table Header View
     */
    func tableHeaderView() -> UIView {
        return tableViewHeader
    }

}
