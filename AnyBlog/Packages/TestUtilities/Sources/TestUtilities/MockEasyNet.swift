//
//  File.swift
//
//
//  Created by Rezaul Islam on 10/11/24.
//

import Combine
@testable import EasyNet
import Foundation

class MockEasyNet: EasyNet {
    
    var mockData: Data?
    var mockError: Error?
    
    override func fetchData<T>(endPoint: String, responseType: T.Type, extraHeaders: [String : String]? = nil) -> AnyPublisher<T, Error> where T : Decodable, T : Encodable {
        if let error = mockError{
            return Fail(error: error).eraseToAnyPublisher()
        }
        if let data = mockData {
            let  decoder =  JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                return Just(decodedData)
                    .setFailureType(to: Error.self)
                    .eraseToAnyPublisher()
            } catch {
                return Fail(error: error).eraseToAnyPublisher()
            }
        }
        return Fail(error: NetworkError.unknown).eraseToAnyPublisher()
    }
}
