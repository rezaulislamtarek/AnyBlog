//
//  File.swift
//  
//
//  Created by Rezaul Islam on 19/10/24.
//

import Foundation

struct BlogPostResponse : Codable {
    let nextPageToken : String?
    let items : [BlogPost]?
}


