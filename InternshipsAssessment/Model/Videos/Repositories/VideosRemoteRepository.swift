//
//  VideosRemoteRepository.swift
//  InternshipsAssessment
//
//  Created by Sherif M. Eldeeb on 7/21/20.
//  Copyright © 2020 Sherif Eldeeb. All rights reserved.
//

import Foundation

protocol VideosRemoteRepositoryProtocol {
    func getMostRecentVideos(completion:@escaping (Result<Videos, NetworkErrors>) -> Void)
}

class VideosRemoteRepository: VideosRemoteRepositoryProtocol {
    func getMostRecentVideos(completion:@escaping (Result<Videos, NetworkErrors>) -> Void) {
            if let videosURL = URL(baseUrl: WebService.EndPoints.videos, queryItems: [:]) {
                var request = URLRequest(url: videosURL)
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                URLSession.shared.dataTask(with: request) { data, response, error in
                    guard let status = (response as? HTTPURLResponse)?.statusCode else {
                        if let err = error {
                            completion(.failure(.requestFailed(err)))
                        }
                        return
                    }
                    if status == 200 {
                        guard let data: Data = data else { return }
                        do {
                            let videos: Videos = try self.decode(data: data)
                            completion(.success(videos))
                        }catch(let err) {
                            print(err.localizedDescription)
                            completion(.failure(.decodingFailed))
                        }
                    }else {
                        if let err = error {
                          completion(.failure(.requestFailed(err)))
                        }
                    }
                }.resume()
            }
        }
    
    private func decode(data: Data) throws -> Videos {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            return try decoder.decode(Videos.self, from: data)
        } catch {
            throw error
        }
    }
    
    
}
