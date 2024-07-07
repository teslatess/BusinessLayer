//
//  News.swift
//  SPMTemplate
//
//  Created by tteslatess on 25.06.2024.
//

import Foundation

public struct News: Equatable {
    public let id: String?
    public let title: String
    public let description: String?
    public let imageURL: URL?
    public let author: String
    public let content: String
}
