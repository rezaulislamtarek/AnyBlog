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
    
    func loadJSON(filename: String) -> Data? {
        let bundle = Bundle(for: type(of: self))  // Use the test class's bundle
        if let url = Bundle.module.url(forResource: filename, withExtension: "json") {
            print("Found URL: \(url)")
            do {
                return try Data(contentsOf: url)
            } catch {
                XCTFail("Failed to load JSON from \(url): \(error)")
            }
        } else {
            XCTFail("Failed to locate \(filename).json in test bundle")
        }
        return nil
    }


    
    func testFetchBlogPostSuccess(){
        mocNetwork.mockData = loadJSON(filename: "mock_blog_posts")
        
        print("MocData \(mocNetwork.mockData)")
         
        let expection = XCTestExpectation(description: "Fetch blog posts")
        sut.fetchBlogPosts(apiKey: "test_key").sink { com in
             
        } receiveValue: { blogPosts in
             
            expection.fulfill()
        }
        .store(in: &cancellables)
        
        wait(for: [expection], timeout: 10)

    }
}