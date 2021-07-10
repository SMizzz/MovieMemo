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
  var movieData = [Movie]()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
    getData()
    tableView.backgroundColor = .gray
  }
  
  private func configureTableView() {
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  @IBAction func composeBtnTap(_ sender: Any) {
    
  }
  
  private func getData() {
    MovieNetworkManager.getMovieData { (movie) in
      print(movie)
      self.movieData = movie
      self.tableView.reloadData()
    }
  }
}

extension MovieListViewController:
  UITableViewDelegate,
  UITableViewDataSource {
  func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    return movieData.count
  }
  
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieCell
    else { return UITableViewCell()}
    let movie = movieData[indexPath.row]
    if let image = movie.posterPath {
      cell.posterPath.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(image)"))
    } else {
      cell.posterPath.kf.setImage(with: URL(string: "https://images-na.ssl-images-amazon.com/images/I/81u6wFnRDHL._AC_SL1500_.jpg"))
    }
    cell.name.text = movie.title
    cell.average.text = "💜\(movie.average)"
    return cell
  }
  
  func tableView(
    _ tableView: UITableView,
    heightForRowAt indexPath: IndexPath
  ) -> CGFloat {
    return 170.0
  }
}
