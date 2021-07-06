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
  
  var method: Method {
    <#code#>
  }
  
  var sampleData: Data {
    <#code#>
  }
  
  var task: Task {
    <#code#>
  }
  
  var headers: [String : String]? {
    <#code#>
  }
  
  
}
