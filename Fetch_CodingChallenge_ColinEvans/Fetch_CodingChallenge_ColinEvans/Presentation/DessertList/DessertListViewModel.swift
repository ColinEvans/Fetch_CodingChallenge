//
//  DessertListViewModel.swift
//  Fetch_CodingChallenge_ColinEvans
//
//  Created by Colin Evans on 2024-02-12.
//

import Foundation
import Combine

class DessertListViewModel: ObservableObject {
  @Published var desserts = [Dessert]()
  @Published var errorString = ""
  
  private let client: DessertAPIClient
  private var cancellables = Set<AnyCancellable>()

  init(_ client: DessertAPIClient) {
    self.client = client
    client
      .desserts
      .receive(on: DispatchQueue.main)
      .sink { [unowned self] dessert in
        desserts = dessert
      }.store(in: &cancellables)
  }
  
  // MARK: - Public Functions
  func getDesserts() async {
    await client.getDesserts()
  }
}


extension DessertListViewModel {
  static func preview() -> DessertListViewModel {
    DessertListViewModel(.preview())
  }
}
