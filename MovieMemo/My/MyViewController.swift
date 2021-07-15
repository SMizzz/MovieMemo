//
//  MyViewController.swift
//  MovieMemo
//
//  Created by 신미지 on 2021/07/07.
//

import UIKit

class MyViewController: UIViewController {
  
  @IBOutlet weak var memoCollectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureCollectionView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    DataManager.shared.fetchMemo()
    self.memoCollectionView.reloadData()
  }
  
  private func configureCollectionView() {
    memoCollectionView.delegate = self
    memoCollectionView.dataSource = self
  }
  
  
}

extension MyViewController:
  UICollectionViewDelegate,
  UICollectionViewDataSource,
  UICollectionViewDelegateFlowLayout {
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return DataManager.shared.memoData.count
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    guard let cell = memoCollectionView.dequeueReusableCell(withReuseIdentifier: "MemoCell", for: indexPath) as? MemoCell else { return UICollectionViewCell() }
    let memo = DataManager.shared.memoData[indexPath.item]
    cell.titleLabel.text = memo.title
    if let image = memo.posterImage {
      cell.posterImageView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(image)"))
    } else {
      cell.posterImageView.image = UIImage(named: "harrypotter")
      print("이미지가 없습니다.")
    }
    return cell
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    return CGSize(width: view.frame.width, height: 590)
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int
  ) -> CGFloat {
    return 20.0
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    didSelectItemAt indexPath: IndexPath
  ) {
    print("did select item")
  }
}
