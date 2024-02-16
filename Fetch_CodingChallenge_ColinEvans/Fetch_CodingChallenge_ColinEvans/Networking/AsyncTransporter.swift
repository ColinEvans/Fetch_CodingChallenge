//
//  AsyncTransporter.swift
//  Fetch_CodingChallenge_ColinEvans
//
//  Created by Colin Evans on 2024-02-12.
//

import Foundation

// MARK: - Extensions<AsyncTransport>
extension URLSession: AsyncTransport {
  func response(for request: URLRequest) async throws -> (Data, URLResponse) {
    try await self.data(for: request)
  }
}
