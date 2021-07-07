//
//  User.swift
//  MovieMemo
//
//  Created by 신미지 on 2021/07/07.
//

import Foundation

struct User: Codable {
  var role: String = ""
  var id: String = ""
  var name: String = ""
  var email: String = ""
  var source: String = ""
  var createdAt: String = ""
  var updatedAt: String = ""
  var avatar: String = ""
  
  enum CodingKeys: String, CodingKey {
    case role
    case id = "_id"
    case name
    case email
    case source
    case createdAt
    case updatedAt
    case avatar
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    role = try values.decode(String.self, forKey: .role)
    id = try values.decode(String.self, forKey: .id)
    name = try values.decode(String.self, forKey: .name)
    email = try values.decode(String.self, forKey: .email)
    source = try values.decode(String.self, forKey: .source)
    createdAt = try values.decode(String.self, forKey: .createdAt)
    updatedAt = try values.decode(String.self, forKey: .updatedAt)
    avatar = try values.decode(String.self, forKey: .avatar)
  }
}
