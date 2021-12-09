//
//  CustomTableViewCell.swift
//  MovieBrowser
//
//  Created by Ling on 12/7/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: CustomTableViewCell.self)
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func configure(movie: Movie?) {
        guard let movie = movie else { return }
        
        if let stringDate = movie.releaseDate
        {
            if let dateDate = dateFormatterYFirst.date(from:stringDate) {
                let newStringDate = dateFormatterMMM.string(from: dateDate)
                dateLabel.text = newStringDate
            }
        }
        if let average = movie.voteAverage {
            ratingLabel.text = String(average)
        }
        titleLabel.text = movie.title
        
    }
    
}
