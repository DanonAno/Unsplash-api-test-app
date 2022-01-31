//
//  SearchResults.swift
//  Unsplash task app
//
//  Created by  Даниил on 31.01.2022.
//

import Foundation

struct searchResults: Decodable {
    let total: Int
    let results: [UnsplashPhoto]
}
struct UnsplashPhoto: Decodable {
    let width: Int
    let height: Int
    let urls: [URLKing.RawValue: String]
    
    enum URLKing: String {
        case raw
        case full
        case regular
        case small
        case thumb
    }
    //
}

