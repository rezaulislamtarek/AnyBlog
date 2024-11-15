//
//  File.swift
//  
//
//  Created by Rezaul Islam on 10/11/24.
//

import Foundation
import XCTest
import Combine
@testable import TestUtilities
@testable import Blog
@testable import EasyNet

final class BlogRepositoryTest : XCTestCase {
    var sut : BlogPostRepositoryImp!
    var mocNetwork : MockEasyNet!
    var cancellables : Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        mocNetwork = MockEasyNet(baseUrl: "")
        sut = BlogPostRepositoryImp(network: mocNetwork)
        cancellables = []
    }
    
    override func tearDown() {
        sut = nil
        mocNetwork = nil
        cancellables = nil
        super.tearDown()
    }
    
    
    
    func testFetchBlogPostSuccess(){
        
        mocNetwork.mockData = BlogTestUtil.loadJSON(filename: "mock_blog_posts")
         
        let expection = XCTestExpectation(description: "Fetch blog posts")
        sut.fetchBlogPosts(apiKey: "test_key").sink { com in
             
        } receiveValue: { blogPosts in
            XCTAssertEqual(blogPosts.count, 10)
            expection.fulfill()
        }
        .store(in: &cancellables)
        
        wait(for: [expection], timeout: 1)

    }
    func testFetchBlogPostFail(){
        let  expection = XCTestExpectation(description: "Fail to fetch")
        sut.fetchBlogPosts(apiKey: "test_key").sink { com in
            switch com{
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, NetworkError.unknown.localizedDescription )
                expection.fulfill()
            case .finished:
                break
            }
        } receiveValue: { blogPosts in
            
        }
        
        wait(for: [expection], timeout: 111)

    }
    
}
