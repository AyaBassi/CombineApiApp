//
//  ProductModel.swift
//  CombinAPI
//
//  Created by Payam Karbassi on 27/06/2023.
//

import Foundation


// MARK: - Product Model
struct ProductModel: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable, Identifiable , Hashable{
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}
