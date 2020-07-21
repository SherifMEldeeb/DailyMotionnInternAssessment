//
//  VideosRepository.swift
//  InternshipsAssessment
//
//  Created by Sherif M. Eldeeb on 7/21/20.
//  Copyright © 2020 Sherif Eldeeb. All rights reserved.
//

import Foundation

protocol VideosRepositoryProtocol {
    func getMostRecentVideos(completion: @escaping (Result<Videos, Error>) -> Void)
}

class VideosRepository: VideosRepositoryProtocol {
    private var isConnected: Bool
    private let remoteRepo: VideosRemoteRepositoryProtocol
    
    init(remoteVideosRepositories: VideosRemoteRepositoryProtocol, isConnected: Bool = true) {
        self.remoteRepo = remoteVideosRepositories
        self.isConnected = isConnected
    }
    
    func getMostRecentVideos(completion: @escaping (Result<Videos, Error>) -> Void) {
        if isConnected {
            remoteRepo.getMostRecentVideos { (result) in
                switch result {
                case  .success(let vids):
                    completion(.success(vids))
                case .failure(let err):
                    completion(.failure(err))
                }
            }
        }else {
            //getCachedVideos
            completion(.failure(NSError(domain: "Device is offline.", code: 999, userInfo: [:])))
        }
    }
    
}

extension VideosRepository {
    class func create(isConnected: Bool) -> VideosRepositoryProtocol {
        let remoteVideosRepository = VideosRemoteRepository()
        return VideosRepository(remoteVideosRepositories: remoteVideosRepository, isConnected: isConnected)
    }
}
