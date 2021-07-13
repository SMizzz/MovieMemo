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
  @IBOutlet weak var averageTitle: UILabel!
  @IBOutlet weak var overviewLabel: UILabel!
//  var selectedIndexPath: IndexPath!
  var id: Int = 0

  override func viewDidLoad() {
    super.viewDidLoad()
//    UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    getData()
//    navigationController?.navigationBar.isHidden = true
    navigationController?.navigationBar.isTranslucent = true
  }
  
  private func getData() {
    print("detailVC id \(id)")
    MovieNetworkManager.getDetailMovieData(id: id) { (movies) in
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
