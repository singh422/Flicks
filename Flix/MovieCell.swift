//
//  MovieCell.swift
//  Flix
//
//  Created by Avinash Singh on 17/11/17.
//  Copyright © 2017 Avinash Singh. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var movie : Movie! {
        didSet {
            let title = movie.title
            let overview = movie.overview
            let posterPathString = movie.posterUrl
//            let baseUrlString = "https://image.tmdb.org/t/p/w500"
//            let posterUrl = URL (string: baseUrlString + posterPathString)!
           
            let posterUrl = movie.posterUrl!
            
            posterView.af_setImage(withURL: posterUrl)
            titleLabel.text = title
            descriptionLabel.text = overview

    
        }
    
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
