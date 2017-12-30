//
//  Movie.swift
//  Flix
//
//  Created by Avinash Singh on 30/12/17.
//  Copyright © 2017 Avinash Singh. All rights reserved.
//

import Foundation
class Movie {
    let title: String
    let posterUrl: URL?
    let overview: String
    let posterPathString: String
    let baseUrlString: String
    let releaseDate: String
    let backdropPath: String
    let backdropUrl: URL?
    
    init(dictionary: [String: Any]) {
         title = dictionary["title"] as? String ?? "No title"
         overview = dictionary["overview"] as? String ?? "No overview"
         posterPathString = dictionary["poster_path"] as! String
         baseUrlString = "https://image.tmdb.org/t/p/w500"
         releaseDate = dictionary["release_date"] as? String ?? "No release Date"
         posterUrl = URL (string: baseUrlString + posterPathString)!
         backdropPath = dictionary["backdrop_path"] as! String
         backdropUrl = URL (string:baseUrlString + backdropPath)!
        
        // Set the rest of the properties
    }
    
    

    
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }

    
}


