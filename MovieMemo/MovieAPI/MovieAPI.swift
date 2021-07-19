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
  case movieSearch(query: String)
  case tvSearch(query: String)
}

extension MovieAPI: TargetType {
  var baseURL: URL {
    guard let url = URL(string: "https://api.themoviedb.org/3") else { fatalError("url error") }
    return url
  }
  
  var path: String {
    switch self {
    case .upComing:
      return "/movie/upcoming"
    case .topRated:
      return "/movie/top_rated"
    case .nowPlaying:
      return "/movie/now_playing"
    case .detail(let id):
      return "/movie/\(id)"
    case .movieSearch(_):
      return "/search/movie"
    case .tvSearch(_):
      return "/search/tv"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .upComing, .topRated, .nowPlaying, .detail(_), .movieSearch(_), .tvSearch(_):
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
        parameters: [
          "api_key": "1f2d99c9366d63893dfedd75762e09ba",
          "language": "ko"],
        encoding: URLEncoding.queryString)
    case .detail(let id):
      return .requestParameters(
        parameters: [
          "api_key": "1f2d99c9366d63893dfedd75762e09ba",
          "language": "ko",
          "movie_id": id],
        encoding: URLEncoding.queryString)
    case .movieSearch(let query), .tvSearch(let query):
      return .requestParameters(
        parameters: [
          "api_key": "1f2d99c9366d63893dfedd75762e09ba",
          "query": query
        ], encoding: URLEncoding.queryString)
    }
  }
  
  var headers: [String : String]? {
    return ["Content-Type": "application/json"]
  }
}
