//
//  HTTPClientMock.swift
//  Fetch_CodingChallenge_ColinEvans
//
//  Created by Colin Evans on 2024-02-15.
//

import Foundation

struct HTTPClientMock: HTTPClientProviding {
  private let mockDessert: Data? = try? JSONEncoder().encode(Dessert.preview())
  private let mockDessertDetail: Data? = try? JSONEncoder().encode(DessertDetailRawRepresentable.preview())
  
  func response<Request: HTTPRequest>(for request: Request) async throws -> Request.HTTPResponse {
    var data: Data?
    if type(of: Request.HTTPResponse.self) == Dessert.self {
      data = mockDessert
    } else {
      data = mockDessertDetail
    }
    
    guard let data else {
      throw HTTPError.invalidData
    }
    
    return try JSONDecoder().decode(Request.HTTPResponse.self, from: data)    
  }
}
