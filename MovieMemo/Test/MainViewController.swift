//
//  MainViewController.swift
//  MovieMemo
//
//  Created by 신미지 on 2021/07/19.
//

import UIKit

class MainViewController: UIViewController {
  var topRatedData = [Movie]()
  var upComingData = [Movie]()
  var nowPlayingData = [Movie]()
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
    getData()
  }
  
  private func configureTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 270
    
//    let commonCell = UINib(nibName: "TestTableViewCell", bundle: nil)
//    tableView.register(commonCell, forCellReuseIdentifier: "TestTableViewCell")
    
  }
  
  private func getData() {
    MovieNetworkManager.getMovieData(source: .nowPlaying) { (movie) in
      self.nowPlayingData = movie
      OperationQueue.main.addOperation {
        self.tableView.reloadData()
      }
    }
    
    MovieNetworkManager.getMovieData(source: .topRated) { (movie) in
      self.topRatedData = movie
      OperationQueue.main.addOperation {
        self.tableView.reloadData()
      }
    }
  }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.section == 0 {
      let nowPlayingCell = tableView.dequeueReusableCell(withIdentifier: "TestTableViewCell", for: indexPath) as! TestTableViewCell
    nowPlayingCell.config(with: nowPlayingData)
//      let nowPlaying = nowPlayingData[indexPath.item]
      return nowPlayingCell
    } else if indexPath.section == 1 {
      let sectionTwoCell = tableView.dequeueReusableCell(withIdentifier: "SectionTwoTableViewCell", for: indexPath) as! SectionTwoTableViewCell
      sectionTwoCell.config(with: topRatedData)
      return sectionTwoCell
    }
    return UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 270
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    if section == 1 {
      return 40
    }
    return 0
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
    view.backgroundColor = .white
    let label = UILabel(frame: CGRect(x: 8, y: 4, width: view.bounds.size.width - 16, height: view.bounds.size.height - 8))
    label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    label.font = UIFont.systemFont(ofSize: 15)
    label.textColor = .lightGray
    view.addSubview(label)
    if section == 1 {
      label.text = "Top Rated"
    }
    return view
  }
}
