//
//  MovieListViewController.swift
//  MovieMemo
//
//  Created by 신미지 on 2021/07/07.
//

import UIKit
import Kingfisher

class MovieListViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  var topRatedData = [Movie]()
  var upComingData = [Movie]()
  var nowPlayingData = [Movie]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
    getData()
    tableView.backgroundColor = .gray
    let commonCell = UINib(nibName: "TableViewCell", bundle: nil)
    tableView.register(commonCell, forCellReuseIdentifier: "MovieCell")
  }
  
  private func configureTableView() {
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  @IBAction func composeBtnTap(_ sender: Any) {
    
  }
  
  private func getData() {
    MovieNetworkManager.getMovieData(source: .nowPlaying) { (movies) in
//      print(movies)
      self.nowPlayingData = movies
      OperationQueue.main.addOperation {
        self.tableView.reloadData()
      }
    }
    
    MovieNetworkManager.getMovieData(source: .upComing) { (movies) in
      self.upComingData = movies
      OperationQueue.main.addOperation {
        self.tableView.reloadData()
      }
    }
    
    MovieNetworkManager.getMovieData(source: .topRated) { (movies) in
      self.topRatedData = movies
      OperationQueue.main.addOperation {
        self.tableView.reloadData()
      }
    }
  }
}

extension MovieListViewController:
  UITableViewDelegate,
  UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 {
      return topRatedData.count
    } else if section == 1 {
      return upComingData.count
    } else {
      return nowPlayingData.count
    }
  }
  
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    
    if indexPath.section == 0 {
      let topRatedCell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! TableViewCell
      let topRated = topRatedData[indexPath.row]
      if let image = topRated.posterPath {
        topRatedCell.imgView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(image)"))
      } else {
        topRatedCell.imgView.kf.setImage(with: URL(string: "https://images-na.ssl-images-amazon.com/images/I/81u6wFnRDHL._AC_SL1500_.jpg"))
      }
      topRatedCell.titleLabel.text = topRated.title
      topRatedCell.voteLabel.text = "💜\(topRated.average)"
      return topRatedCell
    }
    
    if indexPath.section == 1 {
      let upComingCell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! TableViewCell
      let upComing = upComingData[indexPath.row]
      if let image = upComing.posterPath {
        upComingCell.imgView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(image)"))
      } else {
        upComingCell.imgView.kf.setImage(with: URL(string: "https://images-na.ssl-images-amazon.com/images/I/81u6wFnRDHL._AC_SL1500_.jpg"))
      }
      upComingCell.titleLabel.text = upComing.title
      upComingCell.voteLabel.text = "💜\(upComing.average)"
      return upComingCell
    }
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! TableViewCell
    let nowPlaying = nowPlayingData[indexPath.row]
    if let image = nowPlaying.posterPath {
      cell.imgView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(image)"))
    } else {
      cell.imgView.kf.setImage(with: URL(string: "https://images-na.ssl-images-amazon.com/images/I/81u6wFnRDHL._AC_SL1500_.jpg"))
    }
    cell.titleLabel.text = nowPlaying.title
    cell.voteLabel.text = "💜\(nowPlaying.average)"
    return cell
  }
  
  func tableView(
    _ tableView: UITableView,
    heightForRowAt indexPath: IndexPath
  ) -> CGFloat {
    return 170.0
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    if section == 0 {
      return "Top Rated"
    } else if section == 1 {
      return "UpComing Rated"
    } else {
      return "Now Playing"
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    print("did select row at", indexPath)
    guard let detailVC = self.storyboard?.instantiateViewController(identifier: "DetailMovieVC") as? DetailMovieViewController else { return }
    
    if indexPath.section == 0 {
      print(topRatedData[indexPath.item].id)
      detailVC.id = topRatedData[indexPath.item].id
    } else if indexPath.section == 1 {
      detailVC.id = upComingData[indexPath.item].id
    } else {
      detailVC.id = nowPlayingData[indexPath.item].id
    }
    self.present(detailVC, animated: true, completion: nil)
  }
}
