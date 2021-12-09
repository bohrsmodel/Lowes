//
//  Network.swift
//  SampleApp
//
//  Created by Struzinski, Mark - Mark on 9/17/20.
//  Copyright © 2020 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class Network {
    
    let apiKey = "5885c445eab51c7004916b9c0313e2d3"
    
    func fetchMovies(searchStr: String, completion: @escaping (Movies) -> Void) {
        
        let decoder = JSONDecoder()
        let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=5885c445eab51c7004916b9c0313e2d3&query=" + searchStr)
        if let url = url {
            URLSession.shared.dataTask(with: url) { data, r, e in
                guard let data = data else {
                    return
                }
                do {
                    let decoded = try decoder.decode(Movies.self, from: data)
                    completion(decoded)
                } catch {
                    print("DEBUG: No movies fetched")
                }
            }.resume()
        }
    }
    
    func fetchPoster(posterPath: String?, completion: @escaping (UIImage) -> Void)  {
        if let posterPath = posterPath {
            if let url = URL(string: "https://image.tmdb.org/t/p/w500" + posterPath) {
                URLSession.shared.dataTask(with: url) { data, _, _ in
                    guard let data = data else { return }
                    if let image = UIImage(data: data) {
                        completion(image)
                    }
                }.resume()
            }
        } else {
            print("DEBUG: No Movie Poster")
        }
    }
}
