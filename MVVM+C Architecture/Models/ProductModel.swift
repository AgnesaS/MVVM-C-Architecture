//
//  ProductModel.swift
//  MVVM+C Architecture
//
//  Created by Agnesa  on 5.12.23.
//

import Foundation
import SwiftyJSON

// MARK: - Products
struct Products: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}
