//
//  File.swift
//  
//
//  Created by Rezaul Islam on 15/11/24.
//

import Foundation
import XCTest
@testable import Blog
import TestUtilities
import EasyNet

final class BlogTestUtil {
    
   static func loadJSON(filename: String) -> Data? {
        
        if let url = Bundle.module.url(forResource: filename, withExtension: "json") {
            print("Found URL: \(url)")
            do {
                return try Data(contentsOf: url)
            } catch {
                //XCTFail("Failed to load JSON from \(url): \(error)")
            }
        } else {
            //XCTFail("Failed to locate \(filename).json in test bundle")
        }
        return nil
    }
}
