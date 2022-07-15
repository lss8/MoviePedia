//
//  NowPlayingCollectionViewCell.swift
//  moviepedia
//
//  Created by lss8 on 11/07/22.
//

import UIKit

class NowPlayingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "nowPlayingCell"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func setup(title: String, image: UIImage, date: String) {
        titleLabel.text = title
        imageView.image = image
        dateLabel.text = String(date.prefix(4))
    }
}
