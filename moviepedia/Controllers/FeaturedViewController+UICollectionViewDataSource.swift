//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  moviepedia
//
//  Created by lss8 on 12/07/22.
//

import UIKit
extension FeaturedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == popularCollectionView {
            return popularMovies.count
            
        } else if collectionView == nowPlayingCollectionView {
            return nowPlayingMovies.count
            
        } else if collectionView == upcomingCollectionView {
            return upcomingMovies.count
            
        }
        return 0
    }
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as? PopularCollectionViewCell {
            
            cell.titleLabel.text = popularMovies[indexPath.item].title
            cell.imageView.image = UIImage(named: popularMovies[indexPath.item].backdrop)
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: "nowPlayingCell", for: indexPath) as? NowPlayingCollectionViewCell {
            
            cell.titleLabel.text = nowPlayingMovies[indexPath.item].title
            cell.dateLabel.text = nowPlayingMovies[indexPath.item].releaseDate
            cell.imageView.image = UIImage(named: nowPlayingMovies[indexPath.item].poster)
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCell", for: indexPath) as? UpcomingCollectionViewCell {
            
            cell.titleLabel.text = upcomingMovies[indexPath.item].title
            cell.dateLabel.text = upcomingMovies[indexPath.item].releaseDate
            cell.imageView.image = UIImage(named: upcomingMovies[indexPath.item].poster)
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == popularCollectionView {
            return makePopularCell(indexPath)
        } else if collectionView == nowPlayingCollectionView {
            return makeNowPlayingCell(indexPath)
        } else if collectionView == upcomingCollectionView{
            return makeUpcomingCell(indexPath)
        }
        return UICollectionViewCell()
    }
}
