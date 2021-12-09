//
//  SeachViewModel.swift
//  MovieBrowser
//
//  Created by Ling on 12/7/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit


class SearchViewModel {
    
    var movies: Movies? {
        didSet {
            DispatchQueue.main.async {
                self.updateUI?()
            }
        }
    }
    
    var updateUI: (() -> Void)?
    var networkService = Network()
    var selectedMovie: Movie?
    var numRows: Int {
        movies?.results.count ?? 0
    }
    
    func bind(closure: @escaping () -> Void) {
        updateUI = closure
    }
    
    func fetchMovies(searchStr: String){
        networkService.fetchMovies(searchStr: searchStr) { movies in
            self.movies = movies
        }
    }
    
    func getMovie(row: Int) -> Movie? {
        movies?.results[row]
    }
    
}
