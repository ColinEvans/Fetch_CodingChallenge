//
//  URL_Extensions.swift
//  Fetch_CodingChallenge_ColinEvans
//
//  Created by Colin Evans on 2024-02-09.
//

import Foundation

extension URL {
  func addQueryItems(for parameters: [String : String]) -> URL {
    let queryParameters = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    return self.appending(queryItems: queryParameters)
  }
}
