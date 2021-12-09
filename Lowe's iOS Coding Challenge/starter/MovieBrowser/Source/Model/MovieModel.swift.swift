//
//  MovieModel.swift.swift
//  MovieBrowser
//
//  Created by Ling on 12/7/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

struct Movies: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    
    let overview: String?
    let posterPath, releaseDate, title: String?
    let voteAverage: Double?
    
    enum CodingKeys: String, CodingKey {
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
    }
}


