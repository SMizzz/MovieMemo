//
//  MovieAPI.swift
//  MovieMemo
//
//  Created by 신미지 on 2021/07/10.
//

import Moya

enum MovieAPI {
  case upComing
  case topRated
  case nowPlaying
  case detail(id: Int)
}

extension MovieAPI: TargetType {
  var baseURL: URL {
    guard let url = URL(string: "https://api.themoviedb.org/3/movie") else { fatalError("url error") }
    return url
  }
  
  var path: String {
    switch self {
    case .upComing:
      return "/upcoming"
    case .topRated:
      return "/top_rated"
    case .nowPlaying:
      return "/now_playing"
    case .detail(let id):
      return "/\(id)"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .upComing, .topRated, .nowPlaying, .detail(_):
      return .get
    }
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    switch self {
    case .upComing, .topRated, .nowPlaying:
      return .requestParameters(
        parameters: ["api_key": "1f2d99c9366d63893dfedd75762e09ba"],
        encoding: URLEncoding.queryString)
    case .detail(let id):
      return .requestParameters(
        parameters: [
          "api_key": "1f2d99c9366d63893dfedd75762e09ba",
          "movie_id": id],
        encoding: URLEncoding.queryString)
    }
  }
  
  var headers: [String : String]? {
    return ["Content-Type": "application/json"]
  }
}
