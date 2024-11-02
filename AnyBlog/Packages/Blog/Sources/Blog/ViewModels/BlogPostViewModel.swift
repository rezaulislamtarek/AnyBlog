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
    @Published var selectedPost : BlogPost?
    
    private var repo : BlogRepository
    
    init(repo: BlogRepository) {
        self.repo = repo
    }
    
    func getBlogPosts(tag : String?){
        if tag == nil {
            getAllBlogPosts()
        }else{
            print("Tag \(tag)")
            getBlogPostByTag(tag: tag!)
        }
    }
    
    private func getAllBlogPosts( ){
        if blogPosts.count%10 != 0 { return }
        repo.fetchBlogPosts(apiKey: "" )
            .sink { com in
                
            } receiveValue: { data in
                self.blogPosts.append(contentsOf: data)      }
            .store(in: &cancellable)

    }
    
    private func getBlogPostByTag(tag : String){
        if blogPosts.count%10 != 0 { return }
        repo.fetchBlogPostsByTag(apiKey: "", tag: tag)
            .sink { com in
                switch com{
                    
                case .finished:
                    print("Finish")
                case .failure(let  error):
                    print("Error: \(error)")
                }
            } receiveValue: { data in
                self.blogPosts.append(contentsOf: data)
            }
            .store(in: &cancellable)

    }
    
}
