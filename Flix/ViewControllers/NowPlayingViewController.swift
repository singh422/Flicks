//
//  NowPlayingViewController.swift
//  Flix
//
//  Created by Avinash Singh on 17/11/17.
//  Copyright © 2017 Avinash Singh. All rights reserved.


import UIKit
import AlamofireImage

class NowPlayingViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var refreshControl : UIRefreshControl!
    @IBOutlet weak var activityControl: UIActivityIndicatorView!
//    var movies :[[String: Any]] = []

    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        
        networkReq()
        self.refreshControl = UIRefreshControl()
        self.refreshControl.addTarget(self, action: #selector (NowPlayingViewController.didPullToRefresh(_:)), for: .valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        
        
        // Do any additional setup after loading the view.
    }
    @objc func didPullToRefresh(_ refreshControl : UIRefreshControl){
        networkReq()
        
    }
    
//    func networkRequest(){
//        activityControl.startAnimating()
//        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
//        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
//        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
//        let task = session.dataTask(with: request) { (data, response, error) in
//            // This will run when the network request returns
//            if let error = error {
//                print(error.localizedDescription)
//            } else if let data = data {
//                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
//                let movieDictionaries = dataDictionary["results"] as! [[String: Any]]
//
//                self.movies = []
//                for dictionary in movieDictionaries {
//                    let movie = Movie(dictionary: dictionary)
//                    self.movies.append(movie)
//                }
//
////                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
////                let movies = dataDictionary["results"] as! [[String: Any]]
////                self.movies = movies
////                for movie in movies{
////                    let title = movie["title"] as! String
////                }
//                // TODO: Get the array of movies
//                // TODO: Store the movies in a property to use elsewhere
//                // TODO: Reload your table view data
//                self.activityControl.stopAnimating()
//                self.tableView.reloadData()
//                self.refreshControl.endRefreshing()
//            }
//        }
//        task.resume()
//    }
    
    func networkReq(){
        activityControl.startAnimating()
        MovieApiManager().nowPlayingMovies { (movies: [Movie]?, error: Error?) in
        if let movies = movies {
        self.movies = movies
        self.activityControl.stopAnimating()
        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
        }
    }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        
        let movie = movies[indexPath.row]
        
        cell.movie = movie
        
        return cell
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let cell = sender as! UITableViewCell
        if let indexPath = tableView.indexPath(for: cell){
            let movie = movies[indexPath.row]
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.movie = movie
        }
        
        
        
        
        
    }
    
    
}
