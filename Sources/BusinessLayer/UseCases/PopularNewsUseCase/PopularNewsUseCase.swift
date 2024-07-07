//
//  PopularNewsUseCase.swift
//  SPMTemplate
//
//  Created by tteslatess on 06.07.2024.
//

import Foundation

public protocol PopularNewsUseCase {
    func fetchNews(
        page: Int,
        completion: @escaping (Result<(totalPages: Int, news: [News]), Error>) -> ()
    )
}

