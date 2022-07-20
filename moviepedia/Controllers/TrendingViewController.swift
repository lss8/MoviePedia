//
//  TrendingViewController.swift
//  moviepedia
//
//  Created by lss8 on 19/07/22.
//

import UIKit

class TrendingViewController: UIViewController {
    
    var trendingMovies: [Movie] = []
    var trendingMoviesDay: [Movie] = []
    var trendingMoviesWeek: [Movie] = []
    
    @IBOutlet var trendingCollectionView: UICollectionView!
    
    @IBAction func switchSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.trendingMovies = trendingMoviesDay
            self.trendingCollectionView.reloadData()
        } else {
            self.trendingMovies = trendingMoviesWeek
            self.trendingCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        trendingCollectionView.dataSource = self
        trendingCollectionView.delegate = self
        
        Task {
            self.trendingMoviesDay = await Movie.trendingMoviesDayAPI()
            self.trendingMoviesWeek = await Movie.trendingMoviesWeekAPI()
            self.trendingMovies = trendingMoviesDay
            self.trendingCollectionView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //abrir poster do filme
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
    
}
