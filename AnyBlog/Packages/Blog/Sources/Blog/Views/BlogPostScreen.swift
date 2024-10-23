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
    public init(){}
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
                                         blogVm.getBlogPosts()
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
                Text("Blogs")
                    .bold()
                   // .font(.largeTitle)
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .padding()
                    .frame(maxWidth: .infinity, alignment:.leading)
                    .background(mode == .dark ? .black : .white)
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
            .preferredColorScheme(.dark)
     
}
#Preview {
    
        BlogPostScreen()
            .environmentObject(Router())
            .preferredColorScheme(.light)
     
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
                        LinearGradient(gradient: Gradient(colors: getTwoRandomColors(opacity: 0.8)), startPoint: .bottomLeading, endPoint: .topTrailing)
                        
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


