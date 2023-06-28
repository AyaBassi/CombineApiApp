//
//  CustomNetworkError.swift
//  CombinAPI
//
//  Created by Payam Karbassi on 27/06/2023.
//

import Foundation
enum CustomNetworkError : Error{
    case dataNotFoundError
    case parsingError
    case invalidUrlError
    case responseError
}
extension CustomNetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .dataNotFoundError:
            return NSLocalizedString("dataNotFoundError:", comment: "dataNotFoundError")
        case .parsingError:
            return NSLocalizedString("Failed to parse API", comment: "NetworkErrorEnum.parsingError")
        case .invalidUrlError:
            return NSLocalizedString("Invalid URL", comment: "NetworkErrorEnum.invalidUrlError")
        case .responseError:
            return NSLocalizedString("Response Error", comment: "responseError")
        }
    }
}
