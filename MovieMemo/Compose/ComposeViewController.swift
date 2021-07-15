//
//  ComposeViewController.swift
//  MovieMemo
//
//  Created by 신미지 on 2021/07/13.
//

import UIKit

class ComposeViewController: UIViewController {
  @IBOutlet weak var titleTextField: UITextField!
  @IBOutlet weak var memoTextView: UITextView!
  
  let formatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .long
    dateFormatter.timeStyle = .short
    dateFormatter.locale = Locale(identifier: "ko")
    return dateFormatter
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    titleTextField.autocorrectionType = .no
    memoTextView.autocorrectionType = .no
  }
  
  @IBAction func cancelBtnTap(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
  
  @IBAction func saveBtnTap(_ sender: Any) {
    let nowDate = Date()
    guard let title = titleTextField.text,
          let memo = memoTextView.text else { return }
    DataManager.shared.addNewMemp(title, memo, nowDate)
    self.dismiss(animated: true, completion: nil)
  }
}
