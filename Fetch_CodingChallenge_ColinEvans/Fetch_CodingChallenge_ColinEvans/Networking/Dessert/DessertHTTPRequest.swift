//
//  DessertHTTPRequest.swift
//  Fetch_CodingChallenge_ColinEvans
//
//  Created by Colin Evans on 2024-02-13.
//

import Foundation

struct DessertHTTPRequest: HTTPRequest {
  typealias HTTPResponse = DessertRawRepresentable
  
  let baseURL: String
  var parameters: [String : String]
  var headers =  [String : String]()
  
  init(baseURL: String, parameters: [String : String] = [:]) {
    self.baseURL = baseURL
    self.parameters = parameters
  }
}
