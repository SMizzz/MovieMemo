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
  var detailMovieData = [Movie]()

  override func viewDidLoad() {
    super.viewDidLoad()
    getData()
  }
  
  override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)

      // Make the navigation bar background clear
      navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
      navigationController?.navigationBar.shadowImage = UIImage()
      navigationController?.navigationBar.isTranslucent = true
  }

  override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)

      // Restore the navigation bar to default
      navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
      navigationController?.navigationBar.shadowImage = nil
  }
  
  private func getData() {
    print("detailVC id \(id)")
    MovieNetworkManager.getDetailMovieData(id: id) { (movies) in
      if let image = movies.posterPath {
        self.posterImageVIew.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(image)"))
      } else {
        print("image가 없습니다.")
      }
      self.titleLabel.text = movies.title
      self.averageLabel.text = "⭐\(movies.average)"
      self.overviewLabel.text = movies.overview
    }
  }
  
  @IBAction func pencilBtnTap(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let composeVC = storyboard.instantiateViewController(withIdentifier: "ComposeVC")
    self.present(composeVC, animated: true, completion: nil)
  }
  
  @IBAction func cancelBtnTap(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
}
