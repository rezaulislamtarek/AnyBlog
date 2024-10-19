//
//  SwiftUIView.swift
//
//
//  Created by Rezaul Islam on 18/10/24.
//

import SwiftUI

public struct BlogPostScreen: View {
    @StateObject private var blogVm = BlogPostViewModel(repo: BlogPostRepositoryImp())
    public init(){}
    public var body: some View {
        
        VStack(alignment: .leading ) {
            ScrollView(.vertical,showsIndicators: false) {
                VStack(alignment: .leading ){ 
                    LazyVStack(spacing: 16 ){
                        ForEach(blogVm.blogPosts) { post in
                            BlogRowView(post: post)
                                .padding(.horizontal)
                                .onAppear{
                                    if blogVm.blogPosts.last?.id == post.id{
                                        print("next page call")
                                         blogVm.getBlogPosts()
                                         
                                    }
                                }
                        }
                    }
                    
                }
                .padding(.bottom,90)
                .offset(y: 90)
            }
            .overlay(alignment: .top, content: {
                Text("iOS Blogs")
                    .font(.largeTitle)
                    .padding()
                    .frame(maxWidth: .infinity, alignment:.leading)
                    .background(.thinMaterial)
            })
            .onAppear{
                print("Blog Screen Appeared")
                blogVm.getBlogPosts()
        }
        }
    }
}

#Preview {
    BlogPostScreen()
}

struct ThumbnilView: View {
    let image : String?
    let text : String?
    
    var body: some View {
        Text(text ?? "")
            .font(.caption)
            .padding()
            .frame(width: 140, height: 100, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 12.0, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [.green.opacity(0.3),  .gray.opacity(0.2)]), startPoint: .bottomLeading, endPoint: .topTrailing)
                        
                            .opacity(0.5)
                    )
            )
    }
}

struct BlogRowView: View {
    let post : BlogPost
    
    var body: some View {
        HStack {
            ThumbnilView(image: nil, text: post.title)
            Text(post.title)
                .lineLimit(2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
