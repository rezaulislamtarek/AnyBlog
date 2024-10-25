//
//  SwiftUIView.swift
//  
//
//  Created by Rezaul Islam on 25/10/24.
//

import SwiftUI
import Utils

struct ThumbnilView: View {
    let image : String?
    let text : String?
    
    let width : CGFloat
    let height : CGFloat
    let alignment : Alignment
    
    var body: some View {
        Text(text ?? "")
            .padding()
            .frame(width: width, height: height, alignment: alignment)
            .background(
                RoundedRectangle(cornerRadius: 12.0, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                    .fill(
                        LinearGradient(gradient: Gradient(colors: getTwoRandomColors(opacity: 0.1)), startPoint: .bottomLeading, endPoint: .topTrailing)
                             
                    )
            )
    }
}

#Preview {
    ThumbnilView(image: nil, text: "Thumbnil", width: 250, height: 100, alignment: .leading)
        
}
