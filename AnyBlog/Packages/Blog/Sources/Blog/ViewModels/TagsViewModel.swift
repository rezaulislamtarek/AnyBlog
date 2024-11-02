//
//  File.swift
//  
//
//  Created by Rezaul Islam on 2/11/24.
//

import Foundation

final class TagsViewModel : ObservableObject{ 
    func getTags() -> [String]{
        let tags = ["iOS", "Swift", "UIKit", "UITableView", "Kotlin", "OOP", "Combine", "Android", "SQA"]
        return tags
    }
}
