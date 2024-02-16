//
//  DessertDetailHTTPRequest.swift
//  Fetch_CodingChallenge_ColinEvans
//
//  Created by Colin Evans on 2024-02-14.
//

import Foundation

struct DessertDetailHTTPRequest: HTTPRequest {
  typealias HTTPResponse = DessertDetailRawRepresentable
  
  let baseURL: String
  var parameters: [String : String]
  var headers =  [String : String]()
  
  init(baseURL: String, parameters: [String : String] = [:]) {
    self.baseURL = baseURL
    self.parameters = parameters
  }
}
