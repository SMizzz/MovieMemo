//
//  SectionTwoTableViewCell.swift
//  MovieMemo
//
//  Created by 신미지 on 2021/07/19.
//

import UIKit

class SectionTwoTableViewCell: UITableViewCell {
  
  @IBOutlet weak var collectionView: UICollectionView!
  var topRated = [Movie]()
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

    collectionView.register(UINib(nibName: "SectionTwoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SectionTwoCollectionViewCell")
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  func config(with movie: [Movie]) {
    self.topRated = movie
    collectionView.reloadData()
  }
}

extension SectionTwoTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return topRated.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionTwoCollectionViewCell", for: indexPath) as! SectionTwoCollectionViewCell
    if let image = topRated[indexPath.item].posterPath {
      cell.posterImageView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(image)"))
    } else {
      print("이미지가 없습니다.")
    }
//    cell.backgroundColor = .purple
//    cell.posterImageView.image = UIImage(named: "harrypotter")
    return cell
  }
}

extension SectionTwoTableViewCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//    let width = collectionView.safeAreaLayoutGuide.layoutFrame.width
//    let height = collectionView.safeAreaLayoutGuide.layoutFrame.height
    return CGSize(width: collectionView.frame.size.width / 3, height: 350)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 5
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 5
  }
}
