//
//  TrendingCollectionViewCell.swift
//  moviepedia
//
//  Created by lss8 on 19/07/22.
//

import UIKit

class TrendingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    static let cellIdentifier = "trendingCell"
    
    func setup(title: String, image: UIImage, date: String) {
        titleLabel.text = title
        imageView.image = image
        dateLabel.text = String(date.prefix(4))
    }
    
}
