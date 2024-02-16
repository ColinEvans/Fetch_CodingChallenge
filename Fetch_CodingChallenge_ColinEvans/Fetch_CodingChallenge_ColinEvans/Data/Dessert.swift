//
//  Dessert.swift
//  Fetch_CodingChallenge_ColinEvans
//
//  Created by Colin Evans on 2024-02-13.
//

import Foundation

/// Raw decodable data modelling the `filter` API endpoint
struct DessertRawRepresentable: Codable {
  let meals: [Dessert]
}

/// Models each Dessert Item from `filter` API endpoint
struct Dessert: Codable, Identifiable {
  var id: Int {
    Int(idMeal) ?? 0
  }

  let strMeal: String
  let strMealThumb: String
  let idMeal: String
}

// MARK: - Extensions<Hashable>
extension Dessert: Hashable {}

// MARK: - Extensions SwiftUI Preview
extension Dessert {
  static func preview() -> Dessert {
    Dessert(strMeal: "Preview", strMealThumb: "", idMeal: "1337")
  }
}
