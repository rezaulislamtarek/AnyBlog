//
//  AnyBlogApp.swift
//  AnyBlog
//
//  Created by Rezaul Islam on 18/10/24.
//

import SwiftUI
import Blog
import Router

@main
struct AnyBlogApp: App {
    @StateObject var router = Router()
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                ContentView()
                    .navigationDestination(for: BlogRoutes.self) { destination in
                        switch destination {
                           case .blogList(let tag) :
                            BlogPostScreen(tag: tag)
                        case .blogDetails(let post):
                            BlogPostDetailsScreen(post: post)
                        }
                    }
            }
            .environmentObject(router)
        }
    }
}
