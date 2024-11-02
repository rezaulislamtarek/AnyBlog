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
    
    func fetchBlogPostsByTag(apiKey : String, tag : String) -> AnyPublisher<[BlogPost], Error>
}

class BlogPostRepositoryImp : BlogRepository{

    
    
    let network : EasyNet 
    var nextPageToken : String?
    private var apiKey : String = "AIzaSyCWptosPBKqROY12Z6NtPaDLHgYA86fjok"
    let  key = "AIzaSyCWptosPBKqROY12Z6NtPaDLHgYA86fjok"
    
    init(network: EasyNet = EasyNet(baseUrl: "https://www.googleapis.com/blogger/v3/") ) {
        self.network = network
    }
    
    func fetchBlogPosts(apiKey: String) -> AnyPublisher<[BlogPost], Error> {
        
        let endPoint = nextPageToken == nil ? "blogs/6839959377168934742/posts?key=\(key)" : "blogs/6839959377168934742/posts?key=\(key)&pageToken=\(nextPageToken!)"
        print("Next page token :\(String(describing: nextPageToken))")
        
        let result = network.fetchData(endPoint: endPoint, responseType: BlogPostResponse.self)
            .map{ response in
                print("Data Found")
                self.nextPageToken = response.nextPageToken
                return response.items ?? []
            }
            .eraseToAnyPublisher()
        
        print("this line is executing before data")
        
        return result
    }
    
    func fetchBlogPostsByTag(apiKey: String, tag: String) -> AnyPublisher<[BlogPost], Error> {
        let endPoint = nextPageToken == nil ? "blogs/6839959377168934742/posts?labels=\(tag)&key=\(key)" : "blogs/6839959377168934742/posts?labels=\(tag)&key=\(key)&pageToken=\(nextPageToken!)"
        print("Next page token :\(String(describing: nextPageToken))")

        let result = network.fetchData(endPoint: endPoint, responseType: BlogPostResponse.self)
            .map{ response in
                print("Data Found")
                self.nextPageToken = response.nextPageToken
                return response.items ?? []
            }
            .eraseToAnyPublisher()

        print("this line is executing before data")

        return result
    }
    
     
}

/*
 protocol BlogRepository {
     func fetchBlogPosts(apiKey : String
     ) -> AnyPublisher<[BlogPost], Error>
     
     //func fetchBlogPostsByTag(apiKey : String, tag : String) -> AnyPublisher<[BlogPost], Error>
 }

 class BlogPostRepositoryImp : BlogRepository{
 //    func fetchBlogPostsByTag(apiKey: String, tag: String) -> AnyPublisher<[BlogPost], Error> {
 //        let endPoint = nextPageToken == nil ? "blogs/6839959377168934742/posts?labels=iOS&key=\(apiKey)" : "blogs/6839959377168934742/posts?labels=iOS&key=\(apiKey)&pageToken=\(nextPageToken!)"
 //        print("Next page token :\(String(describing: nextPageToken))")
 //
 //        let result = network.fetchData(endPoint: endPoint, responseType: BlogPostResponse.self)
 //            .map{ response in
 //                print("Data Found")
 //                self.nextPageToken = response.nextPageToken
 //                return response.items ?? []
 //            }
 //            .eraseToAnyPublisher()
 //
 //        print("this line is executing before data")
 //
 //        return result
 //    }
 //
     
     
     let network : EasyNet
     var nextPageToken : String?
     private var apiKey : String = "AIzaSyCWptosPBKqROY12Z6NtPaDLHgYA86fjok"
     
     init(network: EasyNet = EasyNet(baseUrl: "https://www.googleapis.com/blogger/v3/") ) {
         self.network = network
     }
     
     func fetchBlogPosts(apiKey: String) -> AnyPublisher<[BlogPost], Error> {
         
         let endPoint = nextPageToken == nil ? "blogs/6839959377168934742/posts?key=\(apiKey)" : "blogs/6839959377168934742/posts?key=\(apiKey)&pageToken=\(nextPageToken!)"
         print("Next page token :\(String(describing: nextPageToken))")
         
         let result = network.fetchData(endPoint: endPoint, responseType: BlogPostResponse.self)
             .map{ response in
                 print("Data Found")
                 self.nextPageToken = response.nextPageToken
                 return response.items ?? []
             }
             .eraseToAnyPublisher()
         
         print("this line is executing before data")
         
         return result
     }
      
 }

 */
