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
                ThumbnilCoverView(label: post.title)
                HStack{
                    Text("by")
                    Text(post.author.displayName)
                }
                RichWebView(htmlContent: post.content)
                   
            }
        })
        .navigationTitle(post.title)
        .padding()
    }
}

#Preview {
    let sampleBlogPost = BlogPost(
        id: "123",
        title: "Swift এর Combine ফ্রেমওয়ার্ক নিয়ে পরিচিতি",
        content: """
            iOS ডেভেলপমেন্টে অ্যাসিঙ্ক্রোনাস প্রোগ্রামিং একটি গুরুত্বপূর্ণ বিষয়, বিশেষ করে যখন নেটওয়ার্ক রিকোয়েস্ট, টাইমার, ইউজার ইন্টারফেস আপডেট, এবং ডেটা স্ট্রিমের সাথে কাজ করা হয়। Combine ফ্রেমওয়ার্ক এর সাথে, অ্যাপল অ্যাসিঙ্ক্রোনাস ইভেন্ট এবং ডেটা স্ট্রিমগুলিকে ডিক্লারেটিভ উপায়ে হ্যান্ডল করার জন্য একটি শক্তিশালী টুল সরবরাহ করেছে।
            """,
        published: "2024-10-22",
        author: Author(id: "001", displayName: "Rezaul Islam Tarek"),
        labels: ["iOS", "Swift", "Combine"],
        replies: Replies(totalItems: "0")
    )

  return BlogPostDetailsScreen(post: sampleBlogPost)
}

struct ThumbnilCoverView: View {
    let label : String
    var body: some View {
        Text(label)
            .padding()
            .font(.title)
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            .background(.green.opacity(0.1))
            .multilineTextAlignment(.center)
            .cornerRadius(16)
    }
}
