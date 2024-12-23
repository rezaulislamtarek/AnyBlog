//
//  SwiftUIView.swift
//
//
//  Created by Rezaul Islam on 18/10/24.
//

import SwiftUI
import Router
import Utils

public struct BlogPostScreen: View {
    @Environment(\.colorScheme) var mode
    @StateObject private var blogVm = BlogPostViewModel(repo: BlogPostRepositoryImp())
    @EnvironmentObject private var router : Router
    @State var searchText : String = ""
    var tag : String?
    public init(tag : String?){
        self.tag = tag
    }
    public var body: some View {
        
        VStack(alignment: .leading ) {
             
            
            ScrollView(.vertical,showsIndicators: false) {
                VStack(alignment: .leading ){ 
                    SearchView(searchText: $searchText, hintText: "Search Blogs")
                    LazyVStack(spacing: 16 ){
                        
                        ForEach(blogVm.blogPosts) { post in
                            BlogRowView(post: post)
                                .padding(.horizontal)
                                .onAppear{
                                    if blogVm.blogPosts.last?.id == post.id{
                                        print("next page call")
                                         blogVm.getBlogPosts(tag: tag)
                                    }
                                }
                                .onTapGesture {
                                    router.navigate(to: BlogRoutes.blogDetails(post: post))
                                }
                        }
                    }
                    
                }
                .padding(.bottom,60)
                .offset(y: 60)
            }
             
            .overlay(alignment: .top, content: {
                Text("\(tag ?? "Blogs")")
                    .bold()
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .padding()
                    .frame(maxWidth: .infinity, alignment:.leading)
                    .background(mode == .dark ? .black : .white)
            })
            .onAppear{
                print("Blog Screen Appeared")
                blogVm.getBlogPosts(tag: tag )
        }
        }
        .navigationBarTitleDisplayMode(.inline )
        .toolbarBackground(.hidden, for: .navigationBar)
    }
}

#Preview {
    
    BlogPostScreen(tag: nil)
            .environmentObject(Router())
            .preferredColorScheme(.dark)
     
}
#Preview {
    
    BlogPostScreen(tag: nil)
            .environmentObject(Router())
            .preferredColorScheme(.light)
     
}




struct BlogRowView: View {
    let post : BlogPost
    
    var body: some View {
        HStack {
            ThumbnilView(image: nil, text: post.title, width: 140, height: 100, alignment: .leading )
                .font(.caption)
                 
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

struct SearchView : View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var searchText : String
    let hintText  : String
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
            
            TextField(hintText, text: $searchText)
            Spacer()
            Image(systemName: "slider.vertical.3")
                .resizable()
                .scaledToFit()
                .frame(width: 22)
                .padding(8)
                .background( colorScheme == .dark ? .black.opacity(0.5) : .white.opacity(0.5))
                .cornerRadius(8)
        }
        .padding(.horizontal)
        .padding(.vertical,8)
        .background(colorScheme == .dark ? .white.opacity(0.04) : .black.opacity(0.04))
        .cornerRadius(16)
        .padding()
        .font(.system(size: 22, weight: .regular, design: .rounded))
    }
}


