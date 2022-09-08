//
//  News.swift
//  newsAPP
//
//  Created by Cenk Bahadır Çark on 8.09.2022.
//

import Foundation

struct NewsResponse: Codable {
    let status: String?
    let news: [News]?
    let page: Int?
}

// MARK: - News
struct News: Codable {
    let id, title, newsDescription: String?
    let url: String?
    let author: String?
    let image: String?
    let language: Language?
    let category: [String]?
    let published: String?

    enum CodingKeys: String, CodingKey {
        case id, title
        case newsDescription
        case url, author, image, language, category, published
    }
}

enum Language: String, Codable {
    case en = "en"
    case es = "es"
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String?
}
