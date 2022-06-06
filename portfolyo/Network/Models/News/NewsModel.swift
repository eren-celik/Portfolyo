//
//  NewsModel.swift
//  portfolyo
//
//  Created by Eren  Çelik on 6.06.2022.
//

import Foundation

public struct NewsModel: Decodable {
    public var status: String?
    public var articles: [Article]?
    public var message: String?
}

public struct Article: Decodable {
    public var source: Source?
    public var author, title, articleDescription: String?
    public var url: String?
    public var urlToImage: String?
    public var publishedAt, content: String?
}

public struct Source: Decodable {
    public var id, name: String?

}
