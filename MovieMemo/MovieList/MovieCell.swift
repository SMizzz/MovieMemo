//
//  MovieCell.swift
//  MovieMemo
//
//  Created by 신미지 on 2021/07/10.
//

import UIKit

class MovieCell: UITableViewCell {

  @IBOutlet weak var posterPath: UIImageView!
  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var average: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
