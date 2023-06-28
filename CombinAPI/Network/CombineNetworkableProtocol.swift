//
//  CombineNetworkableProtocol.swift
//  CombinAPI
//
//  Created by Payam Karbassi on 27/06/2023.
//

import Foundation
import Combine

protocol CombineNetworkableProtocol {
    func getData<T>(withUrl url:URL)-> AnyPublisher< T , Error> where T : Decodable
}
