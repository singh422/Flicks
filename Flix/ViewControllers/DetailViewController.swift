//
//  DetailViewController.swift
//  Flix
//
//  Created by Avinash Singh on 24/11/17.
//  Copyright © 2017 Avinash Singh. All rights reserved.
//

import UIKit

enum MovieKeys {
    
}

class DetailViewController: UIViewController {
    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    var movie: Movie!
    
    @IBOutlet weak var overviewLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie = movie{
            titleLabel.text = movie.title
            releaseDateLabel.text = movie.releaseDate
            overviewLable.text = movie.overview
            
//            let backdropPathString = movie["backdrop_path"] as! String
//            let posterPathString = movie["poster_path"] as! String
//            let baseUrlString = "https://image.tmdb.org/t/p/w500"
//            let backdropUrl = URL (string:baseUrlString + backdropPathString)!
            let backdropUrl = movie.backdropUrl!
            backdropImageView.af_setImage(withURL: backdropUrl)
//            let posterUrl = URL (string: baseUrlString + posterPathString)!
            let posterUrl = movie.posterUrl!
            posterImageView.af_setImage(withURL: posterUrl)
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
