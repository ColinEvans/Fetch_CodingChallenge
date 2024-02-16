//
//  URLString.swift
//  Fetch_CodingChallenge_ColinEvans
//
//  Created by Colin Evans on 2024-02-09.
//

import Foundation

// See: https://themealdb.com/api.php for the full API
enum URLString {
  private static let base = "https://themealdb.com/api/json/v1/1/"
  static let filter = "\(Self.base)filter.php"
  static let lookup = "\(Self.base)lookup.php"
}
