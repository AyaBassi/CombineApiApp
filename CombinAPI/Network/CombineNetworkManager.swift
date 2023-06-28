//
//  CombineNetworkManager.swift
//  CombinAPI
//
//  Created by Payam Karbassi on 27/06/2023.
//

import Foundation
import Combine

class CombineNetworkManager : NSObject ,CombineNetworkableProtocol , URLSessionDelegate{
    func getData<T>(withUrl url: URL) -> AnyPublisher<T, Error> where T : Decodable {
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data: Data, response: URLResponse) in
                guard let httpResponse = response as? HTTPURLResponse, 200...209 ~= httpResponse.statusCode else {
                    throw CustomNetworkError.responseError
                }
                // success
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error  in
                return error
            }.eraseToAnyPublisher()
    }
}
