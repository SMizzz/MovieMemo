//
//  AuthAPI.swift
//  MovieMemo
//
//  Created by 신미지 on 2021/07/06.
//

import Moya

enum AuthAPI {
  case signup(name: String, email: String, password: String)
}

extension AuthAPI: TargetType {
  var baseURL: URL {
    guard let url = URL(string: "http://localhost:3000/users") else {
      fatalError("url error")
    }
    return url
  }
  
  var path: String {
    switch self {
    case .signup(_, _, _):
      return "/signup"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .signup(_, _, _):
      return .post
    default:
      return .get
    }
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    switch self {
    case .signup(let name, let email, let password):
      return .requestParameters(
        parameters: [
          "name": name,
          "email": email,
          "password": password],
        encoding: JSONEncoding.default)
    default:
      return .requestPlain
    }
  }
  
  var headers: [String : String]? {
    switch self {
    default:
      return ["Content-Type": "application/json"]
    }
  }
}
