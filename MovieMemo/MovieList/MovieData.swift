//
//  MovieData.swift
//  MovieMemo
//
//  Created by 신미지 on 2021/07/07.
//

import Foundation

struct Movie: Codable {
  var id: Int = 0
  var backdropPath: String = ""
  var posterPath: String? = ""
  var title: String = ""
  var overview: String = ""
  var average: Float = 0.0
  
  enum CodingKeys: String, CodingKey {
    case id = "id"
    case backdropPath = "backdrop_path"
    case posterPath = "poster_path"
    case title = "title"
    case overview
    case average = "vote_average"
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    id = try values.decode(Int.self, forKey: .id)
    backdropPath = try values.decode(String.self, forKey: .backdropPath)
    posterPath = try? values.decode(String.self, forKey: .posterPath)
    title = try values.decode(String.self, forKey: .title)
    overview = try values.decode(String.self, forKey: .overview)
    average = try values.decode(Float.self, forKey: .average)
  }
}

struct MovieDataStore: Codable {
  var results: [Movie]
}
