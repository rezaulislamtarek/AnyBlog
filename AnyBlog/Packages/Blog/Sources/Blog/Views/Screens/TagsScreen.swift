//
//  TagsScreen.swift
//
//
//  Created by Rezaul Islam on 23/10/24.
//

import SwiftUI
import Utils

public struct TagsScreen: View {
    var tagViewModel = TagsViewModel()
    public init(){
        
    }
    public var body: some View {
        VStack(alignment:.leading){
            Text("Tags")
                .font(.title)
            ScrollView(showsIndicators: false , content: {
                Text("Discover content tailored to your interests. Select a tag below to explore blog posts on topics that matter to you.")
                    .font(.subheadline)
                    .opacity(0.7)
                
                tagGridSection
            })
            
        }
        .padding()
    }
}

extension TagsScreen {
    private var tagGridSection : some View{
        let columns = [
                GridItem(.flexible()),
                GridItem(.flexible())
            ]
       return  LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(tagViewModel.getTags(), id: \.self) { tag in
                            Text(tag)
                                .font(.headline)
                                .padding(.vertical, UIScreen.main.bounds.width / 4 - 32)
                                .frame(maxWidth: .infinity)
                                .background(getaRandomColor(opacity: 0.3))
                                .cornerRadius(24)
                                .bold()
                                //.foregroundColor(.white)
                        }
                    }
                     
    }
}

#Preview {
    TagsScreen()
}
