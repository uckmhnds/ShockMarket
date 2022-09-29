//
//  Product.swift
//  ShockMarket
//
//  Created by Abdurrahman Gazi Yavuz on 29.09.2022.
//

import Foundation

struct Payload: Codable{
    let payload: Products
}

struct Products: Codable{
    let products: [Product]
}

struct Product: Codable{
    
    let title: String?
    let product_name: String?
    let description: String?
    let brand: String?
    let madein: String?
    let quantity: Int?
    let cargo_day: Int?
    
    let price: Price?
    let old_price: Price?
    let cargo_price: Price?
    
    let images: [Image]
    
    let image_types: ImageType?
    
    let units: Unit?
    
}


struct Price: Codable{
    
    let original: Double?
    let original_str: String?
    let whole: Int?
    let whole_str: String?
    let fraction: String?
    let fraction_str: String?
    let currency: String?
    let currency_symbol: String?
    let decimal_seperator: String?
    let thousands_separator: String?
}


struct Image: Codable{
    
    let id: Int?
    let productid: Int?
    let product_serialid: Int?
    let url: String?
    let type: Int?
    let title: String?
    let order: Int?
    
}

struct ImageType: Codable{
    
    let mini: String?
    let thumbnail: String?
    let original: String?
    
}

struct Unit: Codable{
    
    let title: String?
    let is_in_basket: Bool?
    let is_default: Bool?
    let available_quantity: Int?
    let basket_quantity: Int?
    let basket_price: Price?
    
}
