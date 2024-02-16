//
//  FetchAssembly.swift
//  Fetch_CodingChallenge_ColinEvans
//
//  Created by Colin Evans on 2024-02-13.
//

import Foundation

/// Dependency container that provides the application with what's needed to launch the window
struct FetchAssembly {
  private let dessertRequest = DessertHTTPRequest(
    baseURL: URLString.filter,
    parameters: ["c" : "Dessert"]
  )
  
  let client = HTTPClient()
  let dessertAPIClient: DessertAPIClient
  let contentViewModel: DessertListViewModel
  
  init() {
    dessertAPIClient = DessertAPIClient(request: dessertRequest, client: client)
    contentViewModel = DessertListViewModel(dessertAPIClient)
  }
}
