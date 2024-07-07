//
//  NewsResponseMapper.swift
//  SPMTemplate
//
//  Created by tteslatess on 06.07.2024.
//

import Foundation
import NetworkingLayer

public final class NewsResponseMapper {
    public func mapResponseToMovies(_ response: NewsNetwork.Response) -> [News] {
        response.articles.compactMap {
            .init(
                id: $0.source.id,
                title: $0.title,
                description: $0.description,
                imageURL: URL(string: $0.urlToImage ?? ""),
                author: $0.author ?? "Unkown author",
                content: $0.content
            )
        }
    }
    
    public init() {}
}
