//
//  HTTPRequest.swift
//  Fetch_CodingChallenge_ColinEvans
//
//  Created by Colin Evans on 2024-02-12.
//

import Foundation

protocol HTTPRequest {
  associatedtype HTTPResponse: Decodable

  /// The endpoint string that will be appended to the client's base URL
  var baseURL: String { get }

  /// Possible HTTP parameters for the query string, defaults to an empty list
  var parameters: [String : String] { get }

  /// Possible HTTP headers, defaults to an empty list
  var headers: [String : String] { get }
}
