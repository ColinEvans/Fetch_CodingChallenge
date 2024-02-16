//
//  DessertDetailViewModel.swift
//  Fetch_CodingChallenge_ColinEvans
//
//  Created by Colin Evans on 2024-02-14.
//

import Foundation

class DessertDetailViewModel: ObservableObject {
  @Published var dessertDetail: DessertDetail?
  @Published var ingredientMeasurements = [IngredientMeasurement]()
  @Published var error: String?

  private let detailAPIClient: DessertDetailAPIClient

  init(id: String, client: some HTTPClientProviding) {
    self.detailAPIClient = DessertDetailAPIClient(
      request: DessertDetailHTTPRequest(baseURL: URLString.lookup, parameters: ["i" : id]),
      client: client
    )
  }
  
  // MARK: - Public Functions
  func getDetail() async {
    do {
      let detailView = try await detailAPIClient.getDetail()
      await MainActor.run { [unowned self] in
        self.dessertDetail = detailView
        self.ingredientMeasurements = self.getIngredients()
      }
    } catch let error as HTTPError {
      await MainActor.run { [unowned self] in
        self.error = String(describing: error)
      }
    } catch {
      await MainActor.run { [unowned self] in
        self.error = error.localizedDescription
      }
    }
  }
  
  func isLastIngredient(for ingredientMeasurement: IngredientMeasurement) -> Bool {
    guard !ingredientMeasurements.isEmpty,
          let index = ingredientMeasurements.firstIndex(where: { $0.id == ingredientMeasurement.id })
      else { return false }
    
    return index == ingredientMeasurements.count - 1
  }
  
  
  // MARK: - Private functions
  private func getIngredients() -> [IngredientMeasurement] {
    guard let dessertDetail else {
      return []
    }
    
    // Assumption: - Each ingredient has a matching measurement
    let ingredients = dessertDetail.getAllIngredients().filter { !$0.isEmpty }
    let measurements = dessertDetail.getAllMeasurements().filter { !$0.isEmpty }
    
    var ingredientMeasurements = [IngredientMeasurement]()
    for index in (0..<ingredients.count) {
      ingredientMeasurements.append(
        IngredientMeasurement(
          ingredient: ingredients[index],
          measurement: measurements[index]
        )
      )
    }
    
    return ingredientMeasurements
  }
}
