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
    public let author : Author
    public let labels : [String]
    public let replies : Replies
    
}


public struct Author : Codable, Hashable{
    public let id: String
    public let displayName  : String
    public let image : ImageResource?
}


public struct ImageResource : Codable, Hashable{
    public let url : String?
}

public struct Replies : Codable, Hashable{
    public let totalItems : String
}
