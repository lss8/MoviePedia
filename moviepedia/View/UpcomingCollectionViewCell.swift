//
//  UpcomingCollectionViewCell.swift
//  moviepedia
//
//  Created by lss8 on 11/07/22.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "upcomingCell"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    let monthNumToName = ["01-": "Jan ",
                          "02-": "Feb ",
                          "03-": "Mar ",
                          "04-": "Apr ",
                          "05-": "May ",
                          "06-": "Jun ",
                          "07-": "Jul ",
                          "08-": "Aug ",
                          "09-": "Sep ",
                          "10-": "Oct ",
                          "11-": "Nov ",
                          "12-": "Dec "]

    
    func setup(title: String, image: UIImage, date: String) {
        titleLabel.text = title
        imageView.image = image
        dateLabel.text = convertDate(data: String(date.suffix(5)))
    }
    
    func convertDate(data: String) -> String {
        return (monthNumToName[String(data.prefix(3))] ?? "") + String(data.suffix(2))
    }
    
}
