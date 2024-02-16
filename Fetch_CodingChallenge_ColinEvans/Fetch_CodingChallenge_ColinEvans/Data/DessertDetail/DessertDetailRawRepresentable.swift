//
//  DessertDetailRawRepresentable.swift
//  Fetch_CodingChallenge_ColinEvans
//
//  Created by Colin Evans on 2024-02-15.
//

import Foundation

/// Models the detail from the `lookup` API endpoint
struct DessertDetailRawRepresentable: Codable {
  let meals: [DessertDetail]
}

// MARK: - Extensions: SwiftUI Preview
extension DessertDetailRawRepresentable {
  static func preview() -> DessertDetailRawRepresentable {
    DessertDetailRawRepresentable(meals: [.preview()])
  }
}
