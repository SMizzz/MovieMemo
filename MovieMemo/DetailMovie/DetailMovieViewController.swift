//
//  DetailMovieViewController.swift
//  MovieMemo
//
//  Created by 신미지 on 2021/07/13.
//

import UIKit

class DetailMovieViewController: UIViewController {

  @IBOutlet weak var posterImageVIew: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var averageLabel: UILabel!
  @IBOutlet weak var overviewLabel: UILabel!
  var id: Int = 0
  var posterPath: String = ""

  override func viewDidLoad() {
    super.viewDidLoad()
//    configurePosterImageView()
    getData()
  }
  
  private func configurePosterImageView() {
    posterImageVIew.clipsToBounds = true
    posterImageVIew.layer.cornerRadius = 40
  }
 
  
  private func getData() {
    print("detailVC id \(id)")
    MovieNetworkManager.getDetailMovieData(id: id) { (movies) in
      if let image = movies.posterPath {
        self.posterImageVIew.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(image)"))
        self.posterPath = image
      } else {
        print("image가 없습니다.")
      }
      self.titleLabel.text = movies.title
      self.averageLabel.text = "⭐\(movies.average)"
      self.overviewLabel.text = movies.overview
    }
  }
  
  @IBAction func pencilBtnTap(_ sender: Any) {
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    let composeVC = storyboard.instantiateViewController(withIdentifier: "ComposeVC")
    guard let composeVC = self.storyboard?.instantiateViewController(identifier: "ComposeVC") as? ComposeViewController else { return }
    composeVC.posterImageString = posterPath
    composeVC.modalPresentationStyle = .fullScreen
    self.present(composeVC, animated: true, completion: nil)
  }
  
  @IBAction func cancelBtnTap(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
}
