//
//  PopularNewsUseCaseImpl.swift
//  SPMTemplate
//
//  Created by tteslatess on 06.07.2024.
//

import NetworkingLayer

public final class PopularNewsUseCaseImpl {
    private let networkService: PopularNewsService
    private let responseMapper: NewsResponseMapper
    
    public init(
        networkService: PopularNewsService,
        responseMapper: NewsResponseMapper
    ) {
        self.networkService = networkService
        self.responseMapper = responseMapper
    }
}

// MARK: - Interface
extension PopularNewsUseCaseImpl: PopularNewsUseCase {
    public func fetchNews(
        page: Int,
        completion: @escaping (Result<(totalPages: Int, news: [News]), Error>) -> ()
    ) {
        networkService.fetchPopularNews(page: page) { [weak self] result in
            guard let self = self else { return }
            var response: Result<(totalPages: Int, news: [News]), Error>
            defer { completion(response) }
            switch result {
            case .success(let newsResponse):
                let news = responseMapper.mapResponseToMovies(newsResponse)
                let pageSize = 20
                let pages = Double(newsResponse.totalResults/pageSize).rounded()
                let totalPages = Int(pages) + 1
                response = .success((totalPages ,news))
            case .failure(let error):
                response = .failure(error)
            }
        }
    }
}
