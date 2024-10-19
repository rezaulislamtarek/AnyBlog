//
//  File.swift
//  
//
//  Created by Rezaul Islam on 18/10/24.
//

import Foundation
import Combine

class BlogPostViewModel : ObservableObject{
    private var cancellable : Set<AnyCancellable> = []
    @Published var blogPosts : [BlogPost] = []
    private var repo : BlogRepository
    
    init(repo: BlogRepository) {
        self.repo = repo
    }
    
    func getBlogPosts( ){
        if blogPosts.count%10 != 0 { return }
        repo.fetchBlogPosts(apiKey: "" )
            .sink { com in
                
            } receiveValue: { data in
                self.blogPosts.append(contentsOf: data)      }
            .store(in: &cancellable)

    }
    
}
