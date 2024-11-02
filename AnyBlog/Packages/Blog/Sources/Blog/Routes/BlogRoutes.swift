//
//  File.swift
//  
//
//  Created by Rezaul Islam on 21/10/24.
//

import Foundation

public enum BlogRoutes : Hashable{
    case blogList(tag : String?)
    case blogDetails(post : BlogPost)
}
 
