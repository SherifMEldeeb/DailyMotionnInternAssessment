//
//  WebService.swift
//  InternshipsAssessment
//
//  Created by Sherif M. Eldeeb on 7/21/20.
//  Copyright © 2020 Sherif Eldeeb. All rights reserved.
//

import Foundation

enum WebService {
    enum Identifiers {
        static let baseURL: String = "https://api.dailymotion.com"
    }
    
    enum EndPoints {
        static let videos: String = "\(Identifiers.baseURL)/videos"
    }
}
