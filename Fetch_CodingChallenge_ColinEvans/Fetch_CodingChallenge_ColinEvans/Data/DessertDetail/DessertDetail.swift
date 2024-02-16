//
//  DessertDetail.swift
//  Fetch_CodingChallenge_ColinEvans
//
//  Created by Colin Evans on 2024-02-14.
//

import Foundation

/// Models the detail for each `Dessert` from the `lookup` API endpoint
struct DessertDetail: Codable {
  let idMeal: String?
  let strMeal: String?
  let strDrinkAlternate: String?
  let strCategory: String?
  let strArea: String?
  let strInstructions: String?
  let strMealThumb: String?
  let strTags: String?
  let strYoutube: String?
  let strIngredient1: String?
  let strIngredient2: String?
  let strIngredient3: String?
  let strIngredient4: String?
  let strIngredient5: String?
  let strIngredient6: String?
  let strIngredient7: String?
  let strIngredient8: String?
  let strIngredient9: String?
  let strIngredient10: String?
  let strIngredient11: String?
  let strIngredient12: String?
  let strIngredient13: String?
  let strIngredient14: String?
  let strIngredient15: String?
  let strIngredient16: String?
  let strIngredient17: String?
  let strIngredient18: String?
  let strIngredient19: String?
  let strIngredient20: String?
  let strMeasure1: String?
  let strMeasure2: String?
  let strMeasure3: String?
  let strMeasure4: String?
  let strMeasure5: String?
  let strMeasure6: String?
  let strMeasure7: String?
  let strMeasure8: String?
  let strMeasure9: String?
  let strMeasure10: String?
  let strMeasure11: String?
  let strMeasure12: String?
  let strMeasure13: String?
  let strMeasure14: String?
  let strMeasure15: String?
  let strMeasure16: String?
  let strMeasure17: String?
  let strMeasure18: String?
  let strMeasure19: String?
  let strMeasure20: String?
  let strSource: String?
  let strImageSource: String?
  let strCreativeCommonsConfirmed: String?
  let dateModified: String?
}

// MARK: - Extensions: Utilities
extension DessertDetail {
  /// Groups all of the possible ingredients, filtering `nil` values
  /// - returns: an array of `String` ingredients with `nil` values removed
  func getAllIngredients() -> [String] {
    [
      self.strIngredient1,
      self.strIngredient2,
      self.strIngredient3,
      self.strIngredient4,
      self.strIngredient5,
      self.strIngredient6,
      self.strIngredient7,
      self.strIngredient8,
      self.strIngredient9,
      self.strIngredient10,
      self.strIngredient11,
      self.strIngredient12,
      self.strIngredient13,
      self.strIngredient14,
      self.strIngredient15,
      self.strIngredient16,
      self.strIngredient17,
      self.strIngredient18,
      self.strIngredient19,
      self.strIngredient20
    ].compactMap( { $0 } )
  }
  
  /// Groups all of the possible measurements, filtering `nil` values
  /// - returns: an array of `String` measurements with `nil` values removed
  func getAllMeasurements() -> [String] {
    [
      self.strMeasure1,
      self.strMeasure2,
      self.strMeasure3,
      self.strMeasure4,
      self.strMeasure5,
      self.strMeasure6,
      self.strMeasure7,
      self.strMeasure8,
      self.strMeasure9,
      self.strMeasure10,
      self.strMeasure11,
      self.strMeasure12,
      self.strMeasure13,
      self.strMeasure14,
      self.strMeasure15,
      self.strMeasure16,
      self.strMeasure17,
      self.strMeasure18,
      self.strMeasure19,
      self.strMeasure20
    ].compactMap( { $0 } )
  }
  
}

// MARK: - Extensions: SwiftUI Preview
extension DessertDetail {
  static func preview() -> DessertDetail {
    DessertDetail(
      idMeal: "42",
      strMeal: "Preview",
      strDrinkAlternate: nil,
      strCategory: nil,
      strArea: nil,
      strInstructions: "Some preview instructions on how to make a preview dish",
      strMealThumb: nil,
      strTags: nil,
      strYoutube: nil,
      strIngredient1: "Flour",
      strIngredient2: "Flower",
      strIngredient3: "Butter",
      strIngredient4: "Sugar",
      strIngredient5: "Honey",
      strIngredient6: "Magic",
      strIngredient7: nil,
      strIngredient8: nil,
      strIngredient9: nil,
      strIngredient10: nil,
      strIngredient11: nil,
      strIngredient12: nil,
      strIngredient13: nil,
      strIngredient14: nil,
      strIngredient15: nil,
      strIngredient16: nil,
      strIngredient17: nil,
      strIngredient18: nil,
      strIngredient19: nil,
      strIngredient20: nil,
      strMeasure1: "1/2 cup",
      strMeasure2: "1 bouquet",
      strMeasure3: "1/4 stick",
      strMeasure4: "1/3 cup",
      strMeasure5: "1 Tsp",
      strMeasure6: "Imagination",
      strMeasure7: nil,
      strMeasure8: nil,
      strMeasure9: nil,
      strMeasure10: nil,
      strMeasure11: nil,
      strMeasure12: nil,
      strMeasure13: nil,
      strMeasure14: nil,
      strMeasure15: nil,
      strMeasure16: nil,
      strMeasure17: nil,
      strMeasure18: nil,
      strMeasure19: nil,
      strMeasure20: nil,
      strSource: nil,
      strImageSource: nil,
      strCreativeCommonsConfirmed: nil,
      dateModified: nil
    )
  }
}
