//
//  Coordinator.swift
//  MovieBrowser
//
//  Created by Ling on 12/7/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//
// The Coordinator is responsible for coordinating the navigation of the ViewControllers and is also the delegates for the viewControllers

import UIKit

class Coordinator {
    let navigationController: UINavigationController
    
    init(_ rootController: UIViewController) {
        self.navigationController = UINavigationController(rootViewController: rootController)
    }
}

extension Coordinator: SearchViewControllerDelegate {
    func loadDetail(selectedMovie: Movie) {
        let vc = MovieDetailViewController(nibName: MovieDetailViewController.identifier, bundle: nil)
        vc.movieDetailVM = MovieDetailViewModel(movie: selectedMovie)
        navigationController.pushViewController(vc, animated: true)
    }
}

protocol SearchViewControllerDelegate {
    func loadDetail(selectedMovie: Movie)
}

