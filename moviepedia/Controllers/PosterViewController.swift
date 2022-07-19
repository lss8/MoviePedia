//
//  PosterViewController.swift
//  moviepedia
//
//  Created by lss8 on 19/07/22.
//

import UIKit

class PosterViewController: UIViewController {
    
    var movie: Movie?
    
    @IBOutlet var posterImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        guard let movie = movie else {
            return
        }
        
        Task {
            let imageData = await Movie.donwloadImageData(withPath: movie.posterPath)
            let imagem = UIImage(data: imageData) ?? UIImage()
            
            self.posterImageView.image = imagem
        }
        
        posterImageView.image = UIImage(named: movie.posterPath)

    }
    
}
