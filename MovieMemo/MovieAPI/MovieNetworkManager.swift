//
//  MovieNetworkManager.swift
//  MovieMemo
//
//  Created by 신미지 on 2021/07/10.
//

import Moya
import SwiftyJSON

class MovieNetworkManager {
  static let provider = MoyaProvider<MovieAPI>()
  static func getMovieData(
    source: MovieAPI,
    completion: @escaping([Movie]) -> ()
  ) {
    provider.request(source) { (result) in
      switch result {
      case .success(let res):
        do {
          let movieData = try JSONDecoder().decode(MovieDataStore.self, from: res.data)
          completion(movieData.results)
        } catch let err {
          print(err.localizedDescription)
          return
        }
      case .failure(let err):
        print(err.localizedDescription)
        return
      }
    }
  }
  
  static func getDetailMovieData(
    id: Int,
    completion: @escaping([Movie]) -> ()
  ) {
    provider.request(.detail(id: id)) { (result) in
      switch result {
      case .success(let res):
        print("status code is \(res.response?.statusCode)")
        do {
          let movieData = try JSONDecoder().decode([Movie].self, from: res.data)
          completion(movieData)
        } catch let error {
          print(error)
          print(error.localizedDescription)
        }
      case .failure(let err):
        print(err.localizedDescription)
        return
      }
    }
  }
}
