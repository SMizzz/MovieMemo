//
//  MovieInformViewController.swift
//  MovieMemo
//
//  Created by 신미지 on 2021/07/13.
//

import UIKit

class MovieInformViewController: UIViewController {
  var upComingData = [Movie]()
  var topRatedData = [Movie]()
  var nowPlayingData = [Movie]()

  @IBOutlet weak var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureCollectionView()
    getData()
  }
  
  private func configureCollectionView() {
    collectionView.delegate = self
    collectionView.dataSource = self
    let commonCell = UINib(nibName: "MovieListCell", bundle: nil)
    collectionView.register(commonCell, forCellWithReuseIdentifier: "MovieListCell")
    
    let upComingCell = UINib(nibName: "UpcomingCell", bundle: nil)
    collectionView.register(upComingCell, forCellWithReuseIdentifier: "UpcomingCell")
  }
  
  private func getData() {
    MovieNetworkManager.getMovieData(source: .upComing) { (movies) in
      self.upComingData = movies
      OperationQueue.main.addOperation {
        self.collectionView.reloadData()
      }
    }
    
    
    MovieNetworkManager.getMovieData(source: .topRated) { (movies) in
      self.topRatedData = movies
      OperationQueue.main.addOperation {
        self.collectionView.reloadData()
      }
    }
    
    MovieNetworkManager.getMovieData(source: .nowPlaying) { (movies) in
      print(movies)
      self.nowPlayingData = movies
      OperationQueue.main.addOperation {
        self.collectionView.reloadData()
      }
    }
    
    
  }
 
}

extension MovieInformViewController:
  UICollectionViewDelegate,
  UICollectionViewDataSource,
  UICollectionViewDelegateFlowLayout {
  
  func numberOfSections(in collectionView: UICollectionView
  ) -> Int {
    return 3
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    if section == 0 {
      return upComingData.count
    } else if section == 1 {
      return topRatedData.count
    } else {
      return nowPlayingData.count
    }
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    if indexPath.section == 0 {
      let upComingCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpcomingCell", for: indexPath) as! UpcomingCell
      let upComing = upComingData[indexPath.item]
      if let image = upComing.posterPath {
        upComingCell.posterImageView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(image)"))
      } else {
        upComingCell.posterImageView.kf.setImage(with: URL(string: "https://images-na.ssl-images-amazon.com/images/I/81u6wFnRDHL._AC_SL1500_.jpg"))
      }
      return upComingCell
    } else if indexPath.section == 1 {
      let topRatedCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieListCell", for: indexPath) as! MovieListCell
      let topRated = topRatedData[indexPath.row]
      if let image = topRated.posterPath {
        topRatedCell.posterImageView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(image)"))
      } else {
        topRatedCell.posterImageView.kf.setImage(with: URL(string: "https://images-na.ssl-images-amazon.com/images/I/81u6wFnRDHL._AC_SL1500_.jpg"))
      }
      return topRatedCell
    } else {
      let nowPlayingCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieListCell", for: indexPath) as! MovieListCell
      let nowPlaying = nowPlayingData[indexPath.row]
      if let image = nowPlaying.posterPath {
        nowPlayingCell.posterImageView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(image)"))
      } else {
        nowPlayingCell.posterImageView.kf.setImage(with: URL(string: "https://images-na.ssl-images-amazon.com/images/I/81u6wFnRDHL._AC_SL1500_.jpg"))
      }
      return nowPlayingCell
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if indexPath.section == 0 {
      return CGSize(width: view.frame.width, height: 463)
    } else {
      return CGSize(width: 140, height: 190)
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }
}
