//
//  File.swift
//  
//
//  Created by Rezaul Islam on 15/11/24.
//

import Foundation
import XCTest
@testable import Blog
import TestUtilities
import EasyNet
/*
 @testable import TestUtilities
 @testable import Blog
 @testable import EasyNet
 */

final class BlogPostViewModelTest : XCTestCase {
    var mocNet : MockEasyNet!
    var blogRepo : BlogPostRepositoryImp!
    var blogVm : BlogPostViewModel!
    
    override func setUp() {
        super.setUp()
        mocNet = MockEasyNet(baseUrl: "")
        blogRepo = BlogPostRepositoryImp(network: mocNet)
        blogVm = BlogPostViewModel(repo: blogRepo)
    }
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetBlogPosts(){
        mocNet.mockData = BlogTestUtil.loadJSON(filename: "mock_blog_posts")
        blogVm.getBlogPosts(tag: nil)
        let expection = XCTestExpectation(description: "Get Blog posts")
        blogVm.$blogPosts.sink { blogs in
            XCTAssertEqual(blogs.count, 10)
            expection.fulfill()
        }
        wait(for: [expection], timeout: 1)
    }
    
    func testGetBlogsByTagWhenTagIsiOS(){
        blogVm.blogPosts = []
        mocNet.mockData = BlogTestUtil.loadJSON(filename: "moc_ios_tag_blogs")
        blogVm.getBlogPosts(tag: "iOS")
        let expection = XCTestExpectation(description: "Blogs by tag")
        blogVm.$blogPosts.sink { blogs in
            print(blogs)
            XCTAssertEqual(blogs.count, 8)
            expection.fulfill()
        }
        wait(for: [expection],timeout: 100)
    }
    
    
}
