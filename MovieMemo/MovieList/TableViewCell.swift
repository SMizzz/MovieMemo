//
//  TableViewCell.swift
//  MovieMemo
//
//  Created by 신미지 on 2021/07/12.
//

import UIKit

class TableViewCell: UITableViewCell {

  @IBOutlet weak var imgView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var voteLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
