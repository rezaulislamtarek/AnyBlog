//
//  File.swift
//  
//
//  Created by Rezaul Islam on 18/10/24.
//

import Foundation
 
struct BlogPost : Codable, Identifiable{
    let id  : String
    let title : String
    let content : String
    let published : String
}
