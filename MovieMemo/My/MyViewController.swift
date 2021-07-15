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
  
  
  @IBAction func filterBtnTap(_ sender: Any) {
  }
  
  
}

extension MyViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return DataManager.shared.memoData.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = memoCollectionView.dequeueReusableCell(withReuseIdentifier: "MemoCell", for: indexPath) as? MemoCell else { return UICollectionViewCell() }
    let memo = DataManager.shared.memoData[indexPath.item]
    cell.titleLabel.text = memo.title
    cell.posterImageView.image = UIImage(named: "harrypotter")
//    cell.imageBtn.setImage(UIImage(named: "harrypotter"), for: .normal)
//    cell.imageBtn.setImage(UIImage(named: "harrypotter"), for: .normal)
//    cell.titleLabel.text = "해리포터와 불사조 기사단을 보고 나서"
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 330, height: 590)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 20.0
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("did select item")
  }
}
