// The Swift Programming Language
// https://docs.swift.org/swift-book


import SwiftUI


let colors: [Color] = [
        .red, .blue, .green, .yellow, .orange, .purple, .pink, .gray, .brown
    ]
// Utility function to get two different random colors
public func getTwoRandomColors(opacity : Double) -> [Color] {
    let shuffledColors = colors.shuffled() // Shuffle the array
    return [shuffledColors[0].opacity(opacity), shuffledColors[1].opacity(opacity)] // Return the first two different colors
}

// Utility function to get two different random colors
public func getaRandomColor(opacity : Double) -> Color {
  
    let shuffledColors = colors.shuffled() // Shuffle the array
    return shuffledColors[0].opacity(opacity)
}
