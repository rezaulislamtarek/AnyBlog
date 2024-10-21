//
//  SwiftUIView.swift
//  
//
//  Created by Rezaul Islam on 22/10/24.
//

import SwiftUI
import CommonComponent

public struct BlogPostDetailsScreen: View {
    let post : BlogPost
    
    public init(post: BlogPost) {
        self.post = post
    }
    
    public var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(alignment: .leading, spacing: 16){
                Text(post.title)
                    .padding()
                    .font(.title)
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .background(.green.opacity(0.1))
                    .multilineTextAlignment(.center)
                    .cornerRadius(16)
                
                RichWebView(htmlContent: post.content)
                   
            }
        })
        .navigationTitle(post.title)
        .padding()
    }
}

#Preview {
    BlogPostDetailsScreen(post: BlogPost(id: "123", title: "title", content: "content", published: "12-12-2023"))
}
