//
//  DetailsViewController.swift
//  moviepedia
//
//  Created by lss8 on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {

    var movie: Movie?
    
    @IBOutlet var backdropImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        posterImage.addGestureRecognizer(tapGR)
        posterImage.isUserInteractionEnabled = true
        
        guard let movie = movie else {
            return
        }
        self.title = movie.title
        
        Task {
            let imageData = await Movie.donwloadImageData(withPath: movie.backdropPath)
            let imagem = UIImage(data: imageData) ?? UIImage()
            
            self.backdropImage.image = imagem
        }
        Task {
            let imageData = await Movie.donwloadImageData(withPath: movie.posterPath)
            let imagem = UIImage(data: imageData) ?? UIImage()
            
            self.posterImage.image = imagem
        }
        
        backdropImage.image = UIImage(named: movie.backdropPath)
        titleLabel.text = movie.title
        posterImage.image = UIImage(named: movie.posterPath)
        ratingLabel.text = "Rating: \(movie.voteAverage)/10"
        overviewLabel.text = movie.overview
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            performSegue(withIdentifier: "posterSegue", sender: movie)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //abrir poster do filme
        if let destination = segue.destination as? PosterViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
    
}
