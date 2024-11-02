//
//  TagsScreen.swift
//
//
//  Created by Rezaul Islam on 23/10/24.
//

import SwiftUI
import Utils
import Router

public struct TagsScreen: View {
    @EnvironmentObject private var router : Router
    var tagViewModel = TagsViewModel()
    public init(){
        
    }
    public var body: some View {
        VStack(alignment:.leading){
            Text("Tags")
                .bold()
                .font(.system(size: 32, weight: .bold, design: .rounded))
            ScrollView(showsIndicators: false , content: {
                VStack(alignment: .leading, content: {
                    Text("Discover content tailored to your interests. Select a tag below to explore blog posts on topics that matter to you.")
                        .font(.system(size: 16, weight: .none, design: .rounded))
                        .opacity(0.7)
                    
                    tagGridSection
                })
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
                                .bold()
                                .font(.system(size: 16, weight: .bold, design: .rounded))
                                .padding(.vertical, UIScreen.main.bounds.width / 4 - 32)
                                .frame(maxWidth: .infinity)
                                .background(getaRandomColor(opacity: 0.2))
                                .cornerRadius(24)                                .onTapGesture {
                                    router.navigate(to: BlogRoutes.blogList(tag: tag))
                                }
                                
                        }
                    }
                     
    }
}

#Preview {
    TagsScreen()
}
