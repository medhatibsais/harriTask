//
//  UserInfoViewModel.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/24/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// User Info View Model
class UserInfoViewModel {
    
    /// User
    private var user: User
    
    /// User Profile Content
    private var userProfileContent: UserProfileContent?
    
    /// User Experience Cell Representable
    private var userExperienceCellRepresentable: [ExperienceCellRepresentablesProtocol]
    
    /// Skill Cell Representable
    private var skillCellRepresentable: [UserProfileSkillsRepresentables]
    
    /// User Availability
    private var userAvailability: [String]
    
    /// All Representables
    private var allRepresentables: [Any] = [Any]()
    
    /**
     Initializer
     */
    init(userProfileContent: UserProfileContent?, user: User) {
        self.user = user
        self.userProfileContent = userProfileContent
        self.userExperienceCellRepresentable = []
        self.skillCellRepresentable = []
        self.allRepresentables = []
        self.userAvailability = []
    }
    
    /**
     Build All Cells Representables
     */
    func buildAllCellsRepresentables(){
        
        buildImageCellRepresentables()
        buildAboutCellRepresentables()
        buildExperienceCellRepresentables()
        buildSkillsRepresentables()
        buildAvailabilityRepresentables()
    }
    
    /**
     Build Image Cell Representables
     */
    private func buildImageCellRepresentables(){
        
        let imageCellRepresentable = ImageCellRepresentablesImplementation(userProfile: userProfileContent!, user: user)
        self.allRepresentables.append(imageCellRepresentable)
    }
    
    /**
     Build About Cell Representables
     */
    private func buildAboutCellRepresentables() {
        let aboutCellRepresentable = AboutCellRepresentablesImplementation(aboutUser: userProfileContent!.user_info.about ?? "")
        self.allRepresentables.append(aboutCellRepresentable)
    }
    
    /**
     Build Experience Cell Representables
     */
    private func buildExperienceCellRepresentables(){
        
        self.userExperienceCellRepresentable = []
        for eachExperience in self.userProfileContent!.experience {
        let experienceRepresentables = ExperienceCellRepresentablesImplementation(userExperience: eachExperience)
            userExperienceCellRepresentable.append(experienceRepresentables)
        }
        self.allRepresentables.append(userExperienceCellRepresentable)
    }
    
    /**
     Build Skills Representables
     */
    private func buildSkillsRepresentables(){
        
        self.skillCellRepresentable = []
        
        for eachSkill in self.userProfileContent!.user_skill {
            let userSkillCellRepresentable = UserProfileSkillsImplementation(userSkill: eachSkill)
            skillCellRepresentable.append(userSkillCellRepresentable)
        }
        
        self.allRepresentables.append(skillCellRepresentable)
    }
    
    /**
     Build Availability Representables
     */
    private func buildAvailabilityRepresentables(){

        let availabilityCellRepresentable = UserProfileAvailabilityImplemetation(userAvailability: userProfileContent!.availability)
        
        self.userAvailability = availabilityCellRepresentable.availabilityText

        self.allRepresentables.append(availabilityCellRepresentable)
    }
    
    /**
     Check List With Label
     */
    func checkListWithLabel(labelValueIndex: Int,sectionNumber: Int) -> CheckListView {
        
        let checkListView = CheckListView()
        
        switch sectionNumber {
        case 3:
            checkListView.skillLabel.text = skillCellRepresentable[labelValueIndex].skillText
            return checkListView
        default:
            checkListView.skillLabel.text = userAvailability[labelValueIndex]
            return checkListView
        }
    }
    
    
    /**
     Number Of Rows In Table View
     */
    func numberOfRowsInTableView(sectionNumber: Int) -> Int {
        return sectionNumber == 2 ? userExperienceCellRepresentable.count : 1
    }
    
    /**
     Number Of Items
     */
    func numberOfItems(sectionNumber: Int) -> Int {
        
        switch sectionNumber {
        case 3:
            return skillCellRepresentable.count
        default:
            return userAvailability.count
        }
        
    }
    
    /**
     Get All Cells Representables Count
     */
    func getAllCellsRepresentablesCount() -> Int {
        return allRepresentables.count
    }
    
    /**
     Get Image Cell Representable
     */
    func getImageCellRepresentable(sectionNumber: Int) -> ImageCellRepresentablesProtocol{
        return allRepresentables[sectionNumber] as! ImageCellRepresentablesProtocol
    }
    
    /**
     Get About User Cell Representable
     */
    func getAboutUserCellRepresentable(sectionNumber: Int) -> AboutCellRepresentables {
        return allRepresentables[sectionNumber] as! AboutCellRepresentables
    }
    
    /**
     Get Experience User Cell Representable
     */
    func getExperienceUserCellRepresentable(indexPath: IndexPath) -> ExperienceCellRepresentablesProtocol {
        let allUserExperience = allRepresentables[indexPath.section] as! [ExperienceCellRepresentablesProtocol]
        return allUserExperience[indexPath.row]
    }
    
    /**
     Get Experience Cell Representables Count
     */
    func getExperienceCellRepresentablesCount(sectionNumber: Int) -> Int {
        let allUserExperience = allRepresentables[sectionNumber] as! [ExperienceCellRepresentablesProtocol]
        return allUserExperience.count
    }
    
    /**
     Get Skills Or Availability Text
     */
    func getSkillsOrAvailabilityText(sectionNumber: Int, itemIndex: Int) -> String {
        
        switch sectionNumber {
        case 3:
            return skillCellRepresentable[itemIndex].skillText
        default:
            return userAvailability[itemIndex]
        }
    }
    
    /**
     Header Table View
     */
    func headerTableView(sectionNumber: Int) -> UILabel? {
        
        let label = UILabel()
        label.textAlignment = .center
        
        switch sectionNumber {
            case 1:
                label.text = "About"
            case 2:
                label.text = "Experience"
            case 3:
                label.text = "Skills"
            case 4:
                label.text = "Availability"
        default:
            return nil
        }
        return label
    }
    
    /**
     Setup Animated Title View
     */
    static func setupAnimatedTitleView() -> AnimatedTitleView {
        return AnimatedTitleView(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
    }
    
    /// Navigation Title
    var navigationTitle: NSMutableAttributedString {
        
        let attributedString = NSMutableAttributedString(string: user.firstName + " ", attributes: [NSMutableAttributedString.Key.font: UIFont(name: "OpenSans", size: 14)!,NSMutableAttributedString.Key.foregroundColor: UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: 1)])
        
        attributedString.append(NSMutableAttributedString(string: user.lastName, attributes: [NSMutableAttributedString.Key.font: UIFont(name: "OpenSans", size: 14)!,NSMutableAttributedString.Key.foregroundColor: UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: 1)]))
        
        
        return attributedString
    }
    
}
