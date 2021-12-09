//
//  MovieDetailViewModel.swift
//  MovieBrowser
//
//  Created by Ling on 12/9/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

struct MovieDetailViewModel {
    let movie: Movie
    
    var movieTitle: String {
        movie.title ?? "No Title"
    }
    
    var overview: String {
        movie.overview ?? "No Overview"
    }
    
    var releaseDate: String {
        if let dateStr = movie.releaseDate {
            return getReleaseDate(dateStr: dateStr)
        } else {
            return "No Date"
        }
    }
    
    func getReleaseDate(dateStr: String) -> String {
        if let releaseDate = movie.releaseDate, let dateDate = dateFormatterYFirst.date(from: releaseDate) {
            dateFormatterMFirst.dateFormat = "M/dd/yyyy"
            let newStringDate = dateFormatterMFirst.string(from: dateDate)
            return "Release Date: " + newStringDate
        }
        return "No Release Date"
    }
    
    func fetchPoster(completion: @escaping (UIImage) -> Void) {
        Network().fetchPoster(posterPath: movie.posterPath) { image in
            completion(image)
        }
    }
}
