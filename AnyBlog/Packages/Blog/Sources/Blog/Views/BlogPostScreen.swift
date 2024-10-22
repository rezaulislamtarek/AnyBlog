//
//  SwiftUIView.swift
//
//
//  Created by Rezaul Islam on 18/10/24.
//

import SwiftUI
import Router

public struct BlogPostScreen: View {
    @StateObject private var blogVm = BlogPostViewModel(repo: BlogPostRepositoryImp())
    @EnvironmentObject private var router : Router
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
                                .onTapGesture {
                                    router.navigate(to: BlogRoutes.blogDetails(post: post))
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
        .environmentObject(Router())
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
            VStack (alignment:.leading) {
                Text(post.published.toReadableDate())
                    .font(.caption2)
                    .foregroundStyle(.gray)
                Text(post.title)
                    .lineLimit(2)
                HStack(spacing: 4){
                   
                    Text("\(post.replies.totalItems)")
                    Image(systemName: "bubble.right")
                }
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity, alignment:.leading)
                .font(.footnote)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}


extension String {
    func toReadableDate() -> String {
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
