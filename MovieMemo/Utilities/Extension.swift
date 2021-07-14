//
//  Extension.swift
//  MovieMemo
//
//  Created by 신미지 on 2021/07/06.
//

import UIKit

extension UINavigationBar {
  func transparentNavigationBar() {
    self.setBackgroundImage(UIImage(), for: .default)
    self.shadowImage = UIImage()
    self.isTranslucent = true
  }
}

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

struct ModalVC {
  static func AlertVC(title: String, msg: String, action: ((UIAlertAction) -> Void)?, view: UIViewController) {
    let alertVC = UIAlertController(title: title, message: msg, preferredStyle: .alert)
    let okBtn = UIAlertAction(title: "OK", style: .default, handler: action)
    let cancelBtn = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    alertVC.addAction(okBtn)
    alertVC.addAction(cancelBtn)
    view.present(alertVC, animated: true, completion: nil)
  }
  
  static func ActionSheetVC(title: String, msg: String, action: ((UIAlertAction) -> Void)?, view: UIViewController) {
    let alertVC = UIAlertController(title: title, message: msg, preferredStyle: .actionSheet)
    let okBtn = UIAlertAction(title: "OK", style: .default, handler: action)
    let cancelBtn = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    alertVC.addAction(okBtn)
    alertVC.addAction(cancelBtn)
    view.present(alertVC, animated: true, completion: nil)
  }
}
