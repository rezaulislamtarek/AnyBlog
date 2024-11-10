//
//  File.swift
//
//
//  Created by Rezaul Islam on 10/11/24.
//

import Combine
@testable import EasyNet
import Foundation

public class MockEasyNet: EasyNet {
    
    public var mockData: Data?
    public var mockError: Error?
    
    public override func fetchData<T>(endPoint: String, responseType: T.Type, extraHeaders: [String : String]? = nil) -> AnyPublisher<T, Error> where T : Decodable, T : Encodable {
        print("Fetching \(T.Type.self)")
        if let error = mockError{
            print("Fetching  error\(T.Type.self)")
            return Fail(error: error).eraseToAnyPublisher()
        }
        print("Fetching  moc Data\(mockData)")
        if let data = mockData {
            let  decoder =  JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            print("Moc Data \(data)")
            
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
