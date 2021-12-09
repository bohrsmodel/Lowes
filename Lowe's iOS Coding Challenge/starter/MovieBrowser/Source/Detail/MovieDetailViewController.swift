//
//  MovieDetailViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/26/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    static let identifier = "MovieDetailViewController"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    var movieDetailVM: MovieDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        stackView.backgroundColor = .white
        updateUI()

    }
    
    func updateUI() {
        guard let movieDetailVM = movieDetailVM else {
            return
        }
        titleLabel.text = movieDetailVM.movieTitle
        overviewLabel.text = "\n" + movieDetailVM.overview
        dateLabel.text = movieDetailVM.releaseDate
        movieDetailVM.fetchPoster { image in
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
}
