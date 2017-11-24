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
    
    var movie: [String: Any]?
    
    @IBOutlet weak var overviewLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie = movie{
            titleLabel.text = movie["title"] as? String
            releaseDateLabel.text = movie["release_date"] as? String
            overviewLable.text = movie["overview"] as? String
            let backdropPathString = movie["backdrop_path"] as! String
            let posterPathString = movie["poster_path"] as! String
            let baseUrlString = "https://image.tmdb.org/t/p/w500"
            let backdropUrl = URL (string:baseUrlString + backdropPathString)!
            backdropImageView.af_setImage(withURL: backdropUrl)
            let posterUrl = URL (string: baseUrlString + posterPathString)!
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
