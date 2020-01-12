//
//  UsersTableViewController.swift
//  harriTask
//
//  Created by Medhat Ibsais on 10/14/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit
import JNAvatarWithInitials
import Alamofire

/// Users Table View Controller
class UsersTableViewController: UIViewController {

    /// Users Table
    @IBOutlet var usersTable: UITableView!
    
    /// Refresh Control View
    var refreshControlView = UIRefreshControl()
    
    /// Start Point
    var startPoint = 0
    
    /// Is Refreshing
    var isRefreshing: Bool = false
    
    /// Users View Model
    var usersViewModel: UsersViewModel = UsersViewModel(users: [])
    
    /**
     Initializer
     */
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    /**
     Initializer
     */
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size:CGSize(width: UIScreen.main.bounds.size.width, height: self.navigationController!.view.safeAreaInsets.top))
        let topView = UIView.init(frame: rect)
        topView.layer.zPosition = 1
        topView.backgroundColor = UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: 1)
        self.view?.addSubview(topView)
        
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        setupNavigationBar()
    }

    /**
     View Did Load
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set The Users Table Footer View To Zero Frame
        self.usersTable.tableFooterView = UIView.init(frame: .zero)
        
        // setup the navigation bar
        setupNavigationBar()
        
        // setup the table refresh control
        setupTableRefreshContol()
        
        // request the users
        requestUsersData()
    }
    
    /**
    Setup Navigation Bar
     */
    func setupNavigationBar(){
        navigationItem.title = usersViewModel.navigationBarTitle
        navigationController?.navigationBar.backgroundColor = usersViewModel.navigationBarColor
        navigationController?.navigationBar.titleTextAttributes = usersViewModel.navigationBarTitleAttributes
        navigationController?.navigationBar.barTintColor = usersViewModel.navigationBarTintColor
    }
    
    /**
     Setup Table Refresh Contol
     */
    func setupTableRefreshContol(){
        refreshControlView.tintColor = usersViewModel.refreshControlTintColor
        refreshControlView.addTarget(self, action: #selector(refreshPage), for: .valueChanged)
        usersTable.refreshControl = refreshControlView
    }
    
    /**
     Setup Table View Footer
     */
    func setupTableViewFooter(){
        
        // get loading view for footer
        let tableFooterView = self.usersViewModel.loadingViewForFooter()
        
        // set the frame for the loading footer view
        tableFooterView.frame = CGRect(x: 0, y: 0, width: usersTable.frame.width, height: usersViewModel.heightForLoadingFooterView())
        
        // set this view to users table footer view
        self.usersTable.tableFooterView = tableFooterView
    }
    /**
     Load More Data
     */
    func loadMoreData(){
        startPoint += StaticValues.sizeOfRequestedData
        requestUsersData()
    }
    
    /**
     Request Users Data
     */
    func requestUsersData(){
        
        if !isRefreshing {
            // Setup Table View Footer
            setupTableViewFooter()
        }
        /// Parameters
        let parameters: Parameters = ["size": StaticValues.sizeOfRequestedData,"start": startPoint, "locations": StaticValues.locations]
        
        // Get Users Data Using Network Manager
        NetworkManager.getData(httpBodyParameters: parameters) { (users, hits, err) in
            
            if self.isRefreshing {
                
                // Return The Is Refreshing To False
                self.isRefreshing = false
                
                // Remove All The Users And Representables In Users Model
                self.usersViewModel.removeAllUsers()
                
                // End The Refreshing of Refresh Control View
                self.refreshControlView.endRefreshing()
            }
            
            // Add returned users to users array in view model
            self.usersViewModel.addToUsers(newUsers: users,hits: hits)
            
            // call the build representables method with specified starting index
            self.usersViewModel.buildRepresentables(numberOfNewUsers: StaticValues.sizeOfRequestedData)
            
            // Reload table view and reset the table view footer in main thread
            DispatchQueue.main.async {
                self.usersTable.tableFooterView = UIView.init(frame: .zero)
                self.usersTable.reloadData()
            }
        }
    }
    
    /**
     Refresh Page
     */
    @objc func refreshPage(){
        
        // Set Is Refreshing Property To True
        isRefreshing = true
        
        // setting table view header
        usersTable.tableHeaderView = usersViewModel.tableHeaderView()

        // change the start point to 0 and reload the table view
        startPoint = 0
        
        // Request The Users Data
        requestUsersData()
    }
    
    /// Change The Status Bar Style To Light Content
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
}
