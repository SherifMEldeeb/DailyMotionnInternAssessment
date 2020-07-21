//
//  VideosListViewModel.swift
//  InternshipsAssessment
//
//  Created by Sherif M. Eldeeb on 7/21/20.
//  Copyright © 2020 Sherif Eldeeb. All rights reserved.
//

import Foundation

class VideosListViewModel {
    var videosViewModel: [VideoViewModel]
    
    init(videosRepository: VideosRepositoryProtocol, completionWithFailure:@escaping (Error?) -> Void) {
        videosRepository.getMostRecentVideos { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let vids):
                self.videosViewModel = vids.list.map {
                    VideoViewModel($0)
                }
                completionWithFailure(nil)
            case .failure(let err):
                completionWithFailure(err)
            }
        }
    }
}

class VideoViewModel {
    let id, title: String
    let channel: Channel
    let owner: String
    
    init(_ video: Video) {
        self.id = video.id
        self.title = video.title
        self.channel = video.channel
        self.owner = video.owner
    }
}
