//
//  File.swift
//  
//
//  Created by Rezaul Islam on 18/10/24.
//

import Foundation
 
public struct BlogPost : Codable, Identifiable, Hashable{
    public let id : String
    public  let title : String
    public let content : String
    public let published : String
}
