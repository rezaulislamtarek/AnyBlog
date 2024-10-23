//
//  File.swift
//  
//
//  Created by Rezaul Islam on 23/10/24.
//

import Foundation

extension String {
    public func toReadableDate() -> String {
        let dateFormatter = ISO8601DateFormatter()
        // Parse the string into a Date object
        guard let date = dateFormatter.date(from: self) else { return self }
        
        let outputFormatter = DateFormatter()
        // Set the desired output format
        outputFormatter.dateFormat = "dd MMM, yyyy"
        // Convert the Date object back to a string with the desired format
        return outputFormatter.string(from: date)
    }
}
