//
//  File.swift
//  
//
//  Created by Rezaul Islam on 18/10/24.
//

import Foundation
import Combine
import EasyNet

protocol BlogRepository {
    func fetchBlogPosts(apiKey : String 
    ) -> AnyPublisher<[BlogPost], Error>
}

class BlogPostRepositoryImp : BlogRepository{
    
    
    let network : EasyNet 
    var nextPageToken : String?
    
    init(network: EasyNet = EasyNet(baseUrl: "https://www.googleapis.com/blogger/v3/") ) {
        self.network = network
    }
    
    func fetchBlogPosts(apiKey: String) -> AnyPublisher<[BlogPost], Error> {
        
        var endPoint = nextPageToken == nil ? "blogs/6839959377168934742/posts?key=AIzaSyCWptosPBKqROY12Z6NtPaDLHgYA86fjok" : "blogs/6839959377168934742/posts?key=AIzaSyCWptosPBKqROY12Z6NtPaDLHgYA86fjok&pageToken=\(nextPageToken!)"
         print("Next page token :\(nextPageToken)")
        
        return network.fetchData(endPoint: endPoint, responseType: BlogPostResponse.self)
            .map{ response in
                self.nextPageToken = response.nextPageToken
                return response.items ?? []
            }
            .eraseToAnyPublisher()
    }
     
}
