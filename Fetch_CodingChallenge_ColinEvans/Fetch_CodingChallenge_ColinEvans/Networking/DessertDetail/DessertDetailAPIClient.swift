//
//  DessertDetailAPIClient.swift
//  Fetch_CodingChallenge_ColinEvans
//
//  Created by Colin Evans on 2024-02-14.
//

import Foundation

/// API Client for the `https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID` endpoint
struct DessertDetailAPIClient {
  private let request: DessertDetailHTTPRequest
  private let client: HTTPClientProviding
  
  init(request: DessertDetailHTTPRequest, client: HTTPClientProviding) {
    self.request = request
    self.client = client
  }
  
  func getDetail() async throws -> DessertDetail {
    if let detailID = request.parameters["i"],
       let cachedValue = DessertDetailCache.shared.object(forKey: NSString(string: detailID)) {
      
      return cachedValue.value
    }
    
    let result = try await client.response(for: request).meals
    
    guard let detail = result.first else {
      throw HTTPError.invalidData
    }
    
    if let detailID = request.parameters["i"] {
      let wrapper = StructWrapper<DessertDetail>(detail)
      DessertDetailCache.shared.setObject(wrapper, forKey: NSString(string: detailID))
    }

    return detail
  }
}
