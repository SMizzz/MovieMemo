//
//  Extension.swift
//  MovieMemo
//
//  Created by 신미지 on 2021/07/06.
//

import UIKit

extension UIViewController {
  func setupTapGRForKeyboardDismissal() {
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(
      target: self,
      action: #selector(handleDismissKeyboard)
    )
    view.addGestureRecognizer(tap)
  }
  
  @objc func handleDismissKeyboard() {
    view.endEditing(true)
  }
}
