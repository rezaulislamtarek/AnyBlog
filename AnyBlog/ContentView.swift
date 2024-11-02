//
//  ContentView.swift
//  AnyBlog
//
//  Created by Rezaul Islam on 18/10/24.
//

import SwiftUI
import Blog
import CommonComponent

struct ContentView: View {
    @State private var selectdTab : BottomTabs = .latest
    var body: some View {
        VStack {
            //HostView
            TabView(selection: $selectdTab,
                    content:  {
                BlogPostScreen(tag: nil)
                    .tag(BottomTabs.latest)
                
                TagsScreen()
                    .tag(BottomTabs.tags)
                
                Text("Settings")
                    .tag(BottomTabs.setting)
            })
            BottomTabBar(selectedTab: $selectdTab)
        }
        .onAppear{
            UITabBar.appearance().isHidden = true
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
