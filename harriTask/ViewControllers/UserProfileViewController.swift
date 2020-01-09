//
//  UserProfileViewController.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/24/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// User Profile View Controller Delegate
protocol UserProfileViewControllerDelegate {
    
    /**
     Reload Profile Table View
     */
    func updateProfileTableView()
}

/// User Profile View Controller
class UserProfileViewController: UIViewController {

    /// Profile Table View
    @IBOutlet weak var profileTableView: UITableView!
    
    /// User Info View Model
    var userInfoViewModel: UserInfoViewModel! = nil
    
    /// User ID
    var userID: Int = 0
    
    /// Status Bar View
    var statusBarView = UIView()
    
    /// Current User
    var currentUser: User?
    
    /**
     View Did Load
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userInfoViewModel = UserInfoViewModel(userProfileContent: nil, user: currentUser!)
        
        // Setup The Navigation Bar Title View
        setupNavigationBarTitleView()
        
        // Setup The Status Bar
        setupStatusBar()
        
        // Setup The Navigation Bar
        setupNavigationBar()
        
        // Setup User Profile Table View
        setupUserProfileTableView()
        
        // Request User Profile Data
        requestUserProfileData()
    }
    
    /**
     Setup Navigation Bar Title View
     */
    func setupNavigationBarTitleView(){
       
        let titleView = UserInfoViewModel.setupAnimatedTitleView()
        titleView.text = currentUser!.firstName + " " + currentUser!.lastName
        navigationItem.titleView = titleView
    }
    /**
     Setup Status Bar
     */
    func setupStatusBar(){
        
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size:CGSize(width: UIScreen.main.bounds.size.width, height: self.navigationController!.view.safeAreaInsets.top))
        statusBarView = UIView.init(frame: rect)
        self.view?.addSubview(statusBarView)
    }
    
    /**
     Setup Navigation Bar
     */
    func setupNavigationBar(){
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: 0)
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: 1)]
        
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    /**
     Setup User Profile Table View
     */
    func setupUserProfileTableView(){
        
        self.profileTableView.tableFooterView = UIView.init(frame: .zero)
        self.profileTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 60, right: 0)
        
    }
    
    /**
     Request User Profile Data
     */
    func requestUserProfileData(){
        
        NetworkManager.getUsersProfileInfo(userID: currentUser!.id) { (profileContent, error) in
            
            self.userInfoViewModel = UserInfoViewModel(userProfileContent: profileContent, user: self.currentUser!)
            self.userInfoViewModel!.buildAllCellsRepresentables()
            
            DispatchQueue.main.async {
                self.profileTableView.reloadData()
            }
        }
    }
}

/// User Profile View Controller
extension UserProfileViewController: UserProfileViewControllerDelegate {
    
    func updateProfileTableView() {
        
        profileTableView.beginUpdates()
        profileTableView.endUpdates()
    }
}
