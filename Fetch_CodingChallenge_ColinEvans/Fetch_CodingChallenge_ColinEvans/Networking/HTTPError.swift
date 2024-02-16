//
//  HTTPError.swift
//  Fetch_CodingChallenge_ColinEvans
//
//  Created by Colin Evans on 2024-02-13.
//

import Foundation

/// Models possible errors encountered when making an HTTPRequest
enum HTTPError: Error {
  case badResponse
  case invalidData
}

// MARK: - Extensions<CustomStringConvertible>
extension HTTPError: CustomStringConvertible {
  var description: String {
    switch self {
    case .badResponse:
      return "Bad response from the server."
    case .invalidData:
      return "Decoding data is invalid."
    }
  }
}
