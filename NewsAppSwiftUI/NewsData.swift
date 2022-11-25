//
//  NewsData.swift
//  NewsAppSwiftUI
//
//  Created by Zeynep Özdemir Açıkgöz on 29.09.2022.
//

import Foundation


// MARK: - Welcome
struct Welcome: Identifiable, Codable {
    let id = UUID()
    var success: Bool?
    var result: [Result]?
}

// MARK: - Result
struct Result: Identifiable, Codable {
    
    var id = UUID()
    var key: String?
    var url: String?
    var resultDescription: String?
    var image: String?
    var name, source: String?

    enum CodingKeys: String, CodingKey {
        case key, url
        case resultDescription = "description"
        case image, name, source
    }
}


//https://api.collectapi.com/news/getNews?country=tr&tag=general
