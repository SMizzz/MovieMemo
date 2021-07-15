//
//  MemoCell.swift
//  MovieMemo
//
//  Created by 신미지 on 2021/07/07.
//

import UIKit

class MemoCell: UICollectionViewCell {
  
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var imageBtn: UIButton!
  @IBOutlet weak var posterImageView: UIImageView!
  
  @IBAction func imageBtnTap(_ sender: Any) {
    print("image tapped!")
  }
}
