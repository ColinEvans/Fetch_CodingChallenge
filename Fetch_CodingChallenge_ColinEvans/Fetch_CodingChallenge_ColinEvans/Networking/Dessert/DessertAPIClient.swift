//
//  DessertAPIClient.swift
//  Fetch_CodingChallenge_ColinEvans
//
//  Created by Colin Evans on 2024-02-13.
//

import Foundation
import Combine

/// API Client for the `https://themealdb.com/api/json/v1/1/filter.php?c=Dessert` endpoint
struct DessertAPIClient {
  let desserts = PassthroughSubject<[Dessert], Never>()
  let errorStream = PassthroughSubject<String, Never>()

  private let request: DessertHTTPRequest
  private let client: HTTPClientProviding
  
  init(request: DessertHTTPRequest, client: HTTPClientProviding) {
    self.request = request
    self.client = client
  }
  
  
  func getDesserts() async {
    do {
      let result = try await client.response(for: request)
      let sortedResults = result.meals.sorted(by: { $0.strMeal < $1.strMeal })
      desserts.send(sortedResults)
    } catch let error as HTTPError {
      errorStream.send(String(describing: error))
    } catch {
      errorStream.send(error.localizedDescription)
    }
  }
}

// MARK: - Extensions: SwiftUI Preview
extension DessertAPIClient {
  static func preview() -> DessertAPIClient {
    DessertAPIClient(
      request: DessertHTTPRequest(baseURL: "www.example.com"),
      client: HTTPClientMock()
    )
  }
}
