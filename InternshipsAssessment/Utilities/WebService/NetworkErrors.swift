//
//  NetworkErrors.swift
//  InternshipsAssessment
//
//  Created by Sherif M. Eldeeb on 7/21/20.
//  Copyright © 2020 Sherif Eldeeb. All rights reserved.
//

import Foundation

enum NetworkErrors: Error {
    case requestFailed(Error)
    case decodingFailed
}
