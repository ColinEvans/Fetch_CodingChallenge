//
//  IngredientMeasurement.swift
//  Fetch_CodingChallenge_ColinEvans
//
//  Created by Colin Evans on 2024-02-15.
//

import Foundation

/// Models an ingredient and measurement pairing from the `lookup` API endpoint
/// each ingredient has an associated measurement based off of its position in the result
struct IngredientMeasurement: Identifiable {
  let id: String = UUID().uuidString
  let ingredient: String
  let measurement: String
}
